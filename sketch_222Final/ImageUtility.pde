//Images

PImage reactionOneImg, reactionTwoImg, reactionThreeImg, reactionFourImg;
PImage reactionOneCImg, reactionTwoCImg, reactionThreeCImg, reactionFourCImg;

void loadImages(){
  //Unlicked
  reactionOneImg = loadImage("angryOne.png");
  reactionTwoImg = loadImage("angryOne.png");
  reactionThreeImg = loadImage("angryOne.png");
  reactionFourImg = loadImage("angryOne.png");
  
  //Clicked variant
  reactionOneCImg = loadImage("angryOneClicked.png");
  reactionTwoCImg = loadImage("angryOne.png");
  reactionThreeCImg = loadImage("angryOne.png");
  reactionFourCImg = loadImage("angryOne.png");
}

//----------------------Mouse interaction-------------------------------

//click detection
void checkClick(){
  if(mousePressed && reactionOne.Hit){
    reactionOne.clicked(1);
    if(inputReady){
      //Do whatever here
    }
    inputReady = false;
  }
  else reactionOne.clicked(0);
  
  
}

void mouseReleased(){
  inputReady = true;
}
