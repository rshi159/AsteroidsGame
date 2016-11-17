class NormalParticle
{
  double myX, myY,mySpeed, mySize;
  int myColorR, myColorG, myColorB;
  NormalParticle()
  {
    mySize = Math.random()*7;
    myX = Math.random()*1080-180;
    myY = Math.random()*1080-180;
    if (myX > 900)
      myX = -180;
    if (myX < -180)
      myX = 900;
    if (myY > 900)
      myY = -180;
    if (myY < -180)
      myY = 900;
    myColorR = (int)(Math.random()*255);
    myColorG = (int)(Math.random()*255);
    myColorB = (int)(Math.random()*255);
  }
  public void show()
  {
    noStroke();
    fill(myColorR,myColorG,myColorB);
    ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
  }
  public void move()
  {
    myX -= myShip.getDirectionX();
    myY -= myShip.getDirectionY();
    if(myX >900)
    {     
      myX = -180;
    }    
    else if (myX < -180)
    {     
      myX = 900;   
    }    
    if(myY > 900)
    {    
      myY = 0;    
    }   
    else if (myY < -180)
    {     
      myY = 900;  
    }   
  }
}