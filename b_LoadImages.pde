PImage logoImage;
import gifAnimation.*;
Gif startAnimation;


void loadImages() {
  logoImage = loadImage("assets/logo.jpg");
  startAnimation = new Gif(this, "assets/prends_la_pose.gif");
  startAnimation.play();
}

void displayImages() {
  //image(logoImage, 0, 0);
}
void displayStartAnimation() {
  // image(startAnimation, 10,10);
}

