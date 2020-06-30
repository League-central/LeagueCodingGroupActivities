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
PImage league;
PImage rainyLeague;
PImage study;
PImage table;
PImage blueStone;
PImage redStone;
PImage greenStone;
PImage orangeStone;
PImage yellowStone;
PImage purpleStone;
PImage bedroom;
PImage spark;
PImage metalRod;
PImage metalRodSmall;

String[] intro =
{ "Recap:",
  "You are traveling salesman who has been chased relentlessly",
  "by the minions of the dark lord Sauron for the past 10 years.",
  "It all started when you decided to flee with the ring after",
  "helping Bilbo reclaim it. To this day you have regretted this",
  "decision. But it all ends this day as you enter the town of",
  "League to meet the only person you know of who can help",
  "free you from this cursed ring once and for all."
};
String[] intro2 =
{
  "Amidst pouring rain and thunder you enter the ancient town",
  "of League, where the finest wizards and sorceresses are",
  "gathered. You are here to meet Aniel, the one who taught you",
  "the ancient language of Avaj. Long has the ring spoken to",
  "you in this language, but only now have you realized there",
  "must be a reason why. You speak with Aniel after his class",
  "and explain your situation. He takes a short, quiet look at",
  "the ring while rain and thunder echo through the hall.",
};
String[] intro3 =
{
  "\"Come with me\" exclaims Aniel as you follow him to the",
  "study. He has a number of bright gemstones collected on",
  "the desk. Then he hands you two pieces of metal thread and",
  "tells you to place both ends on the ring. You attach the",
  "threads and look at Aniel, puzzled. \"Look\". You look down",
  "at the ring and suddenly the markings upon the band appear",
  "as clear as the white bolts crashing from the sky:"
};
String[] ringBand =
{
  "TheOneRing oneRing = new TheOneRing( \"Sauron\" );",
  "",
  "ruleThem( oneRing );",
  "findThem( oneRing );",
  "bringThem( oneRing );",
  "bindThem( inDarkness() );",
};
String[] innerRing =
{
 "you then notice, in smaller text, on the inside of the ring:", 
};
String[] ringBand2 = 
{
  "if( oneRing.getCharge() < 100 ){ oneRing.control( ringBearer ); }",
};

String[] intro4 =
{
  "",
  "",
  "",
  ""
};

String[] outro1 =
{
 "A large spark comes from the ring and launches you across",
 "the room into a booshelf. With consciousness fading, you",
 "think to yourself, 'where did these stones come from' and",
 "'how did Aniel know how to reveal the hidden script on the",
 "ring so quickly'..."
};
String[] outro2 = 
{
 "Some time later you awake in a daze, unsure of how long",
 "you've been asleep. Just then, your mind sharpens and you",
 "frantically look for the ring, but find it nowhere. Your",
 "eyes dart to the doorway and you see Aniel, with someone",
 "standing next to him. The outline looks strangely familiar.",
 "You've seen this person before, but just can't remember",
 "where. Then suddenly you remember--the person is the theif",
 "from the Shire that stole the ring from Bilbo 10 years ago!"
};
String[] toBeContinued =
  {
  "TO    BE    CONTINUED..."
};
String[] theEnd =
{
  "",
  "",
  "",
  "                                             The End"
};
String[] codeClue0 =
{
 "public void blueStone {",
 "    if( onLeft ( redStone )   { charge += 0;  } else { charge += 20; }",
 "    if( onRight( greenStone ) { charge -= 20; } else { charge += 10; }",
 "}",
 "public void redStone {",
 "    if( onLeft ( yellowStone ){ charge += 10; } else { charge -= 10; }",
 "    if( onRight( blueStone )  { charge += 10; } else { charge += 20; }",
 "}",
 "public void greenStone {",
 "    if( onLeft ( blueStone )  { charge += 20; } else { charge += 10; }",
 "    if( onRight( isEmpty() )  { charge += 20; } else { charge -= 60; }",
 "}",
 "public void yellowStone {",
 "    if( onLeft ( isEmpty() )  { charge += 20; } else { charge -= 60; }",
 "    if( onRight( redStone )   { charge += 30; } else { charge += 10; }",
 "}",
};
String[] codeClue1 =
{
 "public void blueStone {",
 "    if( onLeft ( redStone )   { charge += 0;  } else { charge += 20; }",
 "    if( onRight( greenStone ) { charge -= 20; } else { charge += 10; }",
 "}",
 "public void redStone {",
 "    if( onLeft ( yellowStone ){ charge += 10; } else { charge -= 10; }",
 "    if( onRight( blueStone )  { charge += 10; } else { charge += 20; }",
 "}",
 "public void greenStone {",
 "    if( onLeft ( blueStone )  { charge += 20; } else { charge += 10; }",
 "    if( onRight( !isEmpty() ) { charge -= 60; } else { charge += 20; }",
 "}",
 "public void yellowStone {",
 "    if( onLeft ( isEmpty() )  { charge += 20; } else { charge -= 60; }",
 "    if( onRight( redStone )   { charge += 30; } else { charge += 10; }",
 "}",
};

