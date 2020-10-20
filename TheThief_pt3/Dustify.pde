/*
Pixel dust
 
 Author:
 Jason Labbe
 
 Site:
 jasonlabbe3d.com
 */

public class Dustify {
  ArrayList<Pixel> allPixels = new ArrayList<Pixel>();
  PVector lastMousePos = new PVector(0, 0);
  float targetSize = 100;
  int pixelStep = 2;
  PImage image;
  int startingXPos;
  int startingYPos;
  boolean hasBeenReset = false;
  
  public Dustify( String imageStr, int x, int y ){
    this.image = loadImage(imageStr);
    this.startingXPos = x;
    this.startingYPos = y;
  }
  
  public Dustify( PImage img, int x, int y ){
    this.image = img;
    this.startingXPos = x;
    this.startingYPos = y;
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

  boolean hasBeenReset(){
    return this.hasBeenReset;
  }

  void reset() {
    this.hasBeenReset = true;
    allPixels.clear();
    image.loadPixels();

    int i = 0;
    for (int y = 0; y < image.height; y+=1) {
      for (int x = 0; x < image.width; x+=1) {
        color pixelColor = image.pixels[i];

        i += 1;

        if (alpha(pixelColor) == 0) { 
          continue;
        }
        if (i % pixelStep > 0) { 
          continue;
        }

        Pixel newPixel = new Pixel(x+startingXPos, y+startingYPos, pixelColor);
        allPixels.add(newPixel);
        newPixel.draw();
      }
    }
  }

  void drawTarget() {
    push();

    rectMode(CENTER);
    noFill();
    noStroke();
    ellipse(mouseX, mouseY, targetSize*2, targetSize*2);

    pop();
  }

  void draw() {
    PVector mousePos = new PVector(mouseX, mouseY);

    for (Pixel pixel : allPixels) {
      if (dist(pixel.pos.x, pixel.pos.y, mousePos.x, mousePos.y) < targetSize) { 
        pixel.active = true;

        PVector newVel = mousePos.get();
        newVel.sub(lastMousePos);
        // Using PVector.mag() seems to crash in JavaScript mode
        // so will calculate magnitude manually.
        float mag = (float)Math.sqrt( (newVel.x * newVel.x)+(newVel.y * newVel.y) ) * 0.01;
        newVel.normalize();
        newVel.setMag(random(mag*10, mag*15) ); // Better in Java mode
        //        newVel.setMag(random(mag*0.1, mag*0.5)); // Better in JavaScript mode
        pixel.vel.add(newVel);
      }

      pixel.draw();

      if (! pixel.active) { 
        continue;
      }

      pixel.vel.add(0, pixel.fallRate, 0);
      pixel.pos.add(pixel.vel);
      pixel.fallRate += random(0.1, 0.5);

      if (pixel.pos.y > height) { 
        pixel.active = false;
      }
    }

    lastMousePos.set(mouseX, mouseY);

    drawTarget();
  }
}
