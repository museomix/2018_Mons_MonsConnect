class Character {
  int angles[];
  String name;
  String maskFile;
  String endFile;


  Character(String nameTemp, int anglesTemp[], String maskFileTemp, String endImageTemp) {
    angles = anglesTemp;
    name = nameTemp;
    maskFile = maskFileTemp;
    endFile = endImageTemp;
  }
}

class Animation {
  PImage[] images;
  int imageCount;
  int frame = 0;

  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = "assets/" + imagePrefix + nf(i, 2) + ".png";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos) {
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos);
  }

  int getWidth() {
    return images[0].width;
  }
}

