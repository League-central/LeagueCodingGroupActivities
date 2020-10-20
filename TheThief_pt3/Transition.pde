class Transition {
  ArrayList<PImage> images;
  boolean loopForever;
  boolean run;
  int transparency;
  int imageIndex;
  int speed;

  public Transition( ArrayList<PImage> images, int speed, boolean loopForever ) {
    this.images = images;
    this.run = true;
    this.speed = speed;
    this.loopForever = loopForever;
    this.transparency = 0;
    this.imageIndex = 0;
  }

  public void start() {
    if ( !this.run ) {
      return;
    }
    
    push();

    tint(255, 255 - transparency);
    image( images.get(this.imageIndex % images.size()), 0, 0);

    tint( 255, transparency );
    image( images.get( (this.imageIndex + 1) % images.size() ), 0, 0);

    if ( transparency < 255 ) {
      transparency += speed;
    } else {
      if ( !loopForever && this.imageIndex == images.size() - 2 ) {
        this.run = false;
      } else {
        transparency = 0;
        this.imageIndex++;
      }
    }
  
    pop();
  }
}
