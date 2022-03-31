//Money Counter window - class for creating multiple windows
//IAT 222 Pocholo Andres

int moneySum = 0;     //for Counter
int savedTime;        //for Timer
int totalTime = 1000; //in ms

class MoneyCounter extends PApplet {
  
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
    
    textSize(28);
    text("$" + moneySum, width/2-50, height/2);
    textSize(15);
    text("reference: https://www.icsid.org/uncategorized/how-many-products-does-nike-sell-a-day/", 0, height/2+200);
    
  }
}
