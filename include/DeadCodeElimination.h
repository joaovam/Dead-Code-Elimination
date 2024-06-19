#ifndef DEAD_CODE_ELIMINATION
#define DEAD_CODE_ELIMINATION

#include "llvm/Pass.h"
#include "llvm/PassAnalysisSupport.h"
#include "llvm/IR/User.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Value.h"
#include "llvm/Support/raw_ostream.h"

#include <cstdio>
#include <cstdlib>
#include <string>
#include <map>
#include <vector>


#include "RangeAnalysis.h"

using namespace std;

class DeadCodeElimination: public FunctionPass{
    
    public:
    enum PathToDelete:unsigned{
        TRUE,
        FALSE,
        NONE
    };
    static char ID;
    DeadCodeAnalysis() : FunctionPass(ID) {}
    virtual ~DeadCodeElimination(){}
    virtual bool runOnFunction(Function &F);
    virtual void getAnalysisUsage(AnalysisUsage &AU)const;
    
    private:
    std::vector<std::pair<ICmpInst*, PathToDelete>>instsToDelete;
    PathToDelete solveICmpInstruction(ICmpInst* I, InterProceduralRA<Cousot> &ra);
    void deleteInstructions();
    

};


#endif