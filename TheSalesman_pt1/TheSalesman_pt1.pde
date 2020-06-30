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

String[] intro =
  { "As a traveling salesman wandering through Middle-earth", 
  "your travels on this day have lead you to The Shire,", 
  "home of the Hobbits. Strolling through Hobbiton you come", 
  "across a distressed Hobbit. The Hobbit, who calls himself", 
  "Bilbo, explains that his precious ring was stolen during", 
  "the night. Bilbo presents to you the only thing left by the", 
  "thief, a small piece of papyrus with words written in a ", 
  "language he's unable to decipher, and pleads for your help."
};
String[] intro2 =
  { "Being that you are a kind salesman, you decide to help the", 
  "troubled Hobbit on his quest to find his missing ring. You", 
  "take a look at the writing and immediately realize you can", 
  "understand the language. You ask Bilbo for a map of the", 
  "Shire. You have a feeling that you know where to look next..."
};
String[] woodHall =
  {
  "You and Bilbo arrive at Woodhall in East-farthing. The town", 
  "is silent, except for some murmurs coming from one of the", 
  "hobbit holes. You approach and see a mysterious figure hold-", 
  "ing a ring in the palm of its hand. Upon seeing the ring,", 
  "Bilbo rushes at the unknown form, colliding with it, sending", 
  "the ring flying through the air and onto the ground by your", 
  "feet. You reach down to pick up the ring as if called by it. In", 
  "your hand, you feel the ring's dark power flowing through you..."
};
String[] toBeContinued =
  {
  "TO    BE    CONTINUED..."
};
String[] codeClue0 =
  {
  "    void draw(){", 
  "        while( !haveRing ) {", 
  "            if( currentTime() > midnight ) {", 
  "                stealRing();", 
  "                escape();", 
  "            }", 
  "        }", 
  "    }",
  "",
  "    private void escape() {", 
  "       int x = bilbosHouseX;", 
  "       int y = bilbosHouseY;", 
  "",
  "       while( x <= budgeFordX ) { x++; }", 
  "       while( y <= woodHallY  ) { y++; }", 
  "   }"
};

String[] codeClue1 =
  {
  "    void draw(){", 
  "        while( !haveRing ) {", 
  "            if( currentTime() > midnight ) {", 
  "                stealRing();", 
  "                escape();", 
  "            }", 
  "        }", 
  "    }",
  "",
  "    private void escape() {", 
  "       int x = bilbosHouseX;", 
  "       int y = bilbosHouseY;", 
  "",
  "       while( x <= ScaryX ) { x++; }", 
  "       while( y <= TuckBoroughY  ) { y++; }", 
  "   }"
};

String[] codeClue3 =
  {
  "        escape();", 
  "    }",
  "    private void escape() {", 
  "        HashMap<String, Location> shireLocations = getShireLocations();",
  "        int x = shireLocations.get(\"Bilbo's House\").x;",
  "        int y = shireLocations.get(\"Bilbo's House\").y;",
  "",
  "        for( String shireArea : shireLocations.keySet() ){",
  "            if( shireArea.equals( \"Scary\" ) ){",            
  "                while( x <= shireLocations.get( shireArea ).x ) {",
  "                    x++;",
  "                }",
  "            if( shireArea.equals( \"TuckBorough\" ) ){",
  "                while( y <= shireLocations.get( shireArea).y ) {",
  "                    y++;",
  "            }",
  "        }",
  "    }"
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
boolean woodHallFound = false;
boolean incorrect = false;

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
  
  hobbitHole = loadImage( "HobbitHole.jpg" );
  hobbitHole.resize( width, height );

  background( shireIRL );
}

void drawMessage( String[] message, PFont font ) {
  int messageX = 250;
  int messageY = 275;

  if ( font == codeFont ) {
    messageX = 300;
    messageY = 235;
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

void draw() {

  if ( step < 2 ) {
    background( shireIRL );
    fill( 0 );
    textFont( papyrusTitle );
    text( "The Traveling Salesman\n         of Middle-Earth:", 50, 120 );
    text( "Chapter I", 450, 550 );
  } else if( step == 2 || step == 3 ){
    background( map );
  } else {
    background( hobbitHole );
  }

  if ( showMessage ) {
    drawMessage( message, font );
  }

  if ( step == 3 && woodHallFound ) {
    noStroke();
    fill( 255, 0, 0 );
    rect( 570, 620, 50, 20 );
    rect( 630, 620, 50, 20 );
    rect( 690, 620, 50, 20 );
    rect( 750, 620, 50, 20 );
    rect( 810, 620, 50, 20 );
    rect( 870, 620, 50, 20 );

    rect( 930, 620, 20, 50 );
    rect( 930, 680, 20, 50 );
    rect( 930, 740, 20, 50 );
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

void keyPressed() {
  // Spacebar key
  if ( key == 32 ) {   
    showMessage = !showMessage;
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    if ( step == 0 ) {
      message = intro2;
      font = papyrus;
      step++;
    } else if ( step == 1 ) {
      message = codeClues[ codingLevel ];
      font = codeFont;
      visited.add( new Visited( star, null, 470, 570 ) );
      visited.add( new Visited( null, " Bilbo's\n  house", 500, 620 ) );
      step++;
    } else if ( step == 2 ) {
      if ( mouseX > 840 && mouseX < 1020 && mouseY > 750 && mouseY < 820 ) {
        woodHallFound = true;
        incorrect = false;
        visited.add( new Visited( redX, null, 890, 750 ) );
        step++;
      } else {
        incorrect = true;
      }
    } else if( step == 3 ) {
        visited.clear();
        showMessage = false;
        font = papyrus;
        message = woodHall;
        step++;
    } else if( step == 4 ) {
      message = toBeContinued;
      font = papyrus;
      step++;
    } else if ( step == 5 ) {
      visited.add( new Visited( ring, null, 400, 200 ) );
      step++;
    }
  }
}