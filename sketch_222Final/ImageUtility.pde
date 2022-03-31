//Images

PImage reactionOneImg, reactionTwoImg, reactionThreeImg, reactionFourImg;
PImage reactionOneCImg, reactionTwoCImg, reactionThreeCImg, reactionFourCImg;

void loadImages(){
  //Unlicked
  reactionOneImg = loadImage("angryOneT.png");
  reactionTwoImg = loadImage("angryOne.png");
  reactionThreeImg = loadImage("angryOne.png");
  reactionFourImg = loadImage("angryOne.png");
  
  //Clicked variant
  reactionOneCImg = loadImage("angryOneTClicked.png");
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
      reaction(reactionOne);
    }
    inputReady = false;
  }
  else reactionOne.clicked(0);
  
  
}

void mouseReleased(){
  inputReady = true;
}

//-------------------------Emoji Reaction

class ImageHolder{
  
  PImage img;
  PVector pos = new PVector(0,0);
  float size = 0;
  
  ImageHolder(PImage img, float x, float y, float s){
    this.img = img;
    size = img.width*s;
    pos.y = y;
    pos.x = x;
  }  
}
