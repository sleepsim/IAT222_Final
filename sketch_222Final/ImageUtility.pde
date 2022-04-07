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
  reactionOneImg.resize(height/4,height/4);
  reactionTwoImg.resize(height/4,height/4);
  reactionThreeImg.resize(height/4,height/4);
  reactionFourImg.resize(height/4,height/4);
  reactionUpImg.resize(height/4,height/4);
  reactionDownImg.resize(height/4,height/4);
  
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
    if(inputReady){
      if(renderMoneyLoss == false){
        reactionOne.clicked(1);
        reaction(reactionOne, 150, 0);
        r1count++;
        moneySum -= 150;
      }
      renderMoneyLoss = true;
    }
    inputReady = false;
  }
  else reactionOne.clicked(0);
  
  //Button 2
  if(mousePressed && reactionTwo.Hit){
    if(inputReady){
      if(renderMoneyLoss == false){
        reactionTwo.clicked(1);
        reaction(reactionTwo, 100, 0);
        r2count++;
        moneySum -= 100;
      }
      renderMoneyLoss = true;
    }
    inputReady = false;
  }
  else reactionTwo.clicked(0);
  
  //Button 3
  if(mousePressed && reactionThree.Hit){
    if(inputReady){
      if(renderMoneyLoss == false){
        reactionThree.clicked(1);
        reaction(reactionThree, 50, 0);
        r3count++;
        moneySum -= 50;
      }
      renderMoneyLoss = true;
    }
    inputReady = false;
  }
  else reactionThree.clicked(0);
  
  //Button 4
  if(mousePressed && reactionFour.Hit){
    if(inputReady){
      if(renderMoneyLoss == false){
        reactionFour.clicked(1);
        reaction(reactionFour, 100, 1);
        r4count++;
        moneySum += 100;
      }
      renderMoneyLoss = true;
    }
    inputReady = false;
  }
  else reactionFour.clicked(0);
  
  //Button  Up
  if(mousePressed && reactionUp.Hit){
    if(inputReady){
      if(renderMoneyLoss == false){
        reactionUp.clicked(1);
        reaction(reactionUp, 50, 1);
        rucount++;
        moneySum += 50;
      }
      renderMoneyLoss = true;
    }
    inputReady = false;
  }
  else reactionUp.clicked(0);
  
  //Button Down
  if(mousePressed && reactionDown.Hit){
    if(inputReady){
      if(renderMoneyLoss == false){
        reactionDown.clicked(1);
        reaction(reactionDown, 50, 0);
        rdcount++;
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
