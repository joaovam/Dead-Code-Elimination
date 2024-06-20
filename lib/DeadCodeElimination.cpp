#include "DeadCodeElimination.h"
#include "llvm/Transforms/Utils/Local.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/PassManager.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/Debug.h"
#include "llvm/Transforms/Utils/Local.h"
#include "llvm/Transforms/InstCombine/InstCombineWorklist.h"

//RecursivelyDeleteTriviallyDeadInstructions self explainatory


using namespace llvm;
#define DEBUG_TYPE "DeadCodeAnalysis"

STATISTIC(InstructionsEliminated, "Number of instructions eliminated");
STATISTIC(BasicBlocksEliminated,  "Number of basic blocks entirely eliminated");

DeadCodeElimination::PathToDelete DeadCodeElimination::solveICmpInstruction(ICmpInst* I, InterProceduralRA<Cousot> &ra) {


  Range r1 = ra.getRange(I->getOperand(0));
  Range r2 = ra.getRange(I->getOperand(1));

  PathToDelete del = PathToDelete::NONE;

  switch (I->getPredicate()){

    case CmpInst::ICMP_EQ:  ///< equal
      if(r1.getLower().eq(r2.getLower()) && r2.getUpper().eq(r2.getUpper()) && r1.getLower().eq(r1.getUpper())){//always true
        
        del = PathToDelete::FALSE;
      }else if(r1.getUpper().slt(r2.getLower()) || r1.getLower().sgt(r2.getUpper())){//always true
      del = PathToDelete::TRUE;
      }
    break;
    case CmpInst::ICMP_NE:  ///< not equal
      if(r1.getLower().eq(r1.getUpper()) && r2.getLower().eq(r2.getUpper()) && r1.getLower().eq(r2.getLower())){//always false
        //errs() << r1.getLower()""
        del = PathToDelete::FALSE;
      }else if(r1.getUpper().slt(r2.getLower()) || r1.getLower().sgt(r2.getUpper())){//always true
      del = PathToDelete::TRUE;
      }
    break;
    case CmpInst::ICMP_UGT: ///< unsigned greater than
      if(r1.getUpper().ule(r2.getUpper()))
        del = PathToDelete::TRUE;
      else if(r1.getLower().ugt(r2.getUpper()))
        del = PathToDelete::FALSE;
    break;
    case CmpInst::ICMP_UGE: ///< unsigned greater or equal
      if(r1.getUpper().ult(r2.getUpper()))
        del = PathToDelete::TRUE;
      else if(r1.getLower().uge(r2.getUpper()))
        del = PathToDelete::FALSE;
    break;
    case CmpInst::ICMP_ULT: ///< unsigned less than
      if(r1.getLower().uge(r2.getUpper()))
        del = PathToDelete::TRUE;
      else if(r1.getUpper().ult(r2.getLower()))
        del = PathToDelete::FALSE;
    break;
    case CmpInst::ICMP_ULE: ///< unsigned less or equal
      if(r1.getLower().ugt(r2.getUpper()))
        del = PathToDelete::TRUE;
      else if(r1.getUpper().ule(r2.getUpper()))
        del = PathToDelete::FALSE;
    break;
    case CmpInst::ICMP_SGT: ///< signed greater than
      if(r1.getUpper().sle(r2.getLower()))
        del = PathToDelete::TRUE;
      else if(r1.getLower().sgt(r2.getUpper()))
        del = PathToDelete::FALSE;
    break;
    case CmpInst::ICMP_SGE: ///< signed greater or equal
      if(r1.getUpper().slt(r2.getLower()))
        del = PathToDelete::TRUE;
      else if(r1.getLower().sge(r2.getUpper()))
        del = PathToDelete::FALSE;
    break;
    case CmpInst::ICMP_SLT: 
    if (r1.getLower().sge(r2.getUpper())) 
      del = PathToDelete::TRUE;
    else if (r1.getUpper().slt(r2.getLower()))
      del = PathToDelete::FALSE;
      
    break;
    case CmpInst::ICMP_SLE:
    if(r1.getLower().sgt(r2.getUpper()))
      del = PathToDelete::TRUE;
    else if(r1.getUpper().sle(r2.getLower()))
      del = PathToDelete::FALSE;
    break;
    default:
    break;
  }

  return del;
}

void DeadCodeElimination::deleteInstructions(){
  for(auto pair: instsToDelete){
    auto currentInst = pair.first;
    auto p = pair.second;
    
    if(p==PathToDelete::TRUE)
      currentInst->replaceAllUsesWith(ConstantInt::get(currentInst->getType(), 0));//Condition is always false
    else if(p == PathToDelete::FALSE)
      currentInst->replaceAllUsesWith(ConstantInt::get(currentInst->getType(), 1));//Condition is always true

    RecursivelyDeleteTriviallyDeadInstructions(currentInst);

  }
}


bool DeadCodeElimination::runOnFunction(Function &f){//returns if anything changed
    InterProceduralRA<Cousot>::ID=0;
    InterProceduralRA<Cousot> &ra = getAnalysis<InterProceduralRA<Cousot>>();


    if (f.isDeclaration() || f.empty())
      return false;
    
    for(Function::iterator bb = f.begin(),bbEnd = f.end();bb!=bbEnd; ++bb){
      for(BasicBlock::iterator I = bb->begin(), IEnd = bb->end(); I != IEnd;++I){
        if( auto bI = dyn_cast<BranchInst>(I)){//we have a branch inst

          if(bI->isConditional()){//conditionals can
            if(auto icmp = dyn_cast<ICmpInst>(bI->getCondition())){
              auto del = solveICmpInstruction(icmp, ra);
              switch (del)
              {
              case PathToDelete::TRUE:{
                auto next = bI->getSuccessor(0);
                InstructionsEliminated += next->size();
                BasicBlocksEliminated++;
              }

                
                break;
              case PathToDelete::FALSE:{
                auto next = bI->getSuccessor(1);
                InstructionsEliminated += next->size();
                BasicBlocksEliminated++;
              }
              break;
              default:
                break;
              }

              instsToDelete.push_back(make_pair(icmp, del));
            }
          }
        }
      }
    }
    deleteInstructions();
    removeUnreachableBlocks(f);
    return false;

}

void DeadCodeElimination::getAnalysisUsage(AnalysisUsage &AU) const {
    AU.setPreservesAll();
    AU.addRequired<InterProceduralRA<Cousot> >();
  }



char DeadCodeElimination::ID = 0;

static RegisterPass<DeadCodeElimination> X("dead-code-elimination",
                                "tool for implementing dead code elimination using range analysis");
