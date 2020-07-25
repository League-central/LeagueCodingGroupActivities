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
PImage galinor;
PImage market;
PImage snowMarket;
PImage apothacary;
PImage bluePotion;
PImage greenPotion;
PImage yellowPotion;
PImage redPotion;
PImage purplePotion;
PImage deathPotion;
PImage mixedPotion;

PImage bluePotionBig;
PImage greenPotionBig;
PImage yellowPotionBig;
PImage redPotionBig;
PImage purplePotionBig;
PImage deathPotionBig;
PImage mixedPotionBig;
PImage emptyPotion;

class Button {
  String label;
  float x;    // top left corner x position
  float y;    // top left corner y position
  float w;    // width of button
  float h;    // height of button
  
  Button(String labelB, float xpos, float ypos, float widthB, float heightB) {
    label = labelB;
    x = xpos;
    y = ypos;
    w = widthB;
    h = heightB;
  }
  
  void display() {
    push();
    
    if( mouseIsOver() ){
      fill(#FCF000);
    } else {
      fill(218);
    }
    stroke(141);
    rect(x, y, w, h, 10);
    textAlign(CENTER, CENTER);
    fill(0);
    text(label, x + (w / 2), y + (h / 2));
    
    pop();
  }
  
  boolean mouseIsOver() {
    if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
      return true;
    }
    return false;
  }
}

String[] intro =
  { "Nestled in the Grey Mountains at the extreme north of", 
  "Middle-Earth is the town of Galinor. The harsh conditons", 
  "don't make for an easy life, especially for an orphan like", 
  "you. You're not proud that every now and then you have to", 
  "steal to sustain yourself, after all, everyone has to look", 
  "out for themselves, right?", 
};
String[] intro2 =
  {
  "On this day you find yourself roaming the marketplace.", 
  "You notice someone you've never seen before in a strange", 
  "hat and garments making their way towards the apothecary.", 
  "Just then, you see the owner of the apothecary quickly rush",
  "out the back door. In that moment you get a crooked idea on",
  "how to make some quick gold."
};
String[] intro3 =
  {
  "The stranger in the strange hat enters and you greet", 
  "him as if you were the owner. \"Dear Apoth, I am in need of", 
  "Materia Medica\" and lays a piece of parchment down on the", 
  "table. You've never seen this kind of writing before and", 
  "perspiration begins to form on your brow. As you stare at", 
  "the glyphs, somehow they slowly become intelligible...", 
};

String[] outro1 =
  {
  "You hand over the concoction and in return you receive 5", 
  "pieces of gold! Just as both of you are about to bid your", 
  "farewells, the real owner of shop enters and says, with a", 
  "puzzled look, \"who are you?\". A pause. You dash for the", 
  "front entrance into the town square. As you look back to", 
  "see if you are being followed, you hit an object and fall", 
  "to the ground. Looking up from the ground you see the", 
  "Stranger. \"Who are you?...SPEAK!\". Frozen from shock,"
};
String[] outro2 = 
  {
  "you manage to utter the words, \"No one, just a peasant",
  "who's mind is filled with deplorable schemes\". The Stranger",
  "remains silent and takes a long look at you, then proclaims,",
  "\"I am Aniel of League, and I may have a use for you...\"", 
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
  "public Potion makeMateriaMedica() {",
  "    Potion mixedPotion = new Potion();",
  "    mixedPotion.add( \"Honeywater\" );",
  "    mixedPotion.add( \"Liquid Moonseed\" );",
  "    mixedPotion.add( \"Spirit of Vive\" );",
  "    mixedPotion.add( \"Bloodroot Extract\" );",
  "    mixedPotion.add( \"Liquid Moonseed\" );",
  "    mixedPotion.add( \"Bloodroot Extract\" );",
  "    mixedPotion.add( \"Honeywater\" );",
  "    mixedPotion.add( \"Spirit of Vive\" );",
  "",
  "    Potion boiledAcromantulaVenom = boil( \"Acromantula Venom\" );",
  "    mixedPotion.add( boiledAcromantulaVenom );",
  "",
  "    Potion reducedDragonsBlood = reduce( \"Dragon's Blood\" );",
  "    mixedPotion.add( reducedDragonsBlood );",
  "    return mixedPotion;",
  "}",
};
String[] codeClue1 =
  {
  "public class MateriaMedica {",
  "    Potion potion = new Potion();",
  "",
  "    MateriaMedica(Ingredient lqMseed, Ingredient dragonsBlood, Ingredient spiritOfV,",
  "                  Ingredient acroVenom, Ingredient bRootExtract, Ingredient hWater) {", 
  "        prepareBase( lqMseed, bRootExtract, hWater, spiritOfV );",
  "        potion.add( boil( acroVenom ) );",
  "        potion.add( reduce( dragonsBlood ) );",
  "    }",
  "    void prepareBase( Ingredient a, Ingredient b, Ingredient c, Ingredient d ) {",
  "        for (int i = 0; i < 2; i++) {",
  "            if( i > 0 ) {",
  "                potion.add( a ); potion.add( b ); potion.add( c ); potion.add( d );",
  "            } else {",
  "                potion.add( c ); potion.add( a ); potion.add( d ); potion.add( b );",
  "            }",
  "        }",
  "    }",
  "}",
};

