//Second window
MoneyCounter window; 

//Buttons
Button reactionOne;
Button reactionTwo;
Button reactionThree;
Button reactionFour;

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
   reactionTwo = new Button(reactionOneImg, 400, 400, reactionOneImg);
   reactionThree = new Button(reactionOneImg, 600, 400, reactionOneImg);
   reactionFour = new Button(reactionOneImg, 800, 400, reactionOneImg);
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
  
}
