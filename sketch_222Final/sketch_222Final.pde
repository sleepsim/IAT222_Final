//Second window
MoneyCounter window; 

//Buttons
Button reactionOne;
Button reactionTwo;
Button reactionThree;
Button reactionFour;
Button reactionUp, reactionDown;

int r1count, r2count, r3count, r4count, rucount, rdcount;

boolean inputReady = true;

public void settings(){
  //size(1000,600);
  fullScreen(2);
}

void setup(){
   window = new MoneyCounter();
   loadImages();
   //Buttons
   reactionOne = new Button(reactionOneImg, width/5, (height/3)*2, reactionOneCImg);
   reactionTwo = new Button(reactionTwoImg, (width/5)*2, (height/3)*2, reactionTwoCImg);
   reactionThree = new Button(reactionThreeImg, (width/5)*3, (height/3)*2, reactionThreeCImg);
   reactionFour = new Button(reactionFourImg, (width/5)*4, (height/3)*2, reactionFourCImg);
   reactionUp = new Button(reactionUpImg, width/3, height/3, reactionUpCImg);
   reactionDown = new Button(reactionDownImg, (width/3)*2, (height/3), reactionDownCImg);
}

//Main window
void draw(){
  background(0);
  
  //button interaction helper
  buttons();
  checkClick();
  
  //render buttons
  reactionOne.render();
  reactionTwo.render();
  reactionThree.render();
  reactionFour.render();
  reactionUp.render();
  reactionDown.render();
  
  //counters
  textSize(40);
  pushMatrix();
  translate(-20,0);
  text(r1count,width/5, (height/3)*2.5);
  text(r2count,(width/5)*2, (height/3)*2.5);
  text(r3count,(width/5)*3, (height/3)*2.5);
  text(r4count,(width/5)*4, (height/3)*2.5);
  text(rucount,width/3, height/3*1.5);
  text(rdcount,(width/3)*2, (height/3)*1.5);
  popMatrix();
}
