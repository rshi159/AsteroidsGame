class enemyShip extends Floater
{
  //the number of corners, a triangular floater has 3   
  protected int myColorStroke;
  protected double coordX, coordY;
  protected int nBullets;
  public enemyShip()
    {  
      nBullets = 0;
      myCenterX = 500;
      myCenterY = 500;
      myDirectionX = 0;
      myDirectionY = 0;
      myPointDirection = 0;
      coordX = 7500;
      coordY = 5000;
      corners = 3;
      int[] xS = {-5,5,-5};
      int[] yS = {5,0,-5};
      xCorners = xS;
      yCorners = yS;
      myColor  = color(208,64,30);
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
  public void hyperspace()
    {
      myDirectionX = 0;
      myDirectionY = 0;
      myPointDirection = Math.random()*360;
      coordY = Math.random()*10000;
      coordX = Math.random()*15000;
    }
  public void show()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);
   }
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX = 500; 
    myCenterY = 500;
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


