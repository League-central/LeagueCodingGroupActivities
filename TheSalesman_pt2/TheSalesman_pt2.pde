int codingLevel = 1;

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

String[] intro =
  { "Recap:", 
  "You are a kind, traveling salesman who kindly agreed to help", 
  "a distraught hobbit named Bilbo find his stolen ring. You", 
  "and Bilbo tracked the thief to Woodhall in The Shire and", 
  "amidst the struggle to reclaim the ring, it falls before you", 
  "and you hold it in the palm of your hand...", 
};
String[] intro2 =
  {
  "You hear whispers in your mind as you gaze at the ring, then", 
  "you hear another voice reminding you that your original intent", 
  "was to help Bilbo. You have to make a choice.", 
};
String[] takeRing =
  {
  "You take the ring and flee, leaving Bilbo and the thief, who", 
  "both begin chasing YOU. Not knowing how to use the powers", 
  "of the ring, you run North and enter an area with high", 
  "grown fields. After runing farther into the fields you hear", 
  "\"Fool! You've run into the Budgeford fields! No one but", 
  "Hobbits can escape this field maze\". Lost and desperate, you", 
  "put on the ring and see an image in your mind. Somehow you", 
  "know you can trust this image..."
};
String[] takeRing2 =
  {
  "Right, Left, Right, Up, Left, Up. You found your way out", 
  "of the maze! You gaze at the ring on your finger. You have", 
  "a sense you've only just begun to unlock the ring's true", 
  "power."
};
String[] giveRing =
{
  "You break up the fight with Bilbo and the theif. The theif", 
  "steps into the light. The theif is a Hobbit! Before you can",
  "even ask any questions, Bilbo, with a crazed look in his eyes",
  "demands the ring back and violently yells that, \"no one shall", 
  "ever take my precious ring!\". Bilbo charges at you and you",
  " back away. You get a feeling that the ring isn't safe with",
  "Bilbo..."
};
String[] toBeContinued =
  {
  "TO    BE    CONTINUED..."
};
String[] codeClue0 =
  {
  "       // U = Up; D = Down; R = Right; L = Left", 
  "       String directions = \"UDXR_RXLU_DXRD_XUUU_LXLU_DDXU\";", 
  "", 
  "       for( int i = 0; i < directions.length(); i++ ) {", 
  "", 
  "           if( directions.charAt( i ) == 'X' ) {", 
  "               move( directions.charAt( i+1 ) );", 
  "           }", 
  "       }", 
};
String[] codeClue1 =
  {
  "   public void mazeBreakOut() {", 
  "       // U = Up; D = Down; R = Right; L = Left", 
  "       String directions = \"U_D_D_R_R_D_D_L_L_R_D_R_U_L_L_U_R_L_L_L_U\";", 
  "", 
  "       for( int i = 0; i < directions.length(); i++ ) {", 

  "           if( directions.charAt( i ) == 'D' && directions.charAt( i+2 ) == 'D' ) {", 
  "               move( directions.charAt( i+4 ) );", 
  "           }", 
  "", 
  "           if( directions.charAt( i ) == 'L' && directions.charAt( i+2 ) == 'L' ) {", 
  "               move( directions.charAt( i+4 ) );", 
  "           }", 
  "       }", 
  "   }", 
};

