def doN = \n. \f. if (n > 0) {f; doN (n - 1) f} {}; end;

def makeOatsTrail =
  place "oats";
  doN 4 move;
  end;

def go =
  doN 5 makeOatsTrail;
  turn back;
  doN (5*4) move;
  turn back;
  end;

go;