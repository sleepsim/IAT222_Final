//Money Counter window - class for creating multiple windows
//IAT 222 Pocholo Andres

int moneySum = 0;     //for Counter
int savedTime;        //for Timer
int totalTime = 1000; //in ms
int moneyLoss = 0;
int moneyLossTimer = 0;

color green = color(100,255,100);
color red = color(255,100,100);
boolean moneyToggle = false;

int savedTime2 = 0;
int totalTime2 = 1000;
int s = 0;
int m = 0;
int h = 0;

boolean renderMoneyLoss = false;

boolean readyToAdd = true;    //avoiding ConcurrentModificationException

class MoneyCounter extends PApplet {
  
  ArrayList<ImageHolder> reactions = new ArrayList<ImageHolder>();
  ArrayList<ImageHolder> removeList = new ArrayList<ImageHolder>();
  ArrayList<ImageHolder> addList = new ArrayList<ImageHolder>();
  
  MoneyCounter(){
    super();
    PApplet.runSketch(new String[] {this.getClass().getSimpleName()}, this);
  }
  
  public void settings(){
    //size(1000,600);
    fullScreen(1);
  }
  
  public void setup(){
    frameRate(60);
    background(0);
    savedTime = millis();
  }
  
  public void draw(){
    background(0);
    
    //Timer for moneySum
    int passedTime = millis() - savedTime;
    float randomizer = random(0,350);
    if(passedTime > totalTime) {
      moneySum += 1000;
      moneySum += randomizer;
      savedTime = millis();
      
      //updating total app time
      s++;
      if(s == 60){
        m++;
        s = 0;
      }
      if(m == 60){
        h++;
        m = 0;
      }
    }
           
    //text
    fill(255,255,255);
    textSize(28);
    String readableMoneySum = nfc(moneySum);
    text("$" + readableMoneySum, width/2-70, height/2);
    textSize(15);
    text("In the last " + "\n"+
         +h+" Hours "+ "\n"+
         +m+" Minutes "+ "\n"+
         +s+" Seconds"+ 
         "\n" + "\n"+
         "Since this program started running, Nike has earned the amount shown above,"+
         "\n" + "\n"+
         "Data based on: https://www.statista.com/topics/1243/nike/", 10, height-200);
   
   //moneyloss
    if(renderMoneyLoss){
      if(!moneyToggle){
        fill(red);
        triangle(width/2+175,height/2-20,
                 width/2+195,height/2-20,
                 width/2+185,height/2);
      }else if(moneyToggle){
        fill(green);
        triangle(width/2+175,height/2,
                 width/2+195,height/2,
                 width/2+185,height/2-20);
      }
      textSize(28);
      text(moneyLoss, width/2+200, height/2);
      moneyLossTimer++;
    }
    if(moneyLossTimer == 60){
      moneyLossTimer = 0;
      renderMoneyLoss = false;
    }
   reactions.addAll(addList);
   addList.clear();
   //Reaction images
    for(ImageHolder r: reactions){
      readyToAdd = false;
         println(r.pos.x);
      image(r.img, r.pos.x, r.pos.y, r.size, r.size);
      //r.pos.x -= random(-3,3);
      r.pos.y -= random(3,4);
      if(r.pos.y <-20) {
        removeList.add(r);
      }
    }
    readyToAdd = true;
    
    //check for ones ready for removal - avoiding ConcurrentModificationExcep
    reactions.removeAll(removeList);
    
    //
  }
}

//Takes button image, amount to subtract/add, and type (add/sub)
void reaction(Button b, int amt, int type){
  if(window.reactions.size() <= 15){
    window.addList.add(new ImageHolder(b.img, random(200, window.width-200), window.height, random(0.6,0.8)));
  }
  if(type == 1) moneyToggle = true;
  if(type == 0) moneyToggle = false;
  moneyLoss = amt;
}
