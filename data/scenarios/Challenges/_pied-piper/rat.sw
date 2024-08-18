def findGoodDirection =
    isBlocked <- blocked;
    if isBlocked {
        turn left;
        findGoodDirection;
    } {};
    end;

def moveUntilBlocked =
    isBlocked <- blocked;
    if isBlocked {
    } {
        move;
        moveUntilBlocked;
    };
    end;

def pauseAtRandom =
    r <- random 3;
    if (r == 0) {
        r2 <- random 8;
        wait $ 4 + r2;
    } {}
    end;

def doMovement =
    findGoodDirection;
    moveUntilBlocked;
    pauseAtRandom
    end;

def go =
    doMovement;
    go;
    end;

go;