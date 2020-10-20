int codingLevel = 2;

PFont papyrusTitle;
PFont papyrus;
PFont codeFont;
PFont codeFontMedium;
PFont codeFontLarge;
PFont centFont;
PImage map;
PImage redX;
PImage scroll;
PImage ring;
PImage star;
PImage waterfall;
PImage market;
PImage snowMarket;
PImage twoPaths;
PImage handCursor;
PImage cell;
PImage study;
PImage table;
PImage yellowStone;
PImage fireplace;
PImage sunrise;
PImage riding;
PImage blueMountains;
PImage cave;
PImage caveEntrance;
PImage caveNoDoor;
PImage caveWall;
PImage stoneDoorWay;
PImage caveDoor;
PImage podium;
PImage gollum;

Pixelate chapterPx = null;

String[] intro =
  {
  "RECAP:", 
  "You are an orphan and thief in the northern city of", 
  "Galinor that was caught trying to scam a stranger in", 
  "an apothacary. The stranger, who calls himself Aniel,", 
  "brings you to the magical city of League, where you", 
  "reside for 6 months honing your talents in Avaj. After", 
  "passing the Istari with your friend Eherdad, Aniel asks", 
  "to speak with you after the graduation ceremony..."
};
String[] intro2 =
{
  "You arrive in Aniel's study. He sits with his back turned",
  "as he faces the fire. Even in limited view, he appears solemn",
  "and focused in thought. \"Congratulations, you've ascended",
  "far beyond your petty theivery in Galinor--and moreso",
  "beyond my own expectations. In fact, if not for the genius of",
  "Alatar, I believe you would have no equal in your class.\"",
  "~"
};
String[] intro3 =
{ 
  "\"A great and silent danger is upon us. I have tried to disclose",
  "my concerns to Saruman and the others in our order, but they",
  "all refuse to lend an ear. It is up to us to protect the lands",
  "of Middle-Earth before the darkness comes.",
  "I must admit, it was not pure benevolence that I decided to",
  "bring you to League. A great guilt hangs over me, as I nearly",
  "lost my last pupil on an expedition to Moria.",
  "All for this--\""
};

String[] intro4 =
{
  "\"At daybreak we ride to the Blue Mountains in the land",
  "of Eriador. A trusted source has given word that we",
  "shall find there what we are in search of.\""
};

String[] intro5 =
{
  "After roaming the mountainside for hours, you and Aniel",
  "discover the entrance to a recessed cave, burried deep",
  "within the foot of the mountain. Venturing into the cave",
  "your path is stopped by a wall of rock with a strange symbol",
  "etched into its surface.",
  "",
  "\"What is this bizarre symbol Aniel?\"",
  "\"It is marking of a language even older than Avaj.\""
};

String[] intro6 = {
  "\"Here, look at these markings. The remnants of a language",
  "nearly forgotten. I've heard from the elder wizards there",
  "exists an even older language, one that is responsible for",
  "*assembling* the very fabric of our existence...\"",
  "",
  "Aniel raises his staff and casts a spell of translation,",
  "altering the glyphs on the door."
};

String[] theEnd =
  {
  "", 
  "", 
  "", 
  "                                             The End"
};

String[] outro = 
{
  "You've solved the puzzle and the stone wall obstructing",
  "your path crumbles into dust!",
  "",
  "As you and Aniel enter, you can feel the magical power",
  "within the cave. The feeling grows as you approach the",
  "pedestal. Aniel hesistantly grabs the stone and you both",
  "quickly head back towards the mouth of the cave. You have",
  "had a strange feeling ever since you entered the cave,",
};

String[] outro2 =
{
  "as if you were being followed. You have kept your suspicions",
  "within, not wanting to garner doubt and rile the temper",
  "of a powerful wizard after a long days ride. You glace",
  "behind you and you're immediatly met with the source of",
  "your apprehension and the second secret kept within the",
  "cave."
};

String[] toBeContinued =
{
  "TO    BE    CONTINUED..."
};

String[] codeClue0 =
{
  
};

String[] codeClue1 =
{
  
};

