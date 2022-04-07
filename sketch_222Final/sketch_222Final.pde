//Second window
MoneyCounter window; 

//Buttons
Button reactionOne;
Button reactionTwo;
Button reactionThree;
Button reactionFour;
Button reactionUp, reactionDown;

boolean inputReady = true;

public void settings(){
  size(1000,600);
  //fullScreen();
}

void setup(){
   window = new MoneyCounter();
   loadImages();
   //Buttons
   reactionOne = new Button(reactionOneImg, 200, 400, reactionOneCImg);
   reactionTwo = new Button(reactionTwoImg, 400, 400, reactionTwoCImg);
   reactionThree = new Button(reactionThreeImg, 600, 400, reactionThreeCImg);
   reactionFour = new Button(reactionFourImg, 800, 400, reactionFourCImg);
   reactionUp = new Button(reactionUpImg, 350, 150, reactionUpCImg);
   reactionDown = new Button(reactionDownImg, 650, 150, reactionDownCImg);
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

}
