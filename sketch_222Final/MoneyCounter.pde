//Money Counter window - class for creating multiple windows
//IAT 222 Pocholo Andres

int moneySum = 0;     //for Counter
int savedTime;        //for Timer
int totalTime = 1000; //in ms
int moneyLoss = 0;
int moneyLossTimer = 0;

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
  
  MoneyCounter(){
    super();
    PApplet.runSketch(new String[] {this.getClass().getSimpleName()}, this);
  }
  
  public void settings(){
    size(1000,600);
  }
  
  public void setup(){
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
    text("$" + readableMoneySum, width/2-50, height/2);
    textSize(15);
    text("Source: https://www.icsid.org/uncategorized/how-many-products-does-nike-sell-a-day/", 0, height/2+200);
    text("In the last " + 
         "Hours:"+h+
         " Minutes:"+m+
         " Seconds:"+s+ 
         "\n" + "\n"+
         "Since this program started running, Nike has earned", 0, 30);
      
   //Reaction images
    for(ImageHolder r: reactions){
      readyToAdd = false;
      image(r.img, r.pos.x, r.pos.y, r.size, r.size);
      r.pos.x -= random(-3,3);
      r.pos.y -= random(1,3);
      if(r.pos.y <-20) {
        removeList.add(r);
      }
    }
    readyToAdd = true;
    
    //check for ones ready for removal - avoiding ConcurrentModificationExcep
    reactions.removeAll(removeList);
    
    //moneyloss
    if(renderMoneyLoss){
      fill(255,100,100);
      textSize(28);
      text(moneyLoss, width/2+200, height/2);
      moneyLossTimer++;
    }
    if(moneyLossTimer == 70){
      moneyLossTimer = 0;
      renderMoneyLoss = false;
    }
  }
  
}

void reaction(Button b){
  if(window.reactions.size() <= 12 && readyToAdd){
    window.reactions.add(new ImageHolder(b.img, random(100,900), 600, random(0.7,1.3)));
  }
}
