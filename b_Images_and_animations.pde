import gifAnimation.*;
Animation logoAnimation;
Animation startupAnimation;
PImage endImage;



//Startup animation
void loadStartupAnimation() {
  startupAnimation = new Animation("startupAnimation/fitin gif-300", 35);
}
void displayStartupAnimation() {
  startupAnimation.display(0, 125);
}

//Project logo animation
void loadLogoAnimation() {
  logoAnimation = new Animation("logo/logo00", 41);
}
void displayLogoAnimation() {
  logoAnimation.display(300, 0);
}

//Static end image
void loadEndImage(int characterIndex) {
  endImage = loadImage("assets/" + characters[characterIndex].endFile + ".jpg");
}
void displayEndImage() {
  image(endImage, 0, 0);
}

