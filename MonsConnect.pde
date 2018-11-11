import processing.video.*;

import SimpleOpenNI.*;
Capture video;
PImage webcamImage;
int sceneWidth = 1280;
int sceneHeight = 720;
PShape header;

static int videoWidth = 1280;
static int videoHeight = 720;

void captureEvent(Capture video) {
  video.read();
}

//Generate a SimpleOpenNI object
SimpleOpenNI kinect;


void setup() {
  loadCharacters();
  loadImages();
  kinect = new SimpleOpenNI(this);
  kinect.enableDepth();

  kinect.enableRGB();

  kinect.enableUser();// because of the version this change
  size(1280, 720);
  fill(255, 0, 0);
  kinect.setMirror(true);
  video = new Capture(this, videoWidth, videoHeight);

  // Step 4. Start the capturing process.
  video.start();
}

void draw() {
  kinect.update();
  fill(211, 211, 211);
  pushMatrix();   // just so nothing else is affected
  scale(-1, 1);
  image(video, -video.width, 0);
  popMatrix();



  displayImages();
  displayStartAnimation();
  startDetection(kinect);
}