String[] codeClue3 =
  {
  "      // U = Up; D = Down; R = Right; L = Left", 
  "      char[] all = { 'R', 'D', 'D', 'U', 'D', 'D', 'L', 'R', 'L', 'L', 'U',", 
  "                     'R', 'U', 'L', 'L', 'R', 'U', 'L', 'L', 'L', 'R' };", 
  "      Stack<Character> directions = new Stack<Character>();", 
  "", 
  "      for( int i = 0; i < all.length; i++ ) {", 
  "          if( all[ i ] == 'D' && all[ i+1 ] == 'D' ) {", 
  "              directions.push( all[ i+2 ] );", 
  "          }", 
  "", 
  "          if( all[ i ] == 'L' && all[ i+1 ] == 'L' ) {", 
  "              directions.push( all[ i+2 ] );", 
  "          }", 
  "      }", 
  "      while( !directions.isEmpty() ) {", 
  "          move( directions.pop() );", 
  "      }"
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

enum PATHS { 
  LEFT, RIGHT
};
PATHS pickedPath = null;

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

boolean checkLeftOption() {
  return mouseX >= 100 && mouseX <= 500 && mouseY >= 300 && mouseY <= 400;
}

boolean checkRightOption() {
  return mouseX >= 1000 && mouseX <= 1350 && mouseY >= 300 && mouseY <= 400;
}

void pathing( int step ) {
  fill( 255, 0, 0 );

  switch( step ) {
  case 1:
    rect( 500, 850, 50, 20 );
    rect( 560, 850, 50, 20 );
    break;
  case 2:
    rect( 620, 800, 20, 50 );
    rect( 620, 740, 20, 50 );
    break;
  case 3:
    rect( 620, 710, 50, 20 );
    rect( 680, 710, 50, 20 );
    break;
  case 4:
    rect( 740, 710, 50, 20 );
    rect( 800, 710, 50, 20 );
    break;
  case 5:
    rect( 860, 660, 20, 50 );
    rect( 860, 600, 20, 50 );
    break;
  case 6:
    rect( 860, 540, 20, 50 );
    rect( 860, 480, 20, 50 );
    break;
  default:
    break;
  }
}

int[] paths = new int[ 6 ];
void drawPath( int lastStep ) {
  for ( int i = 1; i <= lastStep; i++ ) {
    pathing( i );
  }
}

void draw() {
  if ( step < 1 ) {
    background( hobbitHole );
    fill( 255, 255, 255 );
    textFont( papyrusTitle );
    text( "The Traveling Salesman\n         of Middle-Earth:", 50, 120 );
    fill( 0 );
    text( "Chapter II", 450, 550 );
  } else if ( step == 1 || ( step == 2 && pickedPath == null ) ) {
    background( twoPaths );
    image( ringHand, 400, 450 );
  } else if ( pickedPath == PATHS.LEFT && step >= 2 ) {
    if ( step == 3 ) {
      background( hedgeMaze );
    } else if ( step == 11 ) {
      background( hobbitHole );
    } else if ( step == 4 ) {
      background( 0, 150, 0 );
    } else {
      background( shireIRL );
    }
  } else if ( pickedPath == PATHS.RIGHT && step >= 2 ) {
    if ( step == 3 ) {
      background( hedgeMaze );
    } else if ( step == 4 ) {
      background( 0, 150, 0 );
    } else {
      background( shireIRL );
    }
  } else if( step == 2 ){
    background( twoPaths );
  }

  if ( addTwoOptions ) {
    int fillColorLeft = 0;
    int fillColorRight = 0;

    textFont( papyrus );
    textSize(60);

    if ( checkLeftOption() ) {
      fillColorLeft = #FFFF00;
    }
    fill( fillColorLeft );
    text( "Give the ring", 100, 350 );
    text( "to Bilbo", 150, 400 );

    if ( checkRightOption() ) {
      fillColorRight = #FFFF00;
    }
    fill( fillColorRight );
    text( "Take the ring", 1000, 350 );
    text( "for yourself", 1030, 400 );
  }
  
  if ( step == 4 ) {
    if ( curDir == 1 ) {
      text( "RIGHT", 500, 100 );
    } else if ( curDir == 2 ) {
      text( "RIGHT, LEFT", 500, 100 );
    } else if ( curDir == 3 ) {
      text( "RIGHT, LEFT, RIGHT", 500, 100 );
    } else if ( curDir == 4 ) {
      text( "RIGHT, LEFT, RIGHT, UP", 500, 100 );
    } else if ( curDir == 5 ) {
      text( "RIGHT, LEFT, RIGHT, UP, LEFT", 500, 100 );
    } else if ( curDir == 6 ) {
      text( "RIGHT, LEFT, RIGHT, UP, LEFT, UP", 500, 100 );
    }

    drawPath( curDir );
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
}

int[] directionKeyCodes = { RIGHT, LEFT, RIGHT, UP, LEFT, UP };
int curDir = 0;

void keyPressed() {
  // Spacebar key
  if ( key == 32 ) {   
    showMessage = !showMessage;
  }

  if ( step == 4 ) {
    if ( curDir < directionKeyCodes.length && keyCode == directionKeyCodes[ curDir ] ) {

      curDir++;
      if ( curDir == directionKeyCodes.length ) {
        pathFound = true;
      }
    } else if ( key != 32 ) {
      curDir = 0;
      background( 0, 150, 0 );
    }
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    if ( step == 0 ) {
      message = intro2;
      font = papyrus;
      step++;
    } else if ( step == 1 ) {
      showMessage = false;
      addTwoOptions = true;
      step++;
    } else if ( step == 2 ) {   
      if ( checkLeftOption() || checkRightOption() ) {
        addTwoOptions = false;
        visited.clear();

        if ( checkLeftOption() ) {
          pickedPath = PATHS.LEFT;
          message = giveRing;
          step = 10;
        } else {
          pickedPath = PATHS.RIGHT;
          message = takeRing;
        }

        font = papyrus;
        step++;
      }
    } else if ( step == 3 ) {
      visited.add( new Visited( star, null, 400, 800 ) );
      visited.add( new Visited( null, "  maze\n start", 430, 845 ) );

      message = codeClues[ codingLevel ];  
      font = codeFont;
      step++;
    } else if ( step == 4 && pathFound ) {
      visited.clear();
      message = takeRing2;
      font = papyrus;
      step++;
    } else if ( step == 5 ) {     
      message = toBeContinued;
      font = papyrus;
      step++;
    } else if ( step == 6 ) {
      visited.add( new Visited( ring, null, 400, 200 ) );
      step++;
    } else if ( step >= 10 ) {
      message = takeRing;
      step = 3;
    }
  }
}