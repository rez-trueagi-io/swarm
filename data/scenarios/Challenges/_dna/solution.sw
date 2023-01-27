
def doN = \n. \f. if (n > 0) {f; doN (n - 1) f} {}; end;

def waitWhileHere = \item.
    stillHere <- ishere item;
    if stillHere {
        waitWhileHere item;
    } {};
    end;

def moveToPattern =
    turn back;
    move;
    turn right;
    doN 2 move;
    turn right;
    doN 5 move;
    end;

def moveToOtherRow =
    turn right;
    doN 9 move;
    turn right;
    move;
    end;


/**
Store the observed entities in the recursion stack.
*/
def replicatePattern = \standbyFunc. \n.
    if (n > 0) {
        _thing <- scan down;
        move;
        replicatePattern standbyFunc $ n - 1;
    } {
        standbyFunc;
    }
    end;

def go =
    move;

    let sentinel = "flower" in
    place sentinel;
    waitWhileHere sentinel;
    moveToPattern;
    replicatePattern moveToOtherRow 32;
    end;

go;