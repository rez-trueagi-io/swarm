def doN = \n. \f. if (n > 0) {f; doN (n - 1) f} {}; end;

def getBaseForNumber = \n.
    if (n == 0) {
        return "guanine";
    } {
        if (n == 1) {
            return "cytosine";
        } {
            if (n == 2) {
                return "adenine";
            } {
                return "thymine";
            };
        };
    };
    end;

def getNumberForBase = \n.
    if (n == "guanine") {
        return 0;
    } {
        if (n == "cytosine") {
            return 1;
        } {
            if (n == "adenine") {
                return 2;
            } {
                return 3;
            };
        };
    };
    end;

def getComplementNumber = \n.
    if (n == 0) {
        return 1;
    } {
        if (n == 1) {
            return 0;
        } {
            if (n == 2) {
                return 3;
            } {
                return 2;
            };
        };
    };
    end;


def waitWhileHere = \item.
    stillHere <- ishere item;
    if stillHere {
        wait 2;
        waitWhileHere item;
    } {};
    end;

def waitUntilHere = \item.
    hereNow <- ishere item;
    if hereNow {} {
        wait 2;
        waitUntilHere item;
    };
    end;

def myStandby =
    teleport self (1, -4);
    _flower <- grab;
    teleport self (3, -11);
    waitWhileHere "bit (0)";
    teleport self (36, -11);
    turn back;
    end;

def waitForItem : dir -> cmd text = \d.
    item <- scan d;
    case item (\_. waitForItem d) return;
    end;

def placeComplements = \n.
    if (n > 0) {
        item <- waitForItem left;
        baseNumber <- getNumberForBase item;
        complementNumber <- getComplementNumber baseNumber;
        newItem <- getBaseForNumber complementNumber;
        create newItem;
        place newItem;
        move;
        placeComplements $ n - 1;
    } {
        selfdestruct;
    };
    end;

def placeBase = \standbyFunc. \n. 

    if (n > 0) {

        idx <- random 4;
        entTemp <- getBaseForNumber idx;
        let ent = entTemp in
        place ent;
        move;

        placeBase standbyFunc $ n - 1;

        place ent;
        move;
    } {
        standbyFunc;
        
    };
    end;

def spawnComplementer =
    create "treads";
    create "scanner";
    _buddy <- build {
        turn right;
        move;
        turn left;
        placeComplements 32;
    };
    end;

def makeDnaStrand =
    teleport self (5, -2);
    spawnComplementer;
    placeBase myStandby 32;
    end;

def go =
    waitUntilHere "flower";
    makeDnaStrand;
    end;

go;