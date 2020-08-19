// Set these parameters to make the challenge easier/harder
float maxTimeSec = 2 * 60.0;  // Make time to answer questions
float alatarAnswerRate = 4;   // Answer per second
float erhdadAnswerRate = 9;   // Answer per second

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
PImage shireIRL;
PImage hobbitHole;
PImage galinor;
PImage market;
PImage snowMarket;
PImage twoPaths;
PImage handCursor;
PImage cell;
PImage anielTravel;
PImage council;
PImage label;
PImage label2;
PImage label3;

String[] intro =
  {
  "RECAP:",
  "you are an orphan and thief in the northern city of",
  "Galinor. You grew up living day-to-day doing odd jobs and",
  "occasionally parting those of opulent presentation with",
  "their coin. One day you were caught trying to scam a",
  "stranger in an apothacary..."
};
String[] intro2 =
  {
  "You were caught by the stranger and he identified himself",
  "as Aniel from League and gave you the choice to join him",
  "on his quest or to stay in Galinor and deal with the",
  "authorities, who, by the way, are slowly closing in.",
  "",
  "                                 Which do you choose?"
};
String[] joinAniel =
{
  "Staring at the oncoming soldiers, you hesistate, but",
  "tell Aniel that you'll join him on his quest.",
  "As the soldiers arrive, the Apoth points and yells,",
  "\"that's who stole from my apothacary!\" Aniel defends",
  "you and clears things up with the Apoth and the soldiers,",
  "paying the Apoth double for the ingredients used to make",
  "the Materia Medica."
};

String[] joinAniel2 =
{
  "After the crowd leaves, Aniel asks where you learned Avaj.",
  "\"I don't know...it just makes sense to me\".",
  "\"You are lucky that I am in need of someone as crafty",
  "and gifted as you. Come, let us leave this place.\"",
  "After a 4-days ride you arrive at the city of League. It",
  "is here for the next 6 months you hone your Avaj skills,",
  "learning from the great wizards Gandalf, Radagast, and of",
  "course, Aniel."
};

String person1 = "Ehrdad";
String person2 = "Alatar";

String[] joinAniel3 =
{
  "This day you prepare to take the Istari, the test of Avaj",
  "skills. You are joined by two others, your friend " + person1 + " ",
  "and the mysterious " + person2 + "--the top student at League.",
  "The test will be proctored by the greatest wizard of Middle-",
  "Earth, Saruman the White.",
  "The goal is to answer 10 Avaj questions before time expires",
  "in " + maxTimeSec + " seconds. Fail the test, and you are banished from",
  "League forever!"
};

String[] stayInGalinor =
  {
  "You're unsure who this strange character is and you can't",
  "bring yourself to accept his offer. The Apoth and soldiers",
  "arrive and you're arrested for impersonation and stealing.",
  "As you sit in your jail cell counting the passing days, you",
  "can't help but wonder what would have happened if you had",
  "accepted Aniel's proposal and how very different your life",
  "could have been."
};

String[] theEnd =
{
  "",
  "",
  "",
  "                                             The End"
};

String[] outro1_YouLose =
{
  "You unfortunately ran out of time and failed the Istari.",
  "Both Ehrdad and Alatar passed and celebrate. Ehrdad tries",
  "to console you, but it doesn't work.",
  "~~~",
  "~~",
  "~",
  "The next day, Aniel takes you to the front gates of League",
  "and you bid each other a fond farewell.",
};

String[] outro1_AlatarWin =
{
  "You and Ehrdad have completed the Istari and are offically",
  "included into the Wizard's sect of Middle-Earth!",
  "",
  "Later that evening after the graduation ceremony...",
  "",
  "While talking with your friend Ehrdad, you ask what his",
  "plans are for the future." 
};

String[] outro1_YouWin =
{
  "You passed the Istari in record speed, even faster than",
  "Alatar! Alatar mumbles then walks away while Ehrdad runs",
  "up and congratulates you!",
  "",
  "Later that evening after the graduation ceremony...",
  "",
  "While talking with your friend Ehrdad, you ask what his",
  "plans are for the future." 
};

