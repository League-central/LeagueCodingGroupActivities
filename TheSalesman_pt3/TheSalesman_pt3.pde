int codingLevel = 3;

PFont papyrusTitle;
PFont papyrus;
PFont codeFont;
PImage map;
PImage shovel;
PImage redX;
PImage scroll;
PImage ring;
PImage star;
PImage shireIRL;
PImage hobbitHole;
PImage ringHand;
PImage twoPaths;
PImage hedgeMaze;
PImage middleEarth;
PImage prancingPony;
PImage prancingPonyBar;
PImage stein;
PImage bree;

String[] intro =
{ "Recap:",
  "You were a kind, traveling salesman who came to the aid of",

// Take the ring recap
//  "the Hobbit Bilbo to reclaim his stolen ring. When presented",
//  "with the opportunity to return the ring to Bilbo you chose",
//  "instead take the ring for yourself and flee. After escaping",

// Give Bilbo ring recap
  "the Hobbit Bilbo to reclaim his stolen ring. You were about",
  "give the ring back to Bilbo, but got a ominious feeling from",
  "the Hobbit and decided to flee with the ring. After escaping",


  "the Budgeford fields maze you leave the Shire and explore",
  "the rest of the Middle-Earth..."
};
String[] intro2 =
{
  "It's been 10 years since that fateful day you decided to",
  "flee with the ring. Since then you've been chased relentlessly",
  "by the servants of Sauron. Orcs, Trolls, Wargs, and the most",
  "terrible of all, The Nine Ringwraiths. You want to part with",
  "the One Ring, but you just can't. Its power over you is just",
  "too strong. On this day, after being chased for hours and",
  "dying of thirst, you enter a local inn called the Prancing Pony."
};
String[] intro3 =
{
  "You order 3 drinks and the barkeep puts 3 glasses of root",
  "beer in front of you. He has a suspicious look about him;",
  "something doesn't feel right. You're so thirsty that you",
  "immediatly grab the first glass in front of you, but",
  "before you take your first drink an image appears in your",
  "mind..."
};
String[] outro1 =
{
 "You drink from stein #1 and feel refreshed! The barkeep,",
 "shocked and furious, calls out and a number of mercenaries",
 "fill the room and draw their weapons. You use the ring's",
 "power to turn invisible (a trick you learned over the past",
 "10 years) and escape. Mentally and physically tired you",
 "decide enough is enough. You vow once and for all to discard",
 "the ring, but you can't do it alone. There's only one person",
 "you know of who can help you dispose of the ring for good..."
};
String[] toBeContinued =
  {
  "TO    BE    CONTINUED..."
};
String[] codeClue0 =
{
 "   public void pickRootBeerStein() {",
 "       int stein; numOfSteins = 3;",
 "",
 "       for( stein = 2; stein < numOfSteins; stein++ ) { }",
 "       addPoison( stein );",
 "",       
 "       for( stein = 2; stein > 0; stein -= numOfSteins ) { }",
 "       stein += numOfSteins;",
 "       addPoison( stein );",
 "   }",
 "   public void addPoison( int stein ) {",
 "       if( stein == 1 ) { this.stein1.addPoison(); }",
 "       if( stein == 2 ) { this.stein2.addPoison(); }",
 "       if( stein == 3 ) { this.stein3.addPoison(); }",
 "   }"
};
String[] codeClue1 =
{
 "   public void pickRootBeerStein() {",
 "       int stein; numOfSteins = 3;",
 "",
 "       for( stein = 2; stein < numOfSteins; stein++ ) { }",
 "       addPoison( stein );",
 "",       
 "       for( stein = 2; stein > -numOfSteins; stein -= numOfSteins ) { }",
 "       for(          ; stein <  numOfSteins; stein += numOfSteins ) { }",
 "       for(          ; stein >  0;           stein -= numOfSteins ) { }",
 "       stein += numOfSteins;",
 "       addPoison( stein );",
 "   }",
 "   public void addPoison( int stein ) {",
 "       if( stein == 1 ) { this.stein1.addPoison(); }",
 "       if( stein == 2 ) { this.stein2.addPoison(); }",
 "       if( stein == 3 ) { this.stein3.addPoison(); }",
 "   }"
};

String[] codeClue3 =
{
 "   int[] steins = { 1, 2, 3 };",
 "",
 "   public void pickRootBeerStein() {",
 "       addPoison( calculateStein( 1, 1 ) );",
 "       addPoison( calculateStein( 2, 2 ) );",
 "   }",
 "   public int calculateStein( int start, int numIterations ) {",
 "       int i;",
 "       for( i = 0; i < numIterations; i++ ) { }",
 "",    
 "       return steins[ ( i + start ) % steins.length ];",
 "   }",
 "   public void addPoison( int stein ) {",
 "       if( stein == 1 ) { this.stein1.addPoison(); }",
 "       if( stein == 2 ) { this.stein2.addPoison(); }",
 "       if( stein == 3 ) { this.stein3.addPoison(); }",
 "   }"
};

String[] codeClue2 = codeClue1;
String[] codeClue4 = codeClue3;
String[] codeClue5 = codeClue3;
String[][] codeClues = { codeClue0, codeClue1, codeClue2, codeClue3, codeClue4, codeClue5 };

ArrayList<Visited> visited = new ArrayList<Visited>(); 
int step = 0;
String[] message;
PFont font;
boolean showMessage;
boolean addTwoOptions = false;
boolean pathFound = false;

enum PATHS { LEFT, RIGHT };
PATHS pickedPath;

class Visited {
  int x;
  int y;
  PImage p;
  String text;

  public Visited( PImage p, String text, int x, int y ) {
    this.p = p;
    this.x = x;
    this.y = y;
    this.text = text;
  }
}

