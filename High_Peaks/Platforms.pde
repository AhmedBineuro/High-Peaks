class Platform
{
  PVector pos;
  int wid ,speed;
  //Constructor
  Platform(PVector p,int w, int s)
  {
   pos=p;
   wid=w;
   speed=s;
  }
  
  //Function to draw the platform
  void drawP()
  {
    pushMatrix();
    pushStyle();
    rectMode(CENTER);
    translate(pos.x,pos.y);
    fill(155,155,155);
    rect(0,0,wid,40);
    popMatrix();
    popStyle();
  }
  
  //Function to handle moving the platform
  void move()
  {
   pos.x-=speed;
  }
  //Move funciton with parameter
  void move(int sp)
  {
   pos.x-=sp;
  }
  //Handles removing the platform after it goes out of the screen
  boolean borderHandler()
  {
   if(pos.x+wid/2<=0)
   {
   return true;
   }
   return false;
  }
  
  //Handles platform updates
  void update()
  {
   move();
  }
  //Update function with parameter
  void update(int sp)
  {
   move(sp);
  }
  //gets X value of the end of the platform
  int rightEdgeV()
  {
    return (int)(pos.x+(wid/2));
  }
  //Handles collision with platforms
  boolean collision()
  {
    if(p.pos.y>=pos.y-10-p.size&&p.pos.y<=pos.y-p.size/2)
      {
        if(p.pos.x>=pos.x-wid/2&&p.pos.x<=pos.x+wid/2)
          return true;
      }
      return false;
  }
}