String[] outro2 = 
{
  "I've spent the last 10 years of my life training for this",
  "moment, and now that I'm here, at this very moment, I'm not",
  "sure that I want to be a Wizard.",
  "Shocked and in disbelief you ask, \"If not a wizard, then what?",
  "What will you do?\"",
  "Ehrdad looks for a moment, then calmly says,",
  "I would really like to roam the lands of Middle-Earth, throwing",
  "caution to the wind, and live as a humble, traveling salesman..."
};
String[] toBeContinued =
  {
  "TO    BE    CONTINUED..."
};

ArrayList<Visited> visited = new ArrayList<Visited>(); 
int step = 0;
String[] message;
PFont font;
boolean showMessage;
boolean addTwoOptions = false;
boolean pathFound = false;
int currentSecond = 0;
boolean testFailed = false;

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
  codeFontMedium = loadFont( "CourierB24.vlw" );
  codeFontLarge = loadFont( "CourierB32.vlw" );
  centFont = loadFont( "Centaur-48.vlw" );
  message = intro;
  font = papyrus;

  showMessage = false;

  hobbitHole = loadImage( "HobbitHole.jpg" );
  hobbitHole.resize( width, height );

  shireIRL = loadImage( "shireIRL.jpg" );
  shireIRL.resize(width, height);

  scroll = loadImage( "scroll.png" );
  scroll.resize(1250, 500 );

  redX = loadImage( "redX.png" );
  redX.resize(300, 300);

  ring = loadImage( "ring.png" );
  ring.resize(700, 700);

  star = loadImage( "star.png" );
  star.resize(130, 110);

  galinor = loadImage( "mountainTown.jpg" );
  galinor.resize(width, height);

  market = loadImage( "market.jpg" );
  market.resize(width, height);
  
  snowMarket = loadImage( "snowMarket.jpg" );
  snowMarket.resize(width,height);
  
  twoPaths = loadImage( "twoPaths.jpg" );
  twoPaths.resize( width, height );
  
  handCursor = loadImage( "handCursor.png" );
  handCursor.resize(75,75);

  cell = loadImage( "cell.jpg" );
  cell.resize( width, height );
  
  anielTravel = loadImage( "Aniel.jpg" );
  anielTravel.resize( width, height );
  
  council = loadImage( "council.jpg" );
  council.resize( width, height );
  
  label = loadImage( "label.png" );
  label2 = loadImage( "label2.png" );
  label3 = loadImage( "label3.png" );
  
  background( galinor );
}

String elvenScabbard =
 "public class ElvenScabbard {\n" +
 "    float sharpness;\n" +
 "    public ElvenScabbard( float sharpness ){\n" +
 "        this.sharpness = sharpness;\n" +
 "    }\n" +
 "}";
 
String WizardStaff =
 "public class Staff {\n" +
 "    String owner;\n" +
 "    public Staff( String owner ){\n" +
 "        this.owner = owner;\n" +
 "    }\n" +
 "}";
 
String Aragorn =
 "public class Ranger {\n" +
 "    void fight(){}\n" +
 "}\n" +
 "Ranger Aragorn = new Ranger();";
 
String Legolas =
 "public class Elf {\n" +
 "    void shootBow(){}\n" +
 "}\n" +
 "Elf Legolas = new Elf();";

String Gimli =
 "public class Dwarf {\n" +
 "    void swingAxe(){}\n" +
 "}\n" +
 "Dwarf Gimli = new Dwarf();";

String Sam =
 "public class Hobbit {\n" +
 "    void helpFrodo(){}\n" +
 "}\n" +
 "Hobbit Sam = new Hobbit();";

String Gollum =
 "public class Hobbit {\n" +
 "    void stealRing(){}\n" +
 "}\n" +
 "Hobbit Gollum = new Hobbit();";
 
String Sauron =
 "public class DarkLord {\n" +
 "    void forgeRing(){}\n" +
 "}\n" +
 "DarkLord Sauron = new DarkLord();";

String returnValQ1 =
 "_____ weapon = createDwarfWeapon();\n" +
 "\n" +
 "public Axe createDwarfWeapon() {\n" +
 "    // create weapon\n" +
 "}";
 
