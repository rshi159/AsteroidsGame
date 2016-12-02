class enemyShip extends SpaceShip
{
  //the number of corners, a triangular floater has 3   
  protected int myColorStroke;
  protected double coordX, coordY, dRadians, dAmount;
  protected int nBullets;
  public enemyShip()
    {  
      nBullets = 0;
      myCenterX = 360;
      myCenterY = 360;
      myDirectionX = 0;
      myDirectionY = 0;
      myPointDirection = 0;
      coordX = 7500 + myCenterX;
      coordY = 5000 + myCenterY;
      corners = 3;
      int[] xS = {-5,5,-5};
      int[] yS = {5,0,-5};
      xCorners = xS;
      yCorners = yS;
      myColor  = color(208,64,30);
      dRadians = 0;
      dAmount = .00000002;
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
  	if ((coordY-myShip.getCoordY())/(myShip.getCoordX()-coordX) > 0)
  	{
  		if ((coordY-myShip.getCoordY()) >0)
  		{
  			myPointDirection = Math.atan2((coordY-myShip.getCoordY()),(myShip.getCoordX()-coordX));
  		}
  		else if((coordY-myShip.getCoordY()) < 0)
  		{
			myPointDirection = PI + Math.atan2((coordY-myShip.getCoordY()),(myShip.getCoordX()-coordX));
  		}
  	}
  	else if ((coordY-myShip.getCoordY())/(myShip.getCoordX()-coordX) < 0)
  	{
  		if ((coordY-myShip.getCoordY()) >0)
  		{
  			myPointDirection = PI + Math.atan2((coordY-myShip.getCoordY()),(myShip.getCoordX()-coordX));
  		}
  		else if((coordY-myShip.getCoordY()) < 0)
  		{
			myPointDirection = Math.atan2((coordY-myShip.getCoordY()),(myShip.getCoordX()-coordX));
  		}
  	}    
  	myPointDirection = Math.atan2((coordY-myShip.getCoordY()),(myShip.getCoordX()-coordX));
	dRadians = myPointDirection*(Math.PI/180);
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians)); 
    coordX += myDirectionX;
    coordY += myDirectionY;
    myCenterX = coordX - myShip.getX();
    myCenterY = coordY - myShip.getY();
  }
}