String[] codeClue3 =
{
 ""
};

String[] codeClue2 = codeClue1;
String[] codeClue4 = codeClue3;
String[] codeClue5 = codeClue3;
String[][] codeClues = { codeClue0, codeClue1, codeClue2, codeClue3, codeClue4, codeClue5 };

ArrayList<Visited> visited = new ArrayList<Visited>(); 
ArrayList<Visited> metalRods = new ArrayList<Visited>();
int step = 0;
String[] message;
PFont font;
boolean showMessage;
boolean addTwoOptions = false;
boolean pathFound = false;
boolean chargeSuccess = false;

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
  
  league = loadImage( "League.jpg" );
  league.resize( width, height );
  
  rainyLeague = loadImage( "rainyLeague.jpg" );
  rainyLeague.resize(width,height);
  
  study = loadImage( "study.jpg" );
  study.resize(width, height);
  
  table = loadImage( "table.jpg" );
  table.resize(width,height);
  
  blueStone = loadImage( "blueStone.png" );
  blueStone.resize( 300, 200 );
  
  redStone = loadImage( "redStone.png" );
  redStone.resize( 300, 200 );

  orangeStone = loadImage( "orangeStone.png" );
  orangeStone.resize( 300, 200 );

  greenStone = loadImage( "greenStone.png" );
  greenStone.resize( 300, 200 );
  
  yellowStone = loadImage( "yellowStone.png" );
  yellowStone.resize( 300, 200 );
  
  purpleStone = loadImage( "purpleStone.png" );
  purpleStone.resize( 300, 200 );
  
  bedroom = loadImage( "bedroom.jpg" );
  bedroom.resize( width, height );
  
  spark = loadImage( "spark.png" );
  spark.resize( 700, 700);
  
  metalRod = loadImage( "metalRod.png" );
  metalRod.resize( 90, 50 );
  
  metalRodSmall = loadImage( "metalRod.png" );
  metalRodSmall.resize( 60, 50 );

  background( league );
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
  
  if( step == 3 ){
    messageX = 250;
    messageY = 275 + ( ( message.length + 1 ) * 20 );
    textFont( papyrus );
    text( innerRing[0], messageX, messageY );

    messageX = 300;
    messageY += 60;
    textFont( codeFont );
    text( ringBand2[0], messageX, messageY );
    
    messageX = 250;
    messageY += 60;
    textFont( papyrus );
    text( "You ask Aniel if you can take a closer look at the gemstones...", messageX, messageY );
  }
}

