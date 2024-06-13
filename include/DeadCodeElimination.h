#ifndef DEAD_CODE_ELIMINATION
#define DEAD_CODE_ELIMINATION

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
    virtual ~DeadCodeElimination(){}
    virtual bool runOnFunction(Function &F);
    virtual void getAnalysisUsage(AnalysisUsage &AU)const;
    
    private:
    std::vector<std::pair<ICmpInst*, PathToDelete>>instsToDelete;
    PathToDelete solveICmpInstruction(ICmpInst* I, InterProceduralRA<Cousot> &ra);
    void deleteInstructions();
    

};


#endif