void startDetection(SimpleOpenNI kinectObject) {
  IntVector userList = new IntVector();
  kinectObject.getUsers(userList);

  if (userList.size() > 0) {

    int userId = userList.get(0);
    //If we detect one user we have to draw it
    if ( kinectObject.isTrackingSkeleton(userId)) {
      drawSkeleton(userId);
      initializeVectors(userId, kinectObject);
      getAngles();
      checkAngles();
      // show the angles on the screen for debugging
    }
  }
}

