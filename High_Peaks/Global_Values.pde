int gameState;//determines game state 0 for menu, 1 for pause ,2 for active game,3 for game over
PGen x;
Player p;
int score=0;//Score
int G=5;//gravity force
int jumpCLDWN=0;//jumping cooldown
float maxJump=150; //Maximum height
float jumpMic; //Mic value
boolean jumpFlag=false;//flag for jumping
PImage background;
PImage logo;
String bckgrnd="data/background";
String Logo="data/HighPeaks";
String extension=".PNG";

Serial port;
