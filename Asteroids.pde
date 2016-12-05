class Asteroid extends Floater 
{
  private int mySpin, myRotateDirection;
  private boolean isSolid, isBroken;
  public Asteroid()
  {
    isSolid = true;
    isBroken = false;
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
    corners2 = 4;
    int[] xS2 = {10,-10,-10,10};
    int[] yS2 = {10,10,-10,-10};
    xCorners2 = xS2;
    yCorners2 = yS2;
    myColor2=180;
    myCenterX2 = 360;
    myCenterY2 = 360;
    myDirectionX2 = Math.random()*6-3;
    myDirectionY2 = Math.random()*6-3;
    myRotateDirection2 = 0;
    mySpin2 = (int)(Math.random()*3+2);
    myOpacity2 = 255;
    corners3 = 4;
    int[] xS3 = {10,-10,-10,10};
    int[] yS3 = {10,10,-10,-10};
    xCorners3 = xS2;
    yCorners3 = yS2;
    myColor3=180;
    myCenterX3 = 360;
    myCenterY3 = 360;
    myDirectionX3 = Math.random()*6-3;
    myDirectionY3 = Math.random()*6-3;
    myRotateDirection3 = 0;
    mySpin3 = (int)(Math.random()*3+2);
    myOpacity3 = 255;
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
  public boolean getIsBroken() {return isBroken;}
  public void show2()  //Draws the floater at the current position  
  {             
    fill(myColor2);   
    stroke(myColor2);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners2; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners2[nI]* Math.cos(dRadians)) - (yCorners2[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners2[nI]* Math.sin(dRadians)) + (yCorners2[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);
  } 
  public void show3 ()  //Draws the floater at the current position  
  {             
    fill(myColor3);   
    stroke(myColor3);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners3; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners3[nI]* Math.cos(dRadians)) - (yCorners3[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners3[nI]* Math.sin(dRadians)) + (yCorners3[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);
  } 
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
    if(dist((float)myCenterX, (float)myCenterY,(float) myShip.getX(),(float) myShip.getY()) <=40)   
    {
      myColor = color(30,30,30,0);
      isSolid = false;
    }  
    //wrap around screen    
    if(isBroken == false)
    {
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
    }
  }
  public void move2()
  {
    if (Math.random() > .5)
      myRotateDirection2 = 1;
    else
      myRotateDirection2 = -1;
    rotate(mySpin2);
      //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX2 += myDirectionX2 - myShip.getDirectionX();    
    myCenterY2 += myDirectionY2 - myShip.getDirectionY();   
  }
  public void move3()
  {
    if (Math.random() > .5)
      myRotateDirection3 = 1;
    else
      myRotateDirection3 = -1;
    rotate(mySpin3);
      //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX3 += myDirectionX3 - myShip.getDirectionX();    
    myCenterY3 += myDirectionY3 - myShip.getDirectionY();  
  }
  public void shuffle()
  {
    myCenterX = Math.random()*1080 - 180;
    myCenterY = Math.random()*1080 - 180;
  }
}
