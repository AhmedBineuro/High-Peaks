void keyPressed()
{
  if(key=='p')
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
  else if(key=='r')
  {
    gameState=0;
    x.reset();
    score=0;
  }
  if(key==' ')
  {
    if(p.chargeJump==false)
      p.CJswitch();
     p.jump();
  }
  if(key=='w')
  {
    p.jump();
  }
}
void keyReleased()
{
  if(key==' ')
  {
    p.CJswitch();
    p.jumpY=0;
  }
}