String[] codeClue3 =
  {
  "public class MateriaMedica {",
  "    Potion mixedPotion = new Potion();",
  "    HashMap<String, Potion> potions;",
  "    String[] ingredients = { \"Hwater\", \"L. Mseed\", \"S.O. Vive\", \"B.R. Extract\",",
  "                             \"A. Venom\", \"D. Blood\" };", 
  "    public MateriaMedica( HashMap<String, Potion> ApothPotions ) {",
  "        this.potions = ApothPotions;",
  "        prepareBase();",
  "        emulsion( potions.get(ingredients[4]), potions.get(ingredients[5]) );",
  "    }",
  "    void prepareBase() {",
  "        for( int i = 0; i < 4; i++){   mixedPotion.add(potions.get(ingredients[i])) };",
  "        for( int i = 1; i < 4; i+=2 ){ mixedPotion.add(potions.get(ingredients[i])) };",
  "        for( int i = 0; i < 3; i+=2 ){ mixedPotion.add(potions.get(ingredients[i])) };",
  "    }",
  "    void emulsion( Potion ingredient1, Potion ingredient2 ){",
  "        mixedPotion.add( boil(ingredient1) ); mixedPotion.add( reduce(ingredient2) );",
  "    }",
  "}",
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
boolean potionCreated = false;

HashMap<PImage, PImage> potionSizes;
ArrayList<Potion> potions;
Potion red;
Potion purple;
Potion blue;
Potion green;
Potion yellow;
Potion death;

Potion redBig;
Potion purpleBig;
Potion blueBig;
Potion greenBig;
Potion yellowBig;
Potion deathBig;

Potion selectedPotion;
int potionDescriptionColor;
String potionDescription = "";
String mixedPotionString = "";
ArrayList<Potion> mixed;

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
  redX.resize(300, 300);

  map = loadImage( "TheShireMap.jpg" );
  map.resize(width, height);

  ring = loadImage( "ring.png" );
  ring.resize(700, 700);

  star = loadImage( "star.png" );
  star.resize(130, 110);

  galinor = loadImage( "galinor.jpg" );
  galinor.resize(width, height);

  market = loadImage( "market.jpg" );
  market.resize(width, height);
  
  snowMarket = loadImage( "snowMarket.jpg" );
  snowMarket.resize(width,height);

  apothacary = loadImage( "apothacary.jpg" );
  apothacary.resize(width, height);

  bluePotion = loadImage( "bluePotion2.png" );
  bluePotion.resize(50, 75);
  bluePotionBig = loadImage( "bluePotion2.png" );
  bluePotionBig.resize(300, 450);

  redPotion = loadImage( "redPotion.png" );
  redPotion.resize(50, 75);
  redPotionBig = loadImage( "redPotion.png" );
  redPotionBig.resize(300, 450);

  greenPotion = loadImage( "greenPotion.png" );
  greenPotion.resize(40, 60);
  greenPotionBig = loadImage( "greenPotion.png" );
  greenPotionBig.resize(300, 450);

  deathPotion = loadImage( "deathPotion.png" );
  deathPotion.resize(50, 75);
  deathPotionBig = loadImage( "deathPotion.png" );
  deathPotionBig.resize(300, 450);

  purplePotion = loadImage( "purplePotion2.png" );
  purplePotion.resize(50, 75);
  purplePotionBig = loadImage( "purplePotion2.png" );
  purplePotionBig.resize(300, 450);

  yellowPotion = loadImage( "yellowPotion.png" );
  yellowPotion.resize(50, 75);
  yellowPotionBig = loadImage( "yellowPotion.png" );
  yellowPotionBig.resize(300, 450);

  mixedPotion = loadImage( "mixedPotion.png" );
  mixedPotion.resize(600, 900);
  mixedPotionBig = loadImage( "mixedPotion.png" );
  mixedPotionBig.resize(300, 450);
  
  emptyPotion = loadImage( "emptyPotion.png" );
  emptyPotion.resize(300, 450);

  red = new Potion( redPotion, 500, 440 );
  purple = new Potion( purplePotion, 710, 340 );
  blue = new Potion( bluePotion, 420, 125 );
  green = new Potion( greenPotion, 820, 230 );
  yellow = new Potion( yellowPotion, 1000, 255 );
  death = new Potion( deathPotion, 610, 72 );
  
  redBig = new Potion( redPotionBig, 100, 100 );
  purpleBig = new Potion( purplePotionBig, 100, 100 );
  blueBig = new Potion( bluePotionBig, 100, 100 );
  greenBig = new Potion( greenPotionBig, 100, 100 );
  yellowBig = new Potion( yellowPotionBig, 100, 100 );
  deathBig = new Potion( deathPotionBig, 100, 100 );

  potions = new ArrayList<Potion>();
  potions.add( red );
  potions.add( purple );
  potions.add( blue );
  potions.add( green );
  potions.add( yellow );
  potions.add( death );
  potions.add( redBig );
  potions.add( purpleBig );
  potions.add( blueBig );
  potions.add( greenBig );
  potions.add( yellowBig );
  potions.add( deathBig );

  potionSizes = new HashMap<PImage, PImage>();
  potionSizes.put(redPotion, redPotionBig);
  potionSizes.put(purplePotion, purplePotionBig);
  potionSizes.put(bluePotion, bluePotionBig);
  potionSizes.put(greenPotion, greenPotionBig);
  potionSizes.put(yellowPotion, yellowPotionBig);
  potionSizes.put(deathPotion, deathPotionBig);
  
  mixed = new ArrayList<Potion>();
  
  background( galinor );
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

  if ( step < 1 ) {
    background( galinor );
    fill( 0 );
    textFont( papyrusTitle );
    text( "The Thief of Galinor:", 125, 250 );
    text( "Chapter I", 450, 550 );
  } else if ( step == 1 ) {
    background( market );
  } else if ( step >= 2 && step <= 4 ) {
    background( apothacary );
  } else if ( step == 5 ){
    background( snowMarket );
  } else if ( step == 6 ) {
    background( snowMarket );
  } else if ( step >= 7 ) {
    background( snowMarket );
  }

  for ( Visited loc : visited ) {
    if ( loc.p == ring ) {
      filter( BLUR, 6 );
    }
    
    if( loc.p == mixedPotion ){
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

  if( step == 3 ){
    textFont( codeFont );
    textSize( 22 );
    fill( potionDescriptionColor );
    text( potionDescription, 150, 425 );
    textSize(22);
    fill( #FFFFFF );
    text( mixedPotionString, 500,650 );
    
    for( Button b : buttons ){
      b.display();
    }
    
    if( mixed.size() != 0 ){
      fill(mixed.get(mixed.size()-1).potionColor, 150);
      noStroke();
      rect(1070, 960, 170, -(mixed.size() * 20), 20, 20, 60, 60);
    }
  }

  if ( showMessage ) {
    drawMessage( message, font );
  }
  
  if( step == 8 ){
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
  if ( step == 3 ) {
    if ( key == (int)'q' ) {
      resetPotions( true );
      background(apothacary);
    }
  }
}

class Potion implements Cloneable {
  int x;
  int y;
  int width;
  int height;
  PImage image;
  boolean bigPotion;
  boolean isBoiled;
  boolean isReduced;
  String name;
  int potionColor;

  public Potion(PImage image, int x, int y) {
    this.image = image;
    this.x = x;
    this.y = y;
    
    if( image == redPotionBig ||
        image == bluePotionBig ||
        image == greenPotionBig ||
        image == yellowPotionBig ||
        image == purplePotionBig ||
        image == deathPotionBig
      ){
       bigPotion = true;
       width = 300;
       height = 450;
     } else {
       bigPotion = false;
       width = 50;
       height = 75;
     }
     
     if( image == redPotion )      { name = "Bloodroot Extract"; potionColor = #FF0000; }
     if( image == redPotionBig )   { name = "Bloodroot Extract"; potionColor = #FF0000; }
     if( image == bluePotion )     { name = "Liquid Moonseed"; potionColor = #0000FF; }
     if( image == bluePotionBig )  { name = "Liquid Moonseed"; potionColor = #0000FF; }
     if( image == purplePotion )   { name = "Spirit of Vive"; potionColor = #800080; }
     if( image == purplePotionBig ){ name = "Spirit of Vive"; potionColor = #800080; }
     if( image == yellowPotion )   { name = "Honeywater";potionColor = #FFFF00; }
     if( image == yellowPotionBig ){ name = "Honeywater"; potionColor = #FFFF00; }
     if( image == greenPotion )    { name = "Dragon's Blood"; potionColor = #003337; }
     if( image == greenPotionBig ) { name = "Dragon's Blood"; potionColor = #003337; }
     if( image == deathPotion )    { name = "Acromantula Venom"; potionColor = #006400; }
     if( image == deathPotionBig ) { name = "Acromantula Venom"; potionColor = #006400; }
  }
  
  protected Potion clone() {
    Potion clone = null;
    try{
      clone = (Potion)super.clone();
    }catch( CloneNotSupportedException e ){
      println( "ERROR: clone" );
    }
    return clone;
  }
}

Potion getPotionFromImage( PImage image ){
  for( int i = 0; i < potions.size(); i++ ){
    Potion p = potions.get(i);
    
    if( p.image == image ){
      return p;
    }
  }
  return null;
}

Potion findPotion() {
  for ( int i = 0; i < visited.size(); i++ ) {
    Potion p = getPotionFromImage( visited.get(i).p );
    if( p != null ){
      println( "potion " + p.name );
      if ( onPotion( p ) ) {
        print( "\nFound potion\n" );
        return p;
      }
    }
  }
  return null;
}

boolean onPotion(Potion p) {
  if ( mouseX >= p.x && mouseX <= p.x + p.width ) {
    if ( mouseY >= p.y && mouseY <= p.y + p.height ) {
      return true;
    }
  }
  return false;
}

void resetPotions( boolean resetStr ) {
  buttons.clear();
  visited.clear();
  visited.add( new Visited(redPotion, null, red.x, red.y ) );
  visited.add( new Visited(purplePotion, null, purple.x, purple.y ) );
  visited.add( new Visited(bluePotion, null, blue.x, blue.y ) );
  visited.add( new Visited(greenPotion, null, green.x, green.y ) );
  visited.add( new Visited(yellowPotion, null, yellow.x, yellow.y ) );
  visited.add( new Visited(deathPotion, null, death.x, death.y ) );
  visited.add( new Visited(emptyPotion, null, 1000, 550 ) );
  potionDescription = "";

  if( resetStr ){
      mixedPotionString = "";
      mixed.clear();
  }
}

void removePotion( Potion p ) {
  for ( int i = 0; i < visited.size(); i++ ) {
    Visited v = visited.get(i);

    if ( v.p == p.image ) {
      visited.remove( visited.get(i) );
      break;
    }
  }
}

boolean checkPotionMixed(){
  String[] order = { "Honeywater", "Liquid Moonseed", "Spirit of Vive", "Bloodroot Extract",
                     "Liquid Moonseed", "Bloodroot Extract", "Honeywater", "Spirit of Vive",
                     "Acromantula Venom", "Dragon's Blood"
                   };
  println( "mixSz: " + mixed.size() + "; orderSz: " + order.length );
  if( mixed.size() != order.length ){
    return false; 
  }
  
  for( int i = 0; i < mixed.size(); i++ ){
    Potion p = mixed.get( i );
    
    if( !p.name.equals( order[i] ) ){
      return false;
    } else if( i == order.length - 2 && !p.isBoiled ){
      return false;
    } else if( i == order.length - 1 && !p.isReduced ){
      return false; 
    }
  }
  return true;
}

ArrayList<Button> buttons = new ArrayList<Button>();
Button buttonAdd = new Button("add", 120, 550, 90, 40);
Button buttonBoil = new Button("boil", 210, 550, 90, 40);
Button buttonReduce = new Button("reduce", 300, 550, 90, 40);
String potionAction = "";

void mousePressed() {
  if (mouseButton == RIGHT && step == 3) {
    if( selectedPotion != null ){
      if( buttonAdd.mouseIsOver() ){
        potionAction = "Adding "; //<>//
        mixedPotionString += potionAction + selectedPotion.name + " potion!\n";
        mixed.add(selectedPotion.clone());
        
        // Only reset these variables after adding to mixed array List
        selectedPotion.isReduced = false;
        selectedPotion.isBoiled = false;
        potionCreated = checkPotionMixed();
      } else if( buttonReduce.mouseIsOver() ){
        potionAction = "Reducing ";
        mixedPotionString += potionAction + selectedPotion.name + " potion!\n";
        selectedPotion.isReduced = true;
        selectedPotion.isBoiled = false;
      } else if( buttonBoil.mouseIsOver() ){
        potionAction = "Boiling "; //<>//
        mixedPotionString += potionAction + selectedPotion.name + " potion!\n";
        selectedPotion.isReduced = false;
        selectedPotion.isBoiled = true;
      }
    }

    Potion p = findPotion();
      if ( p != null ) {
        if( !p.bigPotion ){
          resetPotions( false );
          removePotion( p );
          potionDescriptionColor = (p.name.equals("Honeywater")) ? 0 : #FFFFFF;
        
          selectedPotion = getPotionFromImage(potionSizes.get( p.image ));
          visited.add( new Visited( potionSizes.get( p.image ), null, 100, 100 ) );
          potionDescription =  "" + selectedPotion.name;
        
          buttons.add( buttonAdd );
          buttons.add( buttonBoil );
          buttons.add( buttonReduce );
        }
      }
    
  } else if (mouseButton == LEFT) {
    if ( step == 0 ) {
      showMessage = false;
      message = intro2;
      font = papyrus;
      step++;
    } else if ( step == 1 ) {
      showMessage = false;
      message = intro3;
      font = papyrus;
      step++;
    } else if ( step == 2 ) {
      resetPotions( true );

      showMessage = false;
      message = codeClues[ codingLevel ];
      font = codeFont;
      step++;
    } else if ( step == 3 ){
      if( potionCreated ) {  
        visited.clear();
        resetPotions( true );
        visited.add( new Visited( mixedPotion, null, 550, 50 ) );
        visited.add( new Visited( null, "You created\nMateria Medica!", 250, 400 ) );

        showMessage = false;
        message = outro1;
        font = papyrus;
        step++;
      } else {
        visited.add( new Visited( redX, null, 550, 700 ) );
      }
    } else if ( step == 4 ) {
      visited.clear();
      showMessage = true;
      message = outro1;
      font = papyrus;
      step++;
    } else if ( step == 5 ) {
      visited.clear();
      showMessage = true;
      message = outro2;
      font = papyrus;
      step++;
    } else if ( step == 6 ) {
      message = toBeContinued;
      font = papyrus;
      step++;
    } else if ( step == 7 ) {     
      visited.add( new Visited( ring, null, 400, 200 ) );
      step++;
    }
  }
}