String returnValQ2 =
 "_____ chiefOrc = new Orc(\"Uglúk\");\n" +
 "\n" +
 "public class Orc {\n" +
 "    // create orc\n" +
 "}";

String ifStatements1 =
 "if( true && false ){\n" +
 "    health = 950;\n" +
 "} else {\n" +
 "    health = 500\n" +
 "}\n" +
 "health = health - 50;";

String ifStatements2 =
 "if( true || false ){\n" +
 "    health = 950;\n" +
 "} else {\n" +
 "    health = 500\n" +
 "}\n" +
 "health = health - 50;";

String[][] javaQuestions =
{
  { "Make Aragorn fight!\n" + Aragorn, "2", "fight()", "fight(Aragorn);", "Aragorn.fight();" },
  { "Make a new ElvenScabbard given the following:\n\n" + elvenScabbard, "0", "new ElvenScabbard(10.0)", "new ElvenScabbard(false)", "new ElvenScabbard(\"10.0\")" },
  { "Forge a ring of power!\n" + Sauron, "0", "Sauron.forgeRing();", "Sauron.forgeRing;", "forgeRing();" },
  { "What code should be placed in the ______?\n" + returnValQ1, "2", "Bow", "Sword", "Axe" },
  { "What is the value of health after the code runs?\n" + "int health;\n" + ifStatements1, "1", "900", "450", "500" },
  { "Make Gollum steal the ring!\n"+ Gollum, "1", "stealRing();", "Gollum.stealRing();", "Gollum.stealRing;" },
  { "What code should be placed in the ______?\n" + returnValQ2, "1", "String", "Orc", "class" },
  { "Make Gimli swing his Axe!\n" + Gimli, "0", "Gimli.swingAxe();", "swingAxe(Gimli)", "swingAxe();" },
  { "What does this method need to return?\nint callEnts(String message){ }", "2", "callEnts", "String", "int" },
  { "Make Legolas shoot his bow!\n" + Legolas, "1", "shootBow();", "Legolas.shootBow();", "shootBow(Legolas);" },
  { "What is returned by calvary[1] for:\nint[] calvary = { 25, 207, 96 };", "1", "25", "207", "96" },
//  { "What is returned by calvary.charAt(2) for:\nString calvary = \"Minas Morgul\";", "0", "n", "i", "a" },
  { "Make Sam help Frodo!\n" + Sam, "2", "helpFrodo();", "Sam.helpFrodo;", "Sam.helpFrodo();" },
  { "What is the value of k?\nint k = 10;\nk++;\nk -= 5;\nk /= 2;", "1", "2", "3", "4" },
  { "Make a new Staff given the following:\n\n" + WizardStaff, "0", "new Staff(\"Gandalf\")", "new Staff(Wizard)", "new Staff(100)" },
  { "What is the value of health after the code runs?\n" + "int health;\n" + ifStatements2, "0", "900", "450", "500" },
  { "What is the value of k?\nint k = 10;\nk--;\nk += 5;\nk = 20;", "2", "14", "34", "20" },
  { "What is returned by armies[2] for:\nint[] armies = { 0, 25, 50 };", "2", "0", "25", "50" },
//  { "What is returned by calvary.charAt(6) for:\nString calvary = \"Minas Morgul\";", "2", "r", "o", "M" },
  { "Which is NOT a valid variable type?", "2", "int", "JFrame", "addActionListener" },
  { "What is called when a new object is created?", "2", "variable", "method", "constructor" },
  { "What is the name of the first method that is\nexecuted when a program runs?", "2", "run()", "runner()", "main()" },
};

Question[] qArr;
int currQuestionIndex = 0;

class Question {
  Button[] answers = null;
  String question = null;
  int correctButton = -1;
  final int STARTX = 280;
  final int STARTY = 110;
  
