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


def placeBase = \n.

    if (n > 0) {

        idx <- random 4;
        ent <- getBaseForNumber idx;
        place ent;
        move;

        placeBase $ n - 1;

        place ent;
        move;
    } {
        teleport self (5, -11);
    };
    end;

def makeDnaStrand =
    teleport self (5, -2);
    placeBase 4;
    // placeBase 32;

    end;

def go =
    waitForFlower;
    makeDnaStrand;
    end;

go;