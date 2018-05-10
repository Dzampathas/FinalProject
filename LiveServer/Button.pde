public class Button
{
  int x;
  int y;
  String name;
  int W = 100;
  int H = 50;
  int clickTimeOUT;
  boolean beingClicked = false;
  
  //constructors
  public Button(int x, int y, String name){
    this.x = x;
    this.y = y;
    this.name = name;
  }
  
  public boolean mouseOver(){
   if((mouseX > x && mouseX < x + W) && (mouseY > y && mouseY < y+H)){
     return true;
   }else {
     return false;
   }
  }
  
  public void update(){
    strokeWeight(1);
    stroke(0);
    if(this.mouseOver() == false){
      fill(255);
    } else{
      fill(180);
    }
    rect(x,y,W,H);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(15);
    text(name, x+(W/2),y+(H/2));
  }
  
  public boolean clicked(){
    //the millis is debouncing the button press
    if(beingClicked == false){
      clickTimeOUT = millis();
      if(mousePressed == true && this.mouseOver() == true){
        beingClicked = true;
        return true;
      }
       return false; 
    } else{
      if(millis() - clickTimeOUT > 200 && mousePressed == false){
        beingClicked = false;
      }
     return false; 
    }
  }
  
}