  public Question( String[] info ){
    if( info.length == 5 ){
      this.question = info[0];
      this.correctButton = int(info[1]);
      
      answers = new Button[3];
      
      for( int i = 0; i < answers.length; i++ ){
        int xPos = STARTX + i * 300;
        answers[i] = new Button( info[i+2], xPos, STARTY + 250, 250, 50 );
      }
    } else {
      println( "ERROR: invalid constructor input" );
    }
  }
  
  public void draw(){
    image( scroll, 90, 0 );
    
    fill(0);
    textFont(codeFontLarge);
    text( question, STARTX, STARTY );
    
    for( int i = 0; i < answers.length; i++ ){
      if( answers[i].label.length() > 17 ){
        textFont(codeFont);
      } else {
        textFont(codeFontMedium);
      }
      answers[i].display();    
    }
  }
}

public void setupQuestions(){
  qArr = new Question[ javaQuestions.length ];
  
  for( int i = 0; i < qArr.length; i++ ){
    qArr[i] = new Question( javaQuestions[i] );
  }
}

boolean checkLeftOption() {
  return mouseX >= 100 && mouseX <= 500 && mouseY >= 300 && mouseY <= 400;
}

boolean checkRightOption() {
  return mouseX >= 900 && mouseX <= 1350 && mouseY >= 300 && mouseY <= 400;
}

