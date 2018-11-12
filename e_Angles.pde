float aAngle;
float bAngle;
float cAngle;
float dAngle;
float eAngle;
float fAngle;
float gAngle;
float hAngle;
float angleRange = 25;
float minimumCheckScore = 3;

void getAngles() {
  aAngle = getAngle("a");
  bAngle = getAngle("b");
  cAngle = getAngle("c");
  dAngle = getAngle("d");
  eAngle = getAngle("e");
  fAngle = getAngle("f");
  gAngle = getAngle("g");
  hAngle = getAngle("h");
}

boolean checkAngles() {
  //Angles retrieval
  getAngles();

  //Score is set to 0 before iteration on every angle
  int score = 0;

  //Character data retrieval
  Character character = characters[currentCharacter];
  int angles[] = character.angles;

  //Angles check (TO REWRITE IN A MORE GENERIC WAY)
  if (aAngle > (angles[0] - angleRange) && aAngle < (angles[0] + angleRange)) {
    score++;
  }
  if (bAngle > (angles[1] - angleRange) && bAngle < (angles[1] + angleRange)) {
    score++;
  }
  if (cAngle > (angles[2] - angleRange) && cAngle < (angles[2] + angleRange)) {
    score++;
  }
  if (dAngle > (angles[3] - angleRange) && dAngle < (angles[3] + angleRange)) {
    score++;
  }
  if (eAngle > (angles[4] - angleRange) && eAngle < (angles[4] + angleRange)) {
    score++;
  }
  if (fAngle > (angles[5] - angleRange) && fAngle < (angles[5] + angleRange)) {
    score++;
  }
  if (gAngle > (angles[6] - angleRange) && gAngle < (angles[6] + angleRange)) {
    score++;
  }
  if (hAngle > (angles[7] - angleRange) && hAngle < (angles[7] + angleRange)) {
    score++;
  }

  //Score threadsold check
  if (score >= minimumCheckScore) {
    return true;
  }
  return false;
}

//Get angle between two vectors
float angleOf(PVector one, PVector two, PVector axis) {

  PVector limb = PVector.sub(two, one);
  return degrees(PVector.angleBetween(limb, axis));
}

