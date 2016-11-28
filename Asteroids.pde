class Asteroid extends Floater 
{
  private int mySpin, myRotateDirection;
  private boolean isSolid;
  public Asteroid()
  {
    isSolid = true;
    mySpin = (int)(Math.random()*3+2);
    myRotateDirection = 0;
    corners = 4;
    int[] xS = {20,-20,-20,20};
    int[] yS = {20,20,-20,-20};
    xCorners = xS;
    yCorners = yS;
    myColor=180;
    myCenterX = 360;
    myCenterY = 360;
    myDirectionX = Math.random()*6-3;
    myDirectionY = Math.random()*6-3;
    myPointDirection = 0;
  }
  public void setX(int x) {x = (int)myCenterX;}  
  public int getX() {return (int)myCenterX;}   
  public void setY(int y) {y = (int)myCenterY;}
  public int getY() {return (int)myCenterY;}
  public void setDirectionX(double x) {x = myDirectionX;}   
  public double getDirectionX() {return myDirectionX;}
  public void setDirectionY(double y) {y = myDirectionY;}
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection(int degrees) {degrees = (int)myPointDirection;}
  public double getPointDirection() {return myPointDirection;} //your code here
  public void setisSolid(int x)
    {
      if (x==1)
        isSolid = true;
      else if (x==0)
        isSolid = false;
    }
  public boolean getisSolid() {return isSolid;}
  public void move()
  {
    if (Math.random() > .5)
      myRotateDirection = 1;
    else
      myRotateDirection = -1;
    rotate(mySpin);
      //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX - myShip.getDirectionX();    
    myCenterY += myDirectionY - myShip.getDirectionY();     

    //wrap around screen    
    if(myCenterX >900)
    {     
      myCenterX = -180;
      myDirectionX = Math.random()*2+1;
      myDirectionY = Math.random()*6-3;
      mySpin = (int)(Math.random()*3+2)*myRotateDirection;
      myColor = 180;   
      isSolid = true; 
    }    
    else if (myCenterX < -180)
    {     
      myCenterX = 900;  
      myDirectionX = Math.random()*-2-1;
      myDirectionY = Math.random()*6-3; 
      mySpin = (int)(Math.random()*3+2)*myRotateDirection;   
      myColor = 180;  
      isSolid = true;
    }    
    if(myCenterY >900)
    {    
      myCenterY = 0;  
      myDirectionX = Math.random()*6-3;
      myDirectionY = Math.random()*2+1;  
      mySpin = (int)(Math.random()*3+2)*myRotateDirection;  
      myColor = 180;  
      isSolid=true;
    }   
    else if (myCenterY < -180)
    {     
      myCenterY = 900; 
      myDirectionX = Math.random()*6-3;
      myDirectionY = Math.random()*-2-1; 
      mySpin = (int)(Math.random()*3+2)*myRotateDirection;   
      myColor = 180;   
      isSolid = true;
    }
    if(dist((float)myCenterX, (float)myCenterY,(float) myShip.getX(),(float) myShip.getY()) <=40)   
    {
      myColor = color(30,30,30,0);
      isSolid = false;
    }
  }
  public void shuffle()
  {
    myCenterX = Math.random()*1080 - 180;
    myCenterY = Math.random()*1080 - 180;
  }
}
