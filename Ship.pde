class SpaceShip extends Floater  
{ 
  protected int corners2, corners3, corners4, corners5, health, score;  //the number of corners, a triangular floater has 3   
  protected int myColor2, myColor3, myColor4, myColor5, myColorStroke;
  protected double coordX, coordY;
  protected int[] xCorners2, xCorners3, xCorners4, xCorners5;   
  protected int[] yCorners2, yCorners3, yCorners4, yCorners5;  
  protected int nBullets;
  public SpaceShip()
    {  
      health = 100;
      nBullets = 0;
      myCenterX = 360;
      myCenterY = 360;
      myDirectionX = 0;
      myDirectionY = 0;
      myPointDirection = 0;
      coordX = 7500;
      coordY = 5000;
      corners = 20;
      int[] xS = {20, 10,-12, -14, -16,-18,-22,-23,-24,-26,-26,-24,-23,-22,-18,-16,-14,-12,10,20};
      int[] yS = {-2, -4,-4,-2,-2,-4,-4,-1,-4,-4,4,4,1,4,4,2,2,4,4,2};
      xCorners = xS;
      yCorners = yS;
      corners2 = 24;
      int[] xS2 = {4,12,12,18,10,6,4,0,-12,-18,-24,-10,-10,-24,-18,-12,0,4,6,10,18,12,12,4};
      int[] yS2 = {-4,-8,-14,-24,-22,-24,-14,-4,-16,-16,-8,-4,4,8,16,16,4,14,24,22,24,14,8,4};
      xCorners2 = xS2;
      yCorners2 = yS2;
      corners3 = 5;
      int[] xS3 = {-26,-34,-38,-34,-26};
      int[] yS3 = {-4,-3,0,3,4};
      xCorners3 = xS3;
      yCorners3 = yS3;
      corners4 = 5;
      int[] xS4 = {3,-4,-8,-4,3};
      int[] yS4 = {-18,-17,-16,-15,-14};
      xCorners4 = xS4;
      yCorners4 = yS4;
      myColor5 = color(90,240,60,255);
      myColor4 = color(90,240,60,255);
      myColor3 = color(90,60,240,255);
      myColorStroke = color(206,31,255,50);
      myColor2 = color(0,255,150,60);
      myColor  = color(148,191,188);
      corners5 = 5;
      int[] xS5 = {3,-4,-8,-4,3};
      int[] yS5 = {18,17,16,15,14};
      xCorners5 = xS5;
      yCorners5 = yS5;
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
  public int getCoordX() {return (int)coordX;}
  public int getCoordY() {return (int)coordY;}
  public void setnBullet(int x) {x = (int) nBullets;}
  public int getnBullets() {return (int) nBullets;}
  public int getHealth() {return health;}
  public void setHealth(int x) {health -= x;}
  public int getScore() {return score;}
  public void setScore(int x) {score += x;}
  public void hyperspace()
    {
      myDirectionX = 0;
      myDirectionY = 0;
      myPointDirection = Math.random()*360;
      coordY = Math.random()*10000;
      coordX = Math.random()*15000;
    }
  public void show2 ()  //Draws the floater at the current position  
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
    public void show3 ()  //Draws the flames at the current position  
  {             
    fill(myColor3);   
    stroke(myColorStroke);    
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
    public void show4()  //Draws the flames at the wings current position  
  {             
    fill(myColor4);   
    stroke(myColorStroke);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners4; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners4[nI]* Math.cos(dRadians)) - (yCorners4[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners4[nI]* Math.sin(dRadians)) + (yCorners4[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);
  }  
    public void show5()  //Draws the flames at the wings current position  
  {             
    fill(myColor5);   
    stroke(myColorStroke);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners5; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners5[nI]* Math.cos(dRadians)) - (yCorners5[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners5[nI]* Math.sin(dRadians)) + (yCorners5[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);
  }    
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX = 360; 
    myCenterY = 360;
    coordX += myDirectionX;
    coordY += myDirectionY;
    if(coordX >15000)
    {     
      coordX = 14800;
    }    
    else if (coordX<0)
    {     
      coordX = 20;
    }    
    if(coordY >10000)
    {    
      coordY = 9980;
    }   
    else if (coordY < 0)
    {     
      coordY = 20; 
    }      
  }
    public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));
    /*if (myDirectionX > 10)
      myDirectionX = 10;
    if (myDirectionX < -10)
      myDirectionX = -10;
    if (myDirectionY > 10)
      myDirectionY = 10;
    if (myDirectionY < -10)
      myDirectionY = -10;*/
  }
}