void draw() {

  if ( step < 1 ) {
    background( league );
    fill( 255,255,255 );
    textFont( papyrusTitle );
    text( "The Traveling Salesman\n         of Middle-Earth:", 50, 120 );
    fill( 0 );
    text( "Chapter IV", 450, 550 );
  } else if( step == 1 ) {
    background( rainyLeague );
  } else if( step >= 2 && step <= 3 ){
    background( study );
  } else if( step == 4 ){
    background( table );
  } else if( step == 5 ){
    background( study );
  } else if( step >= 6 ){
    background( bedroom );
  }

  if( showMessage ) {
    drawMessage( message, font );
  }

  for( Visited loc : visited ) {
    if( loc.p == ring ) {
      filter( BLUR, 6 );
    }

    if( loc.p != null ) {
      image( loc.p, loc.x, loc.y );
    }

    if( loc.text != null ) {
      fill(#0000FF);
      textFont( codeFont );
      textSize( 48 );
      text( loc.text, loc.x, loc.y );
    }
  }
  
  for( Visited metal : metalRods ){
    if( metal.p != null ) {
      image( metal.p, metal.x, metal.y );
    }
  }
}

void keyPressed() {
  // Spacebar key
  if( key == 32 ) {   
    showMessage = !showMessage;
  }
  
  if( step == 4 ){
    if( key == (int)'q' ){
      visited.clear();

    } else if( visited.size() < 4 ){
      if( key == (int)'r' ){
        if( !visited.contains( redStoneObj ) ){
          visited.add( createRedStoneObj() );
        }
      } else if( key == (int)'b' ){
        if( !visited.contains( blueStoneObj ) ){
          visited.add( createBlueStoneObj() );
        }
      } else if( key == (int)'g' ){
        if( !visited.contains( greenStoneObj ) ){
          visited.add( createGreenStoneObj() );
        }
      } else if( key == (int)'y' ){
        if( !visited.contains( yellowStoneObj ) ){
          visited.add( createYellowStoneObj() );
        }
      }
    }
    
    if( visited.size() == 4 ){
      int charge = 0;
      
      int blueIndex = visited.indexOf( blueStoneObj );
      int redIndex = visited.indexOf( redStoneObj );
      int greenIndex = visited.indexOf( greenStoneObj );
      int yellowIndex = visited.indexOf( yellowStoneObj );
      
      println( "b " + blueIndex + "; " + "r " + redIndex + "; " + "g " + greenIndex + "; " + "y " + yellowIndex );
      
      charge += ( blueIndex - 1 == redIndex )   ?   0 : 20;
      charge += ( blueIndex + 1 == greenIndex ) ? -20 : 10;
      println( "charge: " + charge );
      
      charge += ( redIndex - 1 == yellowIndex ) ? 10 : -10;
      charge += ( redIndex + 1 == blueIndex )   ? 10 :  20;
      println( "charge: " + charge );
      
      charge += ( greenIndex - 1 == blueIndex ) ?   20 : 10;
      charge += ( greenIndex != 3 )             ?  -60 : 20;
      println( "charge: " + charge );
      
      charge += ( yellowIndex == 0 )            ? 20 : -60;
      charge += ( yellowIndex + 1 == redIndex ) ? 30 :  10;
      
      println( "charge: " + charge );
      visited.add( new Visited( null, "charge: " + charge, 500, 975 ) );
      
// "public void blueStone {",
// "    if( onLeft ( redStone )   { charge += 0;  } else { charge += 20; }",
// "    if( onRight( greenStone ) { charge -= 20; } else { charge += 10; }",
// "}",
// "public void redStone {",
// "    if( onLeft ( yellowStone ){ charge += 10; } else { charge -= 10; }",
// "    if( onRight( blueStone )  { charge += 10; } else { charge += 20; }",
// "}",
// "public void greenStone {",
// "    if( onLeft ( blueStone )  { charge += 20; } else { charge += 10; }",
// "    if( onRight( !isEmpty() ) { charge -= 60; } else { charge += 20; }",
// "}",
// "public void yellowStone {",
// "    if( onLeft ( isEmpty() )  { charge += 20; } else { charge -= 60; }",
// "    if( onRight( redStone )   { charge += 30; } else { charge += 10; }",
// "}",
      
      if( charge >= 100 ){
        chargeSuccess = true;
      }
    }
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
      message = ringBand;  
      font = codeFont;
      step++;
    } else if( step == 3 ){
      showMessage = false;
      message = codeClues[ codingLevel ];
      font = codeFont;
      
      resetStones();
      
      step++;
    } else if( step == 4 ) {
      if( chargeSuccess ){
        metalRods.clear();
        visited.clear();
        visited.add( new Visited( spark, null, 350, 450 ) );
        
        showMessage = true;
        message = outro1;
        font = papyrus;
        step++;
      }
    } else if( step == 5 ) {
      visited.clear();
      metalRods.clear();
      showMessage = false;
      message = outro2;
      font = papyrus;
      step++;
    } else if( step == 6 ) {
      message = toBeContinued;
      font = papyrus;
      step++;
    } else if( step == 7 ) {     
      visited.add( new Visited( ring, null, 400, 200 ) );
      step++;
    }
  }
}

int[][] positions =
{
  { 50,  700},
  {375,  700},
  {700,  700},
  {1025, 700}
};

int getPositionX(){
  return positions[visited.size()][0];
}

int getPositionY(){
  return positions[visited.size()][1];
}

Visited blueStoneObj;
Visited redStoneObj;
Visited greenStoneObj;
Visited yellowStoneObj;

Visited createBlueStoneObj(){
  blueStoneObj = new Visited( blueStone, null, getPositionX(), getPositionY() );
  return blueStoneObj;
}
Visited createRedStoneObj(){
  redStoneObj = new Visited( redStone, null, getPositionX(), getPositionY() );
  return redStoneObj;
}
Visited createGreenStoneObj(){
  greenStoneObj = new Visited( greenStone, null, getPositionX(), getPositionY() );
  return greenStoneObj;
}
Visited createYellowStoneObj(){
  yellowStoneObj = new Visited( yellowStone, null, getPositionX(), getPositionY() );
  return yellowStoneObj;
}
void addMetalRods(){
    metalRods.clear();
    metalRods.add( new Visited( metalRod, null, 0, 775 ) );
    metalRods.add( new Visited( metalRod, null, width-85, 775 ) );
    metalRods.add( new Visited( metalRodSmall, null, 330, 775 ) );
    metalRods.add( new Visited( metalRodSmall, null, 660, 775 ) );
    metalRods.add( new Visited( metalRodSmall, null, 990, 775 ) );
}

void resetStones(){
    visited.clear();
    visited.add( createBlueStoneObj() );
    visited.add( createRedStoneObj() );
    visited.add( createYellowStoneObj() );
    visited.add( createGreenStoneObj() );
    addMetalRods();
}