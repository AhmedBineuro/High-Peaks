class PGen
{
  int sp, max,gap,currentSp;
  ArrayList <Platform> platforms=new ArrayList <Platform>();
  boolean gState;
  
  //Constructor
  PGen(int s,int m,int g)
  {
    sp=s;
    currentSp=0;
    max=m;
    gap=g;
  }
  //Creates game
  void makeGame()
  {
     platforms.add(new Platform(new PVector(100,height/2),200,0));
    checkMax();
  }
  //Clears all current platforms
  void clearGame()
  {
    for(int i=platforms.size();i>0;i--)
    {
      platforms.remove(i-1);
    }
  }
  //Resets game
  void reset()
  {
    clearGame();
    if(x.gState!=false)
    switchState();
    makeGame();
    p.reset();
  }
  //spawns new platforms
  void spawnNew()
  {  int w=(int)random(50,150);
     int y;
     do
     {
         //Makes sure platforms stay within the screen
         y=(int)random(platforms.get(platforms.size()-1).pos.y-100,platforms.get(platforms.size()-1).pos.y+100);
     }while(y-20<=height/2-300||y-20>=height/2+300);
    platforms.add(new Platform(new PVector(platforms.get(platforms.size()-1).rightEdgeV()+gap,y),w,sp));
  }
  
  //starts or stops the motion of platforms
  void motionHandle()
  {
    if(gState==true)
    {
      currentSp=sp;
    }
    else
    {
      currentSp=0;
    }
    
  }
  void switchState()
  {
    gState=!gState;
    
  }
  
  //Checks if the current number of platforms fills the max and if not then it will populate it
  void checkMax()
  {
    if(platforms.size()<=max)
    {
      for(;platforms.size()<=max;)
        spawnNew();
    }
  }
  
  //Deletes a platform after it goes offscreen
  void borderHandle()
  {
    for(int i=0;i<platforms.size();i++)
    {
      if(platforms.get(i).rightEdgeV()<=0)
        platforms.remove(i);
    }
  }
  
  //Moves all platforms
  void movePlatforms()
  {
    for(int i=0;i<platforms.size();i++)
    {
      platforms.get(i).update(currentSp);
    }
  }
  //Draws platforms
  void drawP()
  {
    for(int i=0;i<platforms.size();i++)
    platforms.get(i).drawP();
    
  }
  //Update Function
  void update()
  {
    motionHandle(); 
    movePlatforms();
    borderHandle();
    drawP();
    checkMax();
    p.update();
  }
}
