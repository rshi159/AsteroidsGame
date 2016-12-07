class Asteroid extends Floater 
{
  private int mySpin, myRotateDirection,corners2,corners3,myColor2,myColor3,mySpin2,mySpin3,myRotateDirection2,myRotateDirection3;
  private boolean isSolid, isBroken, off2, off3;
  private int[] xCorners2,yCorners2,xCorners3,yCorners3;
  private double myDirectionX2,myDirectionY2,myDirectionX3,myDirectionY3,myPointDirection2,myPointDirection3,myCenterX2,myCenterY2,myCenterX3,myCenterY3;
  public Asteroid()
  {
    off2 = false;
    off3 = false;
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
    myCenterX = 900;
    myCenterY = 960;
    myDirectionX = Math.random()*6-3;
    myDirectionY = Math.random()*6-3;
    corners2 = 4;
    int[] xS2 = {10,-10,-10,10};
    int[] yS2 = {10,10,-10,-10};
    xCorners2 = xS2;
    yCorners2 = yS2;
    myColor2=180;
    myCenterX2 = 900;
    myCenterY2 = 960;
    myDirectionX2 = Math.random()*6-3;
    myDirectionY2 = Math.random()*6-3;
    myRotateDirection2 = 0;
    mySpin2 = (int)(Math.random()*3+2);
    corners3 = 4;
    int[] xS3 = {10,-10,-10,10};
    int[] yS3 = {10,10,-10,-10};
    xCorners3 = xS2;
    yCorners3 = yS2;
    myColor3=180;
    myCenterX3 = 960;
    myCenterY3 = 960;
    myDirectionX3 = Math.random()*6-3;
    myDirectionY3 = Math.random()*6-3;
    myRotateDirection3 = 0;
    mySpin3 = (int)(Math.random()*3+2);
    myPointDirection = 0;
    myPointDirection2 = 0;
    myPointDirection3 = 0;
  }
  public void setX(int x) {x = (int)myCenterX;}  
  public int getX() {return (int)myCenterX;}   
  public void setY(int y) {y = (int)myCenterY;}
  public int getY() {return (int)myCenterY;}
  public int getX2() {return (int)myCenterX2;}  
  public int getY2() {return (int)myCenterY2;} 
  public int getX3() {return (int)myCenterX3;}  
  public int getY3() {return (int)myCenterY3;} 
  public void setDirectionX(double x) {x = myDirectionX;}   
  public double getDirectionX() {return myDirectionX;}
  public void setDirectionY(double y) {y = myDirectionY;}
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection(int degrees) {degrees = (int)myPointDirection;}
  public double getPointDirection() {return myPointDirection;} //your code here
  public boolean getIsSolid() {return isSolid;}
  public boolean getIsBroken() {return isBroken;}
  public boolean getOff2() {return off2;}
  public boolean getOff3() {return off3;}
  public void show2()  //Draws the floater at the current position  
  {             
    fill(myColor2);   
    stroke(myColor2);    
    //convert degrees to radians for sin and cos         
    double dRadians2 = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners2; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners2[nI]* Math.cos(dRadians2)) - (yCorners2[nI] * Math.sin(dRadians2))+myCenterX2);     
      yRotatedTranslated = (int)((xCorners2[nI]* Math.sin(dRadians2)) + (yCorners2[nI] * Math.cos(dRadians2))+myCenterY2);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);
  } 
  public void show3 ()  //Draws the floater at the current position  
  {             
    fill(myColor3);   
    stroke(myColor3);    
    //convert degrees to radians for sin and cos         
    double dRadians3 = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners3; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners3[nI]* Math.cos(dRadians3)) - (yCorners3[nI] * Math.sin(dRadians3))+myCenterX3);     
      yRotatedTranslated = (int)((xCorners3[nI]* Math.sin(dRadians3)) + (yCorners3[nI] * Math.cos(dRadians3))+myCenterY3);      
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
    if((off2 == true && off3 ==true) && isSolid == false)
    {
      off2 = false;
      off3 = false;
      isSolid = true;
    }
    if (Math.random() > .5)
      myRotateDirection = 1;
    else
      myRotateDirection = -1;
    rotate(mySpin);
      //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX - myShip.getDirectionX();    
    myCenterY += myDirectionY - myShip.getDirectionY();  
    if (isSolid == false)
      isBroken = true; 
    else if(isSolid == true)
      isBroken = false;
    if(dist((float)myCenterX, (float)myCenterY,(float) myShip.getX(),(float) myShip.getY()) <=40)   
    {
      myColor = color(30,30,30,0);
      isSolid = false;
      myShip.setHealth(2);
      myShip.setScore(-2);
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
      }    
      else if (myCenterX < -180)
      {     
        myCenterX = 900;  
        myDirectionX = Math.random()*-2-1;
        myDirectionY = Math.random()*6-3; 
        mySpin = (int)(Math.random()*3+2)*myRotateDirection;   
        myColor = 180;  
      }    
      if(myCenterY >900)
      {    
        myCenterY = 0;  
        myDirectionX = Math.random()*6-3;
        myDirectionY = Math.random()*2+1;  
        mySpin = (int)(Math.random()*3+2)*myRotateDirection;  
        myColor = 180;  
      }   
      else if (myCenterY < -180)
      {     
        myCenterY = 900; 
        myDirectionX = Math.random()*6-3;
        myDirectionY = Math.random()*-2-1; 
        mySpin = (int)(Math.random()*3+2)*myRotateDirection;   
        myColor = 180;   
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
    if (isBroken == false)
    {
      myCenterX2 = myCenterX;
      myCenterY2 = myCenterY;
    }   
    if(isBroken == true)  
    {
      myCenterX2 += myDirectionX2 - myShip.getDirectionX();    
      myCenterY2 += myDirectionY2 - myShip.getDirectionY();   
    }
    if(myCenterX2 >900)
      {     
        myCenterX2 = -180;
        myDirectionX2 = Math.random()*2+1;
        myDirectionY2 = Math.random()*6-3;
        mySpin2 = (int)(Math.random()*3+2)*myRotateDirection;
        myColor2 = 180;   
        off2 = true;
      }    
      else if (myCenterX < -180)
      {     
        myCenterX2 = 900;  
        myDirectionX2 = Math.random()*-2-1;
        myDirectionY2 = Math.random()*6-3; 
        mySpin2 = (int)(Math.random()*3+2)*myRotateDirection;   
        myColor2 = 180;  
        off2 = true;
      }    
      if(myCenterY2 >900)
      {    
        myCenterY2 = 0;  
        myDirectionX2 = Math.random()*6-3;
        myDirectionY2 = Math.random()*2+1;  
        mySpin2 = (int)(Math.random()*3+2)*myRotateDirection;  
        myColor2 = 180;  
        off2 = true;
      }   
      else if (myCenterY2 < -180)
      {     
        myCenterY2 = 900; 
        myDirectionX2 = Math.random()*6-3;
        myDirectionY2 = Math.random()*-2-1; 
        mySpin2 = (int)(Math.random()*3+2)*myRotateDirection;   
        myColor2 = 180;   
        off2 = true;
      }
  }
  public void move3()
  {
    if (Math.random() > .5)
      myRotateDirection3 = 1;
    else
      myRotateDirection3 = -1;
    rotate(mySpin3);
      //change the x and y coordinates by myDirectionX and myDirectionY
    if (isBroken == false)
    {
      myCenterX3 = myCenterX;
      myCenterY3 = myCenterY;
    } 
    if(isSolid == false)
    {       
      myCenterX3 += myDirectionX3 - myShip.getDirectionX();    
      myCenterY3 += myDirectionY3 - myShip.getDirectionY();  
    }
    if(myCenterX3 >900)
      {     
        myCenterX3 = -180;
        myDirectionX3 = Math.random()*2+1;
        myDirectionY3 = Math.random()*6-3;
        mySpin3 = (int)(Math.random()*3+2)*myRotateDirection;
        myColor3 = 180;   
        off3 = true;
      }    
      else if (myCenterX3 < -180)
      {     
        myCenterX3 = 900;  
        myDirectionX3 = Math.random()*-2-1;
        myDirectionY3 = Math.random()*6-3; 
        mySpin3 = (int)(Math.random()*3+2)*myRotateDirection;   
        myColor3 = 180;  
        off3 = true;
      }    
      if(myCenterY3 >900)
      {    
        myCenterY3 = 0;  
        myDirectionX3 = Math.random()*6-3;
        myDirectionY3 = Math.random()*2+1;  
        mySpin3 = (int)(Math.random()*3+2)*myRotateDirection;  
        myColor3 = 180;  
        off3 = true;
      }   
      else if (myCenterY3 < -180)
      {     
        myCenterY3 = 900; 
        myDirectionX3 = Math.random()*6-3;
        myDirectionY3 = Math.random()*-2-1; 
        mySpin3 = (int)(Math.random()*3+2)*myRotateDirection;   
        myColor3 = 180; 
        off3 = true;  
      }
  }
  public void shuffle()
  {
    myCenterX = Math.random()*1080 - 180;
    myCenterY = Math.random()*1080 - 180;
  }
}