void setup() {
  size( 1400, 1000 );

  papyrusTitle = loadFont( "Papyrus-Regular-120.vlw" );
  papyrus = loadFont( "Papyrusr-36.vlw" );
  codeFont = loadFont( "CourierNew16.vlw" );
  message = intro;
  font = papyrus;

  showMessage = false;
  
  hobbitHole = loadImage( "HobbitHole.jpg" );
  hobbitHole.resize( width, height );

  shireIRL = loadImage( "shireIRL.jpg" );
  shireIRL.resize(width, height);

  scroll = loadImage( "scroll.png" );
  scroll.resize(1250, 500 );

  shovel = loadImage( "shovel.png" );
  shovel.resize( 100, 100 );

  redX = loadImage( "redX.png" );
  redX.resize(100, 100);

  map = loadImage( "TheShireMap.jpg" );
  map.resize(width, height);

  ring = loadImage( "ring.png" );
  ring.resize(700, 700);

  star = loadImage( "star.png" );
  star.resize(130, 110);
  
  ringHand = loadImage( "ringHand.png" );
  ringHand.resize( 500, 800 );
  
  twoPaths = loadImage( "twoPaths.jpg" );
  twoPaths.resize( width, height );
  
  hedgeMaze = loadImage( "hedgeMaze.jpg" );
  hedgeMaze.resize( width, height );
  
  middleEarth = loadImage( "MiddleEarth.jpg" );
  middleEarth.resize( width, height );
  
  prancingPony = loadImage( "PrancingPony.jpg" );
  prancingPony.resize( width, height );
  
  prancingPonyBar = loadImage( "PrancingPonyBar.jpg" );
  prancingPonyBar.resize( width, height );
  
  stein = loadImage( "stein.png" );
  stein.resize(400,275);
  
  bree = loadImage( "Bree.jpg" );
  bree.resize( width, height );

  background( hobbitHole );
}

void drawMessage( String[] message, PFont font ) {
  int messageX = 250;
  int messageY = 275;

  if ( font == codeFont ) {
    messageX = 300;
    messageY = 250;
  }

  image( scroll, 90, 150 );

  fill( 0 );
  textFont( font );

  for ( String line : message ) {
    text( line, messageX, messageY );

    if ( font == codeFont ) {
      messageY += 20;
    } else {
      messageY += 40;
    }
  }
}

boolean checkStein1(){
  return mouseX >= 100 && mouseX <= 350 && mouseY >= 650 && mouseY <= 1000;
}

boolean checkStein2(){
  return mouseX >= 420 && mouseX <= 720 && mouseY >= 650 && mouseY <= 1000;
}

boolean checkStein3(){
  return mouseX >= 800 && mouseX <= 1200 && mouseY >= 650 && mouseY <= 1000;
}

boolean checkStein(int x, int y){
 return mouseX >= x && mouseX <= x+350 && mouseY >= y && mouseY <= y+300;
}

void draw() {

  if ( step < 1 ) {
    background( middleEarth );
    fill( 255,255,255 );
    textFont( papyrusTitle );
    text( "The Traveling Salesman\n         of Middle-Earth:", 50, 120 );
    fill( 0 );
    text( "Chapter III", 450, 550 );
  } else if( step == 1 ) {
    
    background( prancingPony );
  } else if( step == 2 || step == 3 ){
    background( prancingPonyBar );
  } else if( step >= 4 ){
    background( bree );
  }

  if ( showMessage ) {
    drawMessage( message, font );
  }

  for ( Visited loc : visited ) {
    if ( loc.p == ring ) {
      filter( BLUR, 6 );
    }

    if ( loc.p != null ) {
      image( loc.p, loc.x, loc.y );
    }

    if ( loc.text != null ) {
      fill(0);
      textFont( codeFont );
      text( loc.text, loc.x, loc.y );
    }
  }
  
  if( step == 3 ){
    textSize( 60 );

    if( checkStein1() ){
      fill( #FFFF00 );
    } else {
      fill( #FFFFFF );
    }
    text( "1", 300, 900 );
    
    if( checkStein2() ){
      fill( #FFFF00 );
    } else {
      fill( #FFFFFF );
    }
    text( "2", 620, 900 );
    
    if( checkStein3() ){
      fill( #FFFF00 );
    } else {
      fill( #FFFFFF );
    }
    text( "3", 975, 900 );
  }
  
}

void keyPressed() {
  // Spacebar key
  if ( key == 32 ) {   
    showMessage = !showMessage;
  }
}

void mousePressed() {
  if(mouseButton == LEFT) {
    if( step == 0 ) {
      showMessage = false;
      message = intro2;
      font = papyrus;
      step++;
    } else if( step == 1 ) {
      showMessage = false;
      message = intro3;
      font = papyrus;
      step++;
    } else if( step == 2 ) {
      visited.add( new Visited( stein, null, 80, 650 ) );
      visited.add( new Visited( stein, null, 410, 650 ) );
      visited.add( new Visited( stein, null, 760, 650 ) );
      
      message = codeClues[ codingLevel ];  
      font = codeFont;
      step++;
    } else if( step == 3 ) {
      if( checkStein1() ){
        visited.clear();
        message = outro1;
        font = papyrus;
        step++;
      }
    } else if( step == 4 ) {
      message = toBeContinued;
      font = papyrus;
      step++;
    } else if( step == 5 ) {     
      visited.add( new Visited( ring, null, 400, 200 ) );
      step++;
    }
  } else if( mouseButton == RIGHT ){
   if( step == 3 ){
     if( checkStein2() ){
       visited.add( new Visited( redX, null, 600, 760 ) );
     }
     if( checkStein3() ){
       visited.add( new Visited( redX, null, 950, 760 ) );
     }
   }
  }
}