PVector rightHand;
PVector rightElbow;
PVector rightShoulder;
PVector rightHip;
PVector rightHandVector = new PVector();
PVector rightElbowVector = new PVector();
PVector rightShoulderVector = new PVector();
PVector rightHipVector = new PVector();
PVector leftHand;
PVector leftElbow;
PVector leftShoulder;
PVector leftHip;
PVector leftHandVector = new PVector();
PVector leftElbowVector = new PVector();
PVector leftShoulderVector = new PVector();
PVector leftHipVector = new PVector();
PVector torsoOrientation;
PVector upperLeftArmOrientation;
PVector upperRightArmOrientation;
float angle;

float getAngle(String code) {
  angle = 0;
  if (code == "a") {
    if (rightElbow != null && rightShoulder != null) {
      angle = angleOf(rightElbow, rightShoulder, torsoOrientation);
    }
  } else if (code == "b") {
    if (rightHand != null && rightElbow != null) {
      return angleOf(rightHand, rightElbow, upperLeftArmOrientation);
    }
  } else if (code == "c") {
    if (leftShoulder != null && leftElbow != null) {
      return angleOf(leftShoulder, leftElbow, torsoOrientation);
    }
  } else if (code == "d") {
    if (leftElbow != null && leftHand != null) {
      return angleOf(leftElbow, leftHand, upperRightArmOrientation);
    }
  }
  return angle;
}

void displayAngles() {
  textSize(26);
} 


void initializeVectors(int userId, SimpleOpenNI kinectObject  ) {
  kinectObject.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_RIGHT_HAND, rightHandVector);
  rightHand = new PVector(rightHandVector.x, rightHandVector.y);
  kinectObject.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_RIGHT_ELBOW, rightElbowVector);
  rightElbow = new PVector(rightElbowVector.x, rightElbowVector.y);
  kinectObject.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, rightShoulderVector);
  rightShoulder = new PVector(rightShoulderVector.x, rightShoulderVector.y);
  kinectObject.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_RIGHT_HIP, rightHipVector);
  rightHip = new PVector(rightHipVector.x, rightHipVector.y);
  kinectObject.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_LEFT_HAND, leftHandVector);
  leftHand = new PVector(leftHandVector.x, leftHandVector.y);
  kinectObject.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_LEFT_ELBOW, leftElbowVector);
  leftElbow = new PVector(leftElbowVector.x, leftElbowVector.y);
  kinectObject.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, leftShoulderVector);
  leftShoulder = new PVector(leftShoulderVector.x, leftShoulderVector.y);
  kinectObject.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_LEFT_HIP, leftHipVector);
  leftHip = new PVector(leftHipVector.x, leftHipVector.y);
  if (rightShoulder != null && rightHip != null) {
    torsoOrientation = PVector.sub(rightShoulder, rightHip);
  }
  if (rightElbow != null && rightShoulder != null) {
    upperLeftArmOrientation = PVector.sub(rightElbow, rightShoulder);
  }
  if (leftElbow != null && leftShoulder != null) {
    upperRightArmOrientation = PVector.sub(leftElbow, leftShoulder);
  }
}
void drawSkeleton(int userId) {
  scale(1.15*1280/640, 1.8);
  stroke(0);
  strokeWeight(5);

  kinect.drawLimb(userId, SimpleOpenNI.SKEL_HEAD, SimpleOpenNI.SKEL_NECK);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_LEFT_ELBOW);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_ELBOW, SimpleOpenNI.SKEL_LEFT_HAND);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_ELBOW, SimpleOpenNI.SKEL_RIGHT_HAND);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_LEFT_HIP);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_HIP, SimpleOpenNI.SKEL_LEFT_KNEE);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_KNEE, SimpleOpenNI.SKEL_LEFT_FOOT);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_RIGHT_HIP);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_HIP, SimpleOpenNI.SKEL_RIGHT_KNEE);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_KNEE, SimpleOpenNI.SKEL_RIGHT_FOOT);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_HIP, SimpleOpenNI.SKEL_LEFT_HIP);

  noStroke();

  fill(255, 0, 0);
  drawJoint(userId, SimpleOpenNI.SKEL_HEAD); 
  drawJoint(userId, SimpleOpenNI.SKEL_NECK);
  drawJoint(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  drawJoint(userId, SimpleOpenNI.SKEL_LEFT_ELBOW);
  drawJoint(userId, SimpleOpenNI.SKEL_NECK);
  drawJoint(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  drawJoint(userId, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  drawJoint(userId, SimpleOpenNI.SKEL_TORSO);
  drawJoint(userId, SimpleOpenNI.SKEL_LEFT_HIP);
  drawJoint(userId, SimpleOpenNI.SKEL_LEFT_KNEE);
  drawJoint(userId, SimpleOpenNI.SKEL_RIGHT_HIP);
  drawJoint(userId, SimpleOpenNI.SKEL_LEFT_FOOT);
  drawJoint(userId, SimpleOpenNI.SKEL_RIGHT_KNEE);
  drawJoint(userId, SimpleOpenNI.SKEL_LEFT_HIP);
  drawJoint(userId, SimpleOpenNI.SKEL_RIGHT_FOOT);
  drawJoint(userId, SimpleOpenNI.SKEL_RIGHT_HAND);
  drawJoint(userId, SimpleOpenNI.SKEL_LEFT_HAND);
  scale(1);
}


void drawJoint(int userId, int jointID) { 
  PVector joint = new PVector();

  float confidence = kinect.getJointPositionSkeleton(userId, jointID, 
  joint);
  if (confidence < 0.5) {
    return;
  }
  PVector convertedJoint = new PVector();
  kinect.convertRealWorldToProjective(joint, convertedJoint);
  ellipse(convertedJoint.x, convertedJoint.y, 5, 5);
}

