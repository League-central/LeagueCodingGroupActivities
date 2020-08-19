public class ProgressBar {
  PImage progressBar;
  int x;
  int y;
  int width;
  int height;
  int progress;
  int slots = 10;
  float barHeight;
  float barWidth;
  float barX;
  float barY;
  float barGap;
  int barColor;

  public ProgressBar( int x, int y, float width, float height, int barColor ) {
    progressBar = loadImage("progress_bar.png"); 
    this.x = x;
    this.y = y;
    this.width = int(width);
    this.height = int(height);
    this.barColor = barColor;

    this.progress = 0;
    this.barWidth = ( ( width / progressBar.width ) * 73.0 );
    this.barHeight = ( ( height / progressBar.height ) * 133.0 );
    this.barX = ( ( width / progressBar.width ) * 71.0 );
    this.barY = ( ( height / progressBar.height ) * 88.0 );
    this.barGap = ( ( width / progressBar.width ) * 9.4 );
    
    progressBar.resize(this.width, this.height);
  }

  public void update() {
    if( progress < slots ){
      progress++;
    }
  }

  public boolean isFull() {
    return progress == slots;
  }
  
  public void draw(){
    image( progressBar, x, y );
    
    for ( int i = 0; i < progress; i++ ) {
      float xPos = x + barX + ( i * barWidth ) + ( i * barGap );
      float yPos = y + barY;
      
      fill( this.barColor );
      rect( xPos, yPos, barWidth, barHeight);
    }
  }
}
