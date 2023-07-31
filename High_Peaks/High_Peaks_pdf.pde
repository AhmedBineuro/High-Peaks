import processing.serial.*;
void setup()
{
  size(1000,1000);
  x=new PGen(4,10,100);
  x.makeGame();
  p=new Player();
  background=new PImage();
  logo=new PImage();
  background=loadImage(bckgrnd+".jpg");
  logo=loadImage(Logo+extension);
  gameState=0;
  port = new Serial(this,Serial.list()[1],9600);
}
void draw()
{
  stateDraw(gameState);
    //println(p.jumpY+" Max: "+p.maxJV+'\t'+p.onPlatform+'\t'+p.chargeJump);
}
//Function to draw pause screen
void drawPause()
{
  pushStyle();
  pushMatrix();
  rectMode(CORNERS);
  fill(0,0,0,140);
  rect(0,0,width,height);
  fill(255);
  textMode(CENTER);
  stroke(255);
  textSize(50);
  textAlign(CENTER);
  text("Paused",width/2,height/2);
  popStyle();
  popMatrix();
}
//function to draw Menu screen
void drawMenu()
{
  pushStyle();
  rectMode(CORNERS);
  fill(0,0,0,150);
  rect(0,0,width,height);
  imageMode(CENTER);
  image(logo,width/2,height/2);
  popStyle();
}
//draws game over
void drawGO()
{
  pushStyle();
  pushMatrix();
  rectMode(CORNERS);
  fill(0,0,0,150);
  rect(0,0,width,height);
  fill(255);
  textMode(CENTER);
  stroke(255);
  textSize(50);
  textAlign(CENTER);
  text("Game Over",width/2,height/2);
  text("Score:"+score,width/2,height/2+100);
  popStyle();
  popMatrix();
}
//Function to draw desired drawing
void stateDraw(int n)
{
  if(n==0)
   {
     x.update();
      drawMenu();
   }
    else if(n==1)
    {
      background(255);
      x.update();
      drawPause();
    }
    else if(n==2)
    {
       x.update();
       drawGO();
    }
    else
    {
      pushStyle();
      imageMode(CENTER);
      image(background,width/2,height/2);
      x.update();
      pushStyle();
      textSize(20);
      fill(255);
      textAlign(CENTER);
      text("Score:"+score,width/2,50);
      popStyle();
      score++;
    }

}

void serialEvent(Serial p)
{
  String inString = p.readStringUntil('\n');
  if(inString!=null)
  {
    inString=trim(inString);
      
      //Pause and Go button
      if(inString.charAt(0)=='G')
      {
         x.switchState();
      if(gameState==1||gameState==0)
        gameState=3;
      else if(gameState==2)
      {
        gameState=0;
        x.reset();
        score=0;
      }
      else
        gameState=1;
      }
    //Reset button
    else if(inString.charAt(0)=='R')
    {
      gameState=0;
      x.reset();
      score=0;
    }
    //Handle audio input
    else
    {
      if(jumpCLDWN==0)
      {
      jumpFlag=true;
      jumpMic= 255-float(inString);
      maxJump=jumpMic;
      println(jumpMic+" "+maxJump+'\t'+jumpFlag);
      }
    }
  }
}
