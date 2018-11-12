Animation maskAnimation;

//Masks handling
void loadMask(int characterIndex) {
  maskAnimation = new Animation(characters[currentCharacter].maskFile, 3);
}
void displayMask() {
  maskAnimation.display(0, 0);
}

