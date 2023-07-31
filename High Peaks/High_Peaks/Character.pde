class Player
{
  PVector pos;
  boolean chargeJump ,onPlatform,falling;
  int size=40;
  int currentsprite=0;
  int jumpValue, maxJV,jumpY;
  PImage[] sprite;
  String Gsprite= "data/G";
  //Constructor
  Player()
  {
    pos= new PVector(x.platforms.get(0).pos.x,x.platforms.get(0).pos.y-20-size/2);
    jumpValue=0;
    jumpY=0;
    sprite= new PImage[4];
    String temp;
    for(int i=0;i<4;i++)
    {
      temp=Gsprite+i+extension;
      sprite[i]=loadImage(temp);
    }
  }
  //Resets player
  void reset()
  {
    pos= new PVector(x.platforms.get(0).pos.x,x.platforms.get(0).pos.y-20-size/2);
    jumpValue=0;
  }
  //Draw function
  void drawPlayer()
   {
    pushStyle();
    imageMode(CENTER);
    if(currentsprite<4 && frameCount%60==0)
      currentsprite++;
    else
      currentsprite=0;
    sprite[currentsprite].resize(40,40);
    image(sprite[currentsprite],pos.x,pos.y);
    popStyle();
  }
  
  //Handles all updates for character
  void update()
  {
    onP();
    borderHandling();
    if(jumpCLDWN>0)
      jumpCLDWN--;
     println(jumpCLDWN);
    jump();
    //Jforce();
    //drawPower();
    drawPlayer();
  }
  
  //Changes state of charge jump boolean value
  void CJswitch()
  {
    chargeJump=!chargeJump;
  }
  //Function for falling
  void fall()
  {
    if(onPlatform==false&&(gameState!=1&&gameState!=0))
    {
      falling=true;
      jumpCLDWN=5;
      pos.y+=G;
    }
  }
  //detects if player is on platform
  void onP()
  {
    for(int i=0;i<x.platforms.size();i++)
    {
      if(x.platforms.get(i).collision())
      {
        onPlatform=true;
        falling=false;
        jumpY=0;
        return;
      }
      onPlatform=false;

    }
    
  }
  //Handles jumping
  void jump()
  {
    if(jumpY<maxJump &&falling==false&&jumpFlag==true)
    {
      pos.y-=5;
      jumpY+=5;
    }
    else
    {
      fall();
      jumpFlag=false;
    }
  }
  void borderHandling()
  {
    if(pos.y>=height)
    {
      gameState=2;
    }
  }
  
}
