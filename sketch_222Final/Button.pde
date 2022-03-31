class Button{
  
  PVector pos = new PVector(0,0);
  PImage img, cimg, renderImg;        //cimage = clickedImage when image is clicked
  boolean Hit = false;
  float l,w;
  
  
  //placeholder constructor
  Button(float x,float y,float l,float w){
    pos.x = x;
    pos.y = y;
    this.l = l;
    this.w = w;
  }
  
  // real constructor once we have images
  Button(PImage img, float x, float y, PImage cimg){
    pos.x = x;
    pos.y = y;
    this.img = img;
    this.cimg = cimg;
    renderImg = img;
  }
  
  //Refreshes the image
  void update(){
    render();
  }
  
  void render(){
    //Center coordinates to image
    pushMatrix();
    translate(pos.x, pos.y);
    image(renderImg, -renderImg.width/2, -renderImg.height/2, renderImg.width, renderImg.height);
    popMatrix();
  }
  
  //Changes rendered image if button is clicked
  void clicked(int i){
    if(i == 0) renderImg = img;
    if(i == 1) renderImg = cimg;
  }
  
}

//-----Class End

//-----Button hit Detection
boolean overImg(Button b){
  int left  = (int)b.pos.x - b.img.width/2;
  int right = (int)b.pos.x + b.img.width/2;
  int top   = (int)b.pos.y - b.img.height/2;
  int bot   = (int)b.pos.y + b.img.height/2;
  if(mouseX >= left && mouseX <= right &&
     mouseY >= top && mouseY <= bot){
       return true;
     }
  return false;
}

//check if mouse is over button, hit detection
void buttons(){
 
  if(overImg(reactionOne)) reactionOne.Hit = true;
  else reactionOne.Hit = false;
  
  if(overImg(reactionTwo)) reactionTwo.Hit = true;
  else reactionTwo.Hit = false;
  
  if(overImg(reactionThree)) reactionThree.Hit = true;
  else reactionThree.Hit = false;
  
  if(overImg(reactionFour)) reactionFour.Hit = true;
  else reactionFour.Hit = false;

}
