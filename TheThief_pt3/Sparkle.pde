public class Sparkle {
  ArrayList<Pixel> allPixels;
  PImage image;
  int startingXPos;
  int startingYPos;
  
  public Sparkle( String imageStr, int x, int y ){
    this.image = loadImage(imageStr);
    this.startingXPos = x;
    this.startingYPos = y;
    allPixels = new ArrayList<Pixel>();
    image.loadPixels();
  }
  
  public Sparkle( PImage img, int x, int y ){
    this.image = img;
    this.startingXPos = x;
    this.startingYPos = y;
    allPixels = new ArrayList<Pixel>();
    image.loadPixels();
  }
  
  public void draw(){
    int i = 0;
    
    for (int y = 0; y < image.height; y+=1) {
      for (int x = 0; x < image.width; x+=1) {
        color pixelColor = image.pixels[i];
        
        i += 1;

        if (alpha(pixelColor) == 0) { 
          continue;
        }

        Pixel newPixel = new Pixel(x+startingXPos, y+startingYPos, pixelColor);
        allPixels.add(newPixel);
        newPixel.draw();
      }
    }
  }

  class Pixel {
    PVector pos = new PVector(0, 0);
    PVector vel = new PVector(0, 0);
    color pixelColor;
    float fallRate;
    boolean active = false;

    Pixel(int x, int y, color inputColor) {
      this.pos.set(x, y);
      this.pixelColor = inputColor;
      this.fallRate = random(0.1, 2);
    }

    void draw() {
      stroke(this.pixelColor);
      point(this.pos.x, this.pos.y);
    }
  }
}