String[] codeClue2 =
{
  "public void sequence() {",
  "    ArrayList<String> order = new ArrayList<String>();",
  "    order.add( row4[0] );",
  "",
  "    for (int i = 0; i < row1.length; i++) {",
  "        if( i == 1 ) { order.add( row1[i] ); }",
  "    }",
  "",
  "    for (int i = 0; i < row2.length; i++) {",
  "        if( i == 3 ) { order.add( row2[i] ); }",
  "    }",
  "",   
  "    for (int i = 0; i < row3.length; i++) {",
  "        if( i == 4 ) { order.add( row3[i] ); }",
  "    }",
  "",
  "    order.add( row0[3] );",
  "}"
};

String[] codeClue4 =
  {
    "public ArrayList<String> sequence(String[][] symbols) {",
    "    ArrayList<String> order = new ArrayList<String>();",
    "    order.add(symbols[4][0]);",
    "",
    "    for (int row = 0; row < symbols.length; row++) {",
    "        for (int col = 0; col < symbols[row].length; col++) {",
    "            if (order.size() == 1 && row == 1 && col == 1) {",
    "                order.add(symbols[row][col]);",
    "            } else if (order.size() == 2 && row == 2 && col == 3) {",
    "                order.add(symbols[row][col]);",
    "            } else if (order.size() == 3 && row == 3 && col == 4) {",
    "                order.add(symbols[row][col]);",
    "            }",
    "        }",
    "    }",
    "    order.add(symbols[0][3]);",
    "    return order;",
    "}"
};

String[] codeClue3 = codeClue2;
String[] codeClue5 = codeClue4;
String[][] codeClues = { codeClue0, codeClue1, codeClue2, codeClue3, codeClue4, codeClue5 };

ArrayList<Visited> visited = new ArrayList<Visited>(); 
int step = 0;
String[] message;
PFont font;
boolean showMessage;
Transition blueMtnMontage;
ArrayList<PImage> blueMtnImages = new ArrayList<PImage>();
String[] symbols =
{ "#define", "void(*f)()", "volatile", "goto", "const",
  "stdout", "size_t", "#ifdef", "extern", "#include",
  "stdio.h", "typedef", "p->var", "struct", "printf",
  "&var", "free", "*ptr", "malloc", "**pptr",
  "void*", "sizeof", "NULL", "union", "memset",
};
String[] correctSymbols = { "void*", "size_t", "struct", "**pptr", "goto" };
ArrayList<RockButton> pressedRockButtons = new ArrayList<RockButton>();
boolean codeCompleted = false;
Dustify caveWallDust;
int transparency = 0;

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
  initializeRockButtons();

  papyrusTitle = loadFont( "Papyrus-Regular-120.vlw" );
  papyrus = loadFont( "Papyrusr-36.vlw" );
  codeFont = loadFont( "CourierNew16.vlw" );
  codeFontMedium = loadFont( "CourierB24.vlw" );
  codeFontLarge = loadFont( "CourierB32.vlw" );
  centFont = loadFont( "Centaur-48.vlw" );
  message = intro;
  font = papyrus;

  showMessage = false;

  scroll = loadImage( "scroll.png" );
  scroll.resize(1250, 500 );

  redX = loadImage( "redX.png" );
  redX.resize(300, 300);

  ring = loadImage( "ring.png" );
  ring.resize(700, 700);

  waterfall = loadImage( "waterfall.jpg" );
  waterfall.resize(width, height);
  
  study = loadImage( "study.jpg" );
  study.resize(width, height);

  table = loadImage( "table.jpg" );
  table.resize(width,height);

  yellowStone = loadImage( "yellowStone.png" );
  yellowStone.resize( 300, 200 );

  fireplace = loadImage( "fireplace.jpg" );
  fireplace.resize(width,height);
  
  fireplace = loadImage( "fireplace.jpg" );
  fireplace.resize(width,height);
  
  sunrise = loadImage( "sunrise.jpg" );
  sunrise.resize(width,height);
  
  riding = loadImage( "riding5.jpg" );
  riding.resize(width,height);
  
  blueMountains = loadImage( "blueMountains.jpg" ); 
  blueMountains.resize(width,height);
  
  cave = loadImage( "cave5.png" ); 
  cave.resize(width,height);
  
  caveEntrance = loadImage( "caveEntrace2.png" );
  caveEntrance.resize(width,height);

  caveNoDoor = loadImage( "caveCopy.jpg" ); 
  caveNoDoor.resize(width,height);
  
  caveDoor = loadImage( "stoneDoorWay3b.png" );
  caveDoor.resize(350, 380);

  caveWall = loadImage( "caveWall4.jpg" ); 
  caveWall.resize(width,height);
    
  podium = loadImage( "cave6.png" );
  podium.resize(width,height);

  gollum = loadImage( "gollum.jpg" );
  gollum.resize(width,height);

  blueMtnImages.add( fireplace );
  blueMtnImages.add( sunrise );
  blueMtnImages.add( riding );
  blueMtnImages.add( blueMountains );
  blueMtnImages.add( caveEntrance );
  blueMtnMontage = new Transition( blueMtnImages, 2, false );

  background( waterfall );
}