void drawMessage( String[] message, PFont font ) {
  int messageX = 250;
  int messageY = 275;

  if ( font == codeFont ) {
    messageX = 300;
    messageY = 235;
  }
  
  if( step == 6 ){
    font = papyrus;
    messageY -= ( 150 - 0 );
    image( scroll, 90, 0 );
  } else {
    image( scroll, 90, 150 );
  }

  if( message != null ){
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
    background( galinor );
    fill( 0 );
    textFont( papyrusTitle );
    text( "The Thief of Galinor:", 125, 250 );
    text( "Chapter II", 450, 550 );
  } else if ( step == 1 ) {
    background( snowMarket );
  } else if( step == 2 ) {
    background( twoPaths );
  } else if ( step == 3 ){
      background( snowMarket );
  } else if ( step == 4 ) {
    background( anielTravel );
  } else if ( step == 5 || step == 6 || step == 7 ) {
    background( council );
  } else if ( step == 20 ) {
    background( cell ); 
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
 
  if ( addTwoOptions ) {
    int fillColorLeft = 0;
    int fillColorRight = 0;

    textFont( papyrus );
    textSize(60);

    if ( checkLeftOption() ) {
      fillColorLeft = #0F0FFF;
    }
    fill( fillColorLeft );
    text( "Join Aniel on", 100, 350 );
    text( "his quest", 150, 400 );

    if ( checkRightOption() ) {
      fillColorRight = #FF0F00;
    }
    fill( fillColorRight );
    text( "Decline and stay", 900, 350 );
    text( "in Galinor", 960, 400 );
  }
 
  // Step 5: Display start button
  if( start != null && step == 5 ){
    textFont( papyrus );
    start.display(); 
    fill(0);
    textFont( codeFontMedium );
    text( "Answer 10 questions within\n    " + maxTimeSec + " seconds to pass", width/2 - 180, 440 );
    text( "Maximum of 20 questions", width/2 - 180, 570 );
  }
  
  // Step 6: Display progress bars and questions
  if( step == 6 && progPerson1 != null && progPerson2 != null && progThief != null && timer != null ){
    progPerson1.draw();
    progPerson2.draw();
    progThief.draw();
    
    float timeRemainingSec = maxTimeSec - (timer.counterSec() + (timer.millisecond() / 1000.0));
    if( timeRemainingSec < 0 ) {
      timeRemainingSec = 0;
    }
    
    if( timeRemainingSec == 0 ){
      testFailed = true;
      timer.stop();
    }
    
    if( timeRemainingSec > 0 && (int)timeRemainingSec != currentSecond ){
      currentSecond = (int)timeRemainingSec;
      
      if( (int)timeRemainingSec % erhdadAnswerRate == 0 ) {
        progPerson1.update();
      }
      if( (int)timeRemainingSec % alatarAnswerRate == 0 ) {
        progPerson2.update();
      } 
    }
    
    qArr[ currQuestionIndex ].draw();
    
    textFont( centFont );
    textSize(80);
    //label.resize( 250, 110 );
    label.resize( 290, 130 );
    image( label, 70, progThief.y - 5 );
    fill( progThief.barColor );
    text( "Thief", 100, progThief.y + 80 );
    
    label3.resize( 310, 130 );
    image( label3, 55, progPerson1.y - 10 );
    fill( progPerson1.barColor );
    text( person1, 100, progPerson1.y + 80 );

    //label2.resize( 260, 110 );
    label2.resize( 310, 110 );
    image( label2, 60, progPerson2.y + 5 );
    fill( progPerson2.barColor );
    text( person2, 100, progPerson2.y + 80 );
    
    textSize(100);
    
    fill(#F0DCDC);
    rect(width/2 - 55, height/2 - 30, 280, 100 );
    
    if( timeRemainingSec <= 10 ){
      fill(255,0,0);
    } else {
      fill(0);
    }
    
    String elapsedStr = String.format("%2.2f", timeRemainingSec);
    text( elapsedStr, width/2 - 50, height/2 + 50);
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
  } //<>//
}

ProgressBar progThief = null;
ProgressBar progPerson1 = null;
ProgressBar progPerson2 = null;
StopWatchTimer timer = null;
Button start = null;
boolean startPressed = false;
boolean testPassed = false;
boolean testWin = false;

void mousePressed() {
  if (mouseButton == LEFT) {    
    if ( step == 0 ) {
      showMessage = true;
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
          message = joinAniel;
          font = papyrus;
          step++;
        } else {
          pickedPath = PATHS.RIGHT;
          message = stayInGalinor;
          font = papyrus;
          step = 20;
        }
      }
    } else if ( step == 3 ){
      showMessage = false;
      message = joinAniel2;
      font = papyrus;
      step++;
    } else if ( step == 4 ){
      showMessage = false;
      message = joinAniel3;
      font = papyrus;
      step++;
    } else if ( step == 5 ) {
      showMessage = false;
      message = null;
      
      if( start == null ) {
        start = new Button("START", (width/2) - 250, (height/2) - 100, 500, 200);
        setupQuestions();
      } else if( start.mouseIsOver() && timer == null ){
        progThief =   new ProgressBar(400, 575, 900, 100, #8FDE80);
        progPerson1 = new ProgressBar(400, 700, 900, 100, #0030FF);
        progPerson2 = new ProgressBar(400, 825, 900, 100, 0);
        timer = new StopWatchTimer();
        timer.start();
        step++;
      }
    } else if ( step == 6 ) {
      if( testPassed || testFailed ){
        showMessage = true;
        if( testFailed ){
          message = outro1_YouLose;
          
          font = papyrus;
          step = 20;
        } else {
          if( testWin ){
            message = outro1_YouWin;
          } else {
            message = outro1_AlatarWin;
          }
          
          font = papyrus;
          step++;
        }
      }
    } else if ( step == 7 ) {
      message = outro2;
      font = papyrus;
      step++;
    } else if ( step == 8 ) {     
      message = toBeContinued;
      font = papyrus;      
      step++;
    } else if ( step == 9 ) {
      visited.add( new Visited( ring, null, 400, 200 ) );
      step++;
    } else if ( step == 20 ) {
      showMessage = true;
      message = theEnd;
      font = papyrus;
    }
    
    println( "step = " + step );
  } else if( mouseButton == RIGHT && step == 6 ){
     Question q = qArr[ currQuestionIndex ];
     Button[] buttons = q.answers;
     
     for( int i = 0; i < buttons.length; i++ ){
        if( buttons[ i ].mouseIsOver() ){
          if( i == q.correctButton ){
            progThief.update();
            
            if( progThief.isFull() ){
              testPassed = true;
              
              print( "p1: " + !progPerson1.isFull() );
              print( "p2: " + !progPerson2.isFull() );
              
              if( !progPerson1.isFull() && !progPerson2.isFull() ){
                testWin = true;
              }
            }
          }
          
          currQuestionIndex = ++currQuestionIndex % qArr.length;
        }
     }
  }
}
