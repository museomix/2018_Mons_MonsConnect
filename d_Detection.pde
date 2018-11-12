//Method for people detection : as soon as it detects anybody, the games starts !
void startDetection(SimpleOpenNI kinectObject) {
  IntVector userList = new IntVector();
  kinectObject.getUsers(userList);

  //If an user is detected (in fact, the Kinect v1 cannot detect more than 1 user)
  if (userList.size() > 0) {
    int userId = userList.get(0);

    //When the Kinect detects the skeleton, the real game begins !
    if ( kinectObject.isTrackingSkeleton(userId)) {
      didGameStarted = true;

      //Skeleton is display on the screen
      drawSkeleton(userId);

      //Vectors will be needed to get the angles of the user, to match characters
      initializeVectors(userId, kinectObject);

      //if angles are OK, player won
      boolean anglesCheckResult = checkAngles();
      if (anglesCheckResult) {
        didPlayerWon = true;
      }
    }
  }
}

