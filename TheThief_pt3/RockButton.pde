public class RockButton{
  static final int width = 200;
  static final int height = 150;
  PFont codeFont = loadFont( "CourierNew16.vlw" );
  PFont codeFontMedium = loadFont( "CourierB24.vlw" );
  PFont codeFontLarge = loadFont( "CourierB32.vlw" );
  private PImage rock, rockPressed;
  int x;
  int y;
  String symbol;
  boolean isPressed;
  
  public RockButton( int x, int y, String symbol ){
    this.x = x;
    this.y = y;
    this.symbol = symbol;
    this.isPressed = false;
     
    rock = loadImage( "steppingStone2.png" ); 
    rock.resize(width, height);

    rockPressed = loadImage( "steppingStonePressed2.png" ); 
    rockPressed.resize(width, height);
  }
  
  public void draw(){
    if( isPressed ){
      image( rockPressed, x, y );
    } else {
      image( rock, x, y );
    }
    
    // Draw text on top of button
    push();
    fill(0);
    textFont( codeFontLarge );
    int xPos = x + ( ( RockButton.width - ( this.symbol.length() * 18 ) ) / 2 );
    int yPos = y + ( RockButton.height / 2 );
    text(this.symbol, xPos, yPos );
    pop();
  }
  
  public boolean isMousePressed(){ 
    if( mouseX > this.x && mouseX < ( this.x + RockButton.width ) ){
      if( mouseY > this.y && mouseY < ( this.y + RockButton.height ) ){
        return true;
      }
    }
    return false;
  }
  
  public boolean isPressed(){
    return isPressed;
  }
  
  public void setPressed(boolean isPressed){
      this.isPressed = isPressed;
  }
  
  public void togglePressed(){
    this.isPressed = !this.isPressed;
  }
}
