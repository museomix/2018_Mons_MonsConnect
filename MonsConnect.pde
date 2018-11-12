import processing.video.*;

import SimpleOpenNI.*;
Capture video;
PImage webcamImage;
int sceneWidth = 1280;
int sceneHeight = 720;
PShape header;
int delayAfterWinning = 100;

int winningDelay = 0;


static int videoWidth = 1280;
static int videoHeight = 720;

void captureEvent(Capture video) {
  video.read();
}

//Generate a SimpleOpenNI object
SimpleOpenNI kinect;


void setup() {
  background(0, 0, 0);
  loadCharacters();
  kinect = new SimpleOpenNI(this);
  kinect.enableDepth();

  kinect.enableRGB();

  kinect.enableUser();// because of the version this change
  size(1280, 720);

  fill(0, 0, 0);
  kinect.setMirror(true);
  video = new Capture(this, 1280, 720);

  // Step 4. Start the capturing process.
  video.start();
  loadMask(currentCharacter);
  loadStartupAnimation();
  loadLogoAnimation();
  loadEndImage(currentCharacter);
}

void draw() {
  kinect.update();
  frameRate(20);
  fill(0, 0, 0);
  pushMatrix();   // just so nothing else is affected
  scale(-1, 1);
  image(video, -video.width, 0);
  popMatrix();

  //We display start animation only if game didn't started
  fill(0, 0, 0);

  if (didPlayerWon) {
    currentCharacter =0;
    displayEndImage();
    if (winningDelay < delayAfterWinning) {
      winningDelay++;
    } else {
      didPlayerWon = false;
      displayStartupAnimation();
      didGameStarted = false;
      winningDelay = 0;
      currentCharacter = 0;
    }
  } else {
    displayMask();
    startDetection(kinect);
    if (!didGameStarted) {
      displayStartupAnimation();
    }
    displayLogoAnimation();
  }
}

