//Money Counter window - class for creating multiple windows
class MoneyCounter extends PApplet {
  
  MoneyCounter(){
    super();
    PApplet.runSketch(new String[] {this.getClass().getSimpleName()}, this);
  }
  
  public void settings(){
    size(500,200);
  }
  
  public void setup(){
    background(0);
  }
  
  public void draw(){
  }
}
