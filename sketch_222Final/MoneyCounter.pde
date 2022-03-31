//Money Counter window - class for creating multiple windows
//IAT 222 Pocholo Andres

int moneySum = 0;     //for Counter
int savedTime;        //for Timer
int totalTime = 1000; //in ms
int sinceStart = 0;
int s = 0;
int m = 0;
int h = 0;



class MoneyCounter extends PApplet {
  ArrayList<imageHolder> reactions = new ArrayList<imageHolder>();
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
    int passedTime = millis() - savedTime;
    float randomizer = random(100,2000);
    if(passedTime > totalTime) {
      moneySum += 1100;
      moneySum += randomizer;
      savedTime = millis();
    }
    sinceStart = millis();
    textSize(28);
    String readableMoneySum = nfc(moneySum);
    text("$" + readableMoneySum, width/2-50, height/2);
    textSize(15);
    text("reference: https://www.icsid.org/uncategorized/how-many-products-does-nike-sell-a-day/", 0, height/2+200);
    text("Time since, " + sinceStart + " Nike earned", 0, 30);
    
    for(imageHolder r: reactions){
      image(r.img, r.pos.x, r.pos.y, r.size, r.size);
      r.pos.x -= random(-3,3);
      r.pos.y -= random(1,3);
    }
    
    //check for ones ready for removal
    for(imageHolder r: reactions){
      if(r.pos.y < -50) {
        reactions.remove(r);
        break;
      }
    }
   
  }
}

void reaction(Button b){
  if(window.reactions.size() <= 12){
    window.reactions.add(new imageHolder(b.img, random(100,900), 600, random(0.7,1.3)));
  }
}