void drawMessage( String[] message, PFont font ) {
  int messageX = 250;
  int messageY = 275;

  if ( font == codeFont ) {
    messageX = 300;
    messageY = 235;
  }

  if ( step == 6 ) {
//    font = papyrus;
//    messageY -= ( 150 - 0 );
//    image( scroll, 90, 0 );
  } else {
    image( scroll, 90, 150 );
  }

  if ( message != null ) {
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
}

void draw() {

  if ( step < 1 ) {
    background( waterfall );
    fill( 0 );
    textFont( papyrusTitle );
    text( "The Thief of Galinor:", 125, 250 );
  } else if ( step == 1 ) {
    background( waterfall );
    fill( 0 );
    textFont( papyrusTitle );
    text( "The Thief of Galinor:", 125, 250 );
    chapterPx.drawPixels();
  } else if ( step == 2 ) {
    background( study );
  } else if ( step == 3 ) {
    background( study );
  } else if ( step == 4 ) {
    background( table );
  } else if ( step == 5 ) {
    background( fireplace );
  } else if ( step == 6 ) {
    blueMtnMontage.start();
  } else if ( step == 7 ) {
    background( caveEntrance );
  } else if ( step == 8 ) {
    background( cave );  
} else if ( step == 9 ) {
    background( caveWall );
    drawButtons();
  } else if ( step == 10 ) {
    background( caveNoDoor );
    if( ! caveWallDust.hasBeenReset ){
      caveWallDust.reset();
    }
    if( transparency < 140 ){
      push();
      tint(255, 255 - transparency);
      image(caveDoor, 380, 290);
      transparency++;
      pop();
    } else {
      caveWallDust.draw();
    }
  } else if ( step == 11 ) {
    background( podium );
  } else if ( step == 12 ) {
    background( podium );
  } else if ( step >= 13 ) {
    background( gollum );
  }

  for ( Visited loc : visited ) {
    if ( loc.p == ring ) {
      filter( BLUR, 6 );
    }

    if ( loc.p != null ) {
      image( loc.p, loc.x, loc.y );
    }

    if ( loc.text != null ) {
      fill(#FFFFFF);
      textFont( papyrus );
      textSize( 64 );
      text( loc.text, loc.x, loc.y );
    }
  }

  if ( showMessage ) {
    drawMessage( message, font );
  }
 //<>//
  if ( step == 10 ) {
    for ( Visited loc : visited ) {
      if ( loc.p == ring ) {
        filter( BLUR, 6 );
      }
      if ( loc.p != null ) {
        image( loc.p, loc.x, loc.y );
      }
    }
  }
}

void keyPressed() {
  // Spacebar key
  if ( key == 32 ) {   
    showMessage = !showMessage;
  }
  if( step == 8 ){
    if ( key == (int)'q' ) {
      resetButtons();
    }
  }
}

// Kill pixels that are in range
void mouseDragged() {
  if (mouseButton == RIGHT) {
    if ( step == 1 && chapterPx != null ) {
      for (Particle particle : chapterPx.getParticles() ) {
        if (dist(particle.pos.x, particle.pos.y, mouseX, mouseY) < 50) {
          particle.kill();
        }
      }
    }
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    if( step == 9 ){
      if( isWinningButtonOrder() ){
        codeCompleted = true;
      } else {
        visited.add( new Visited(redX, null, width/2 - redX.width/2, height/2 - redX.height/2) );
      }
    }
    
    progressGame();
  } else if( mouseButton == RIGHT ){
     if( step == 9 ){
       checkButtons();
     }
  }
}

RockButton[] buttons = new RockButton[25];
void initializeRockButtons(){
  int numRows = 5;
  int numCols = 5;
  int startX = 200;
  int startY = 150;
  
  for( int i = 0; i < buttons.length; i++ ){
    int x = startX + ( ( i % numCols ) * RockButton.width );
    int y = startY + ( ( i / numRows ) * RockButton.height );
    
    buttons[i] = new RockButton(x, y, symbols[i]);
  }
}

RockButton checkButtons(){
  for( int i = 0; i < buttons.length; i++ ){
    if( buttons[i].isMousePressed() ){
      if( !buttons[i].isPressed ){
         pressedRockButtons.add( buttons[i] ); 
      } else {
        pressedRockButtons.remove( buttons[i] );
      }
      
      buttons[i].togglePressed();
      return buttons[i];
    }
  }
  
  return null;
}

void drawButtons(){
 for( RockButton button : buttons ){
   button.draw();
 }
}

void resetButtons(){
  for( int i = 0; i < buttons.length; i++ ){
    buttons[i].setPressed(false);
  }
  
  pressedRockButtons.clear();
  visited.clear();
}

public boolean isWinningButtonOrder(){
  boolean isWinningOrder = false;
  
  if( pressedRockButtons.size() == correctSymbols.length ){ //<>//
    for( int i = 0; i < pressedRockButtons.size(); i++ ){
      isWinningOrder = true;
      String rockSymbol = pressedRockButtons.get(i).symbol; 
      
      if( !rockSymbol.equals( correctSymbols[i] ) ){
        isWinningOrder = false;
        break;
      }
    }
  } 
  return isWinningOrder;
}

public void progressGame() {
  if ( step == 0 ) {
    showMessage = false;
    chapterPx = new Pixelate( "Chapter III", papyrusTitle, 650, 450 );
    font = papyrus;
    step++;
  } else if ( step == 1 ) {
    showMessage = false;
    message = intro2;
    step++;
  } else if ( step == 2 ) {
    showMessage = true;
    font = papyrus;
    message = intro3;
    step++;
  } else if ( step == 3 ) {
    visited.add( new Visited(yellowStone, null, width/2 - yellowStone.width/2, height/2 - yellowStone.height/2) );
    showMessage = false;
    step++;
  } else if ( step == 4 ) {
    visited.clear();
    showMessage = true;
    message = intro4;
    font = papyrus;
    step++;
  } else if ( step == 5 ) {
    showMessage = false;
    message = null;
    step++;
  } else if ( step == 6 ) {
    showMessage = false;
    message = intro5;
    step++;
  } else if ( step == 7 ) {
    showMessage = false;
    message = intro6;
    step++;
  } else if ( step == 8 ) {
    showMessage = false;
    message = codeClues[ codingLevel ];
    font = codeFont;
    step++; 
  } else if ( step == 9 ) {
    if( codeCompleted ){
      caveWallDust = new Dustify( caveDoor, 380, 290 );
      message = outro;
      font = papyrus;
      step++;
    }
  } else if ( step == 10 ) {
    message = outro;
    font = papyrus;
    step++;
  } else if ( step == 11 ) {
    showMessage = true;
    message = outro2;
    font = papyrus;
    step++;
  } else if ( step == 12 ) {
    message = toBeContinued;
    font = papyrus;
    showMessage = false;
    step++;
  } else if ( step == 13 ) {
    visited.add( new Visited( ring, null, 400, 200 ) );
    step++;
  } else if ( step == 20 ) {
    showMessage = true;
    message = theEnd;
    font = papyrus;
  }

  println( "step = " + step );
}
