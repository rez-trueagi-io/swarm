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


def waitForFlower =
    flowerHere <- ishere "flower";
    if flowerHere {} {
        wait 2;
        waitForFlower;
    };
    end;

def myStandby =
    teleport self (1, -4);
    _flower <- grab;
    teleport self (36, -11);
    turn back;
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

def makeDnaStrand =
    teleport self (5, -2);
    placeBase myStandby 32;

    end;

def go =
    waitForFlower;
    makeDnaStrand;
    end;

go;