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

class Reaction{
  
  PImage img;
  PVector pos;
  
  Reaction(PImage img, float x, float y){
    this.img = img;
    this.pos.y = y;
    this.pos.x = x;
  }
  
  void render(){
    translate(pos.x,pos.y);
    float randomScale = width*random(0.5,1.2);
    image(img, -img.width/2, -img.height/2, randomScale, randomScale);
  }
    
    
}
