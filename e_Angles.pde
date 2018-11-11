float aAngle;
float bAngle;
float cAngle;
float dAngle;
float eAngle;
float fAngle;
float gAngle;
float hAngle;
float angleRange = 25;
float minimumCheckScore = 5;

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

void checkAngles() {
  int score = 0;
  for (int i = 0; i<charactersNumber; i++) {
    Character character = characters[i];
    int angles[] = character.angles;
    //println("Angle A" + aAngle);
    //   println("Range low =" + (angles[0] - angleRange));
    //   println("Range high =" + (angles[0] + angleRange));

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

    if (score >= minimumCheckScore) {
      textSize(36);
      text("YOU ARE : " + character.name, 100, 100);
    }
  }
}

//Generate the angle
float angleOf(PVector one, PVector two, PVector axis) {

  PVector limb = PVector.sub(two, one);
  return degrees(PVector.angleBetween(limb, axis));
}

