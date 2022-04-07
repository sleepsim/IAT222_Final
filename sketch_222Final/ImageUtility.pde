//Images

PImage reactionOneImg, reactionTwoImg, reactionThreeImg, reactionFourImg, reactionUpImg, reactionDownImg;
PImage reactionOneCImg, reactionTwoCImg, reactionThreeCImg, reactionFourCImg, reactionUpCImg, reactionDownCImg;

void loadImages(){
  //Unlicked
  reactionOneImg = loadImage("angry.png");
  reactionTwoImg = loadImage("cry.png");
  reactionThreeImg = loadImage("shocked.png");
  reactionFourImg = loadImage("smile.png");
  reactionUpImg = loadImage("thumbsUp.png");
  reactionDownImg = loadImage("thumbsDown.png");
  
  //Clicked variant
  reactionOneCImg = loadImage("angryClicked.png");
  reactionTwoCImg = loadImage("cryClicked.png");
  reactionThreeCImg = loadImage("shockedClicked.png");
  reactionFourCImg = loadImage("smileClicked.png");
  reactionUpCImg = loadImage("thumbsUpClicked.png");
  reactionDownCImg = loadImage("thumbsDownClicked.png");
  
  //Resize
  reactionOneImg.resize(200,200);
  reactionTwoImg.resize(200,200);
  reactionThreeImg.resize(200,200);
  reactionFourImg.resize(200,200);
  reactionUpImg.resize(200,200);
  reactionDownImg.resize(200,200);
  
  reactionOneCImg.resize(180,180);
  reactionTwoCImg.resize(180,180);
  reactionThreeCImg.resize(180,180);
  reactionFourCImg.resize(180,180);
  reactionUpCImg.resize(180,180);
  reactionDownCImg.resize(180,180);

}

//----------------------Mouse interaction-------------------------------

//click detection
void checkClick(){
  
  //Button 1
  if(mousePressed && reactionOne.Hit){
    reactionOne.clicked(1);
    if(inputReady){
      reaction(reactionOne, 150, 0);
      if(renderMoneyLoss == false){
        moneySum -= 150;
      }
      renderMoneyLoss = true;
    }
    inputReady = false;
  }
  else reactionOne.clicked(0);
  
  //Button 2
  if(mousePressed && reactionTwo.Hit){
    reactionTwo.clicked(1);
    if(inputReady){
      reaction(reactionTwo, 100, 0);
      if(renderMoneyLoss == false){
        moneySum -= 100;
      }
      renderMoneyLoss = true;
    }
    inputReady = false;
  }
  else reactionTwo.clicked(0);
  
  //Button 3
  if(mousePressed && reactionThree.Hit){
    reactionThree.clicked(1);
    if(inputReady){
      reaction(reactionThree, 50, 0);
      if(renderMoneyLoss == false){
        moneySum -= 50;
      }
      renderMoneyLoss = true;
    }
    inputReady = false;
  }
  else reactionThree.clicked(0);
  
  //Button 4
  if(mousePressed && reactionFour.Hit){
    reactionFour.clicked(1);
    if(inputReady){
      reaction(reactionFour, 100, 1);
      if(renderMoneyLoss == false){
        moneySum += 100;
      }
      renderMoneyLoss = true;
    }
    inputReady = false;
  }
  else reactionFour.clicked(0);
  
  //Button  Up
  if(mousePressed && reactionUp.Hit){
    reactionUp.clicked(1);
    if(inputReady){
      reaction(reactionUp, 50, 1);
      if(renderMoneyLoss == false){
        moneySum += 50;
      }
      renderMoneyLoss = true;
    }
    inputReady = false;
  }
  else reactionUp.clicked(0);
  
  //Button Down
  if(mousePressed && reactionDown.Hit){
    reactionDown.clicked(1);
    if(inputReady){
      reaction(reactionDown, 50, 0);
      if(renderMoneyLoss == false){
        moneySum -= 50;
      }
      renderMoneyLoss = true;
    }
    inputReady = false;
  }
  else reactionDown.clicked(0);
  
  
}

void mouseReleased(){
  inputReady = true;
}

//-------------------------Emoji Reaction

class ImageHolder{
  
  PImage img;
  PVector pos = new PVector(0,0);
  PVector vel = new PVector(0,0);
  float size = 0;
  float damp = 0.8;
  
  ImageHolder(PImage img, float x, float y, float s){
    this.img = img;
    size = img.width*s;
    pos.y = y;
    pos.x = x;
  }
  
}
