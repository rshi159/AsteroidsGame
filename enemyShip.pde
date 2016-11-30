class enemyShip extends SpaceShip
{
  //the number of corners, a triangular floater has 3   
  protected int myColorStroke;
  protected double coordX, coordY, dRadians;
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
  	coordX = myShip.getCoordX() + (myCenterX - myShip.getX());
  	coordY = myShip.getCoordY() + (myCenterY - myShip.getY());
    //change the x and y coordinates by myDirectionX and myDirectionY       
    if (Math.abs(dist((float)coordX, (float)coordY, (float)myShip.getCoordX(),(float)myShip.getCoordY())) > 75)
    {
    	myPointDirection = atan2((float)((coordX - myShip.getCoordX())),(float)(coordY - myShip.getCoordY()));
    	if (coordX < myShip.getCoordX() && coordY > myShip.getCoordY())
    	{
    		dRadians = PI + myPointDirection; 
    	}
    	else if (coordX < myShip.getCoordX() || coordY > myShip.getCoordY())
    	{
    		dRadians = PI + myPointDirection; 
    	}
    	else if (coordX > myShip.getCoordX() || coordY < myShip.getCoordY())
    	{
    		dRadians = PI + myPointDirection; 
    	}
    	else
    	{
    		dRadians = myPointDirection;     
    	}
    //change coordinates of direction of travel    
    	myDirectionX += ((.2) * Math.cos(dRadians));    
    	myDirectionY += ((.2) * Math.sin(dRadians));
    	myCenterX += myDirectionX;
    	myCenterY += myDirectionY;
	}
	else if (Math.abs(dist((float)coordX, (float)coordY, (float)myShip.getCoordX(),(float)myShip.getCoordY())) <= 75)
	{
    	myPointDirection = atan2((float)((coordX - myShip.getCoordX())),(float)(coordY - myShip.getCoordY()));
    	dRadians = myPointDirection;     
    //change coordinates of direction of travel    
    	myDirectionX += ((-.3) * Math.cos(dRadians));    
    	myDirectionY += ((-.3) * Math.sin(dRadians));
    	myCenterX += myDirectionX;
    	myCenterY += myDirectionY;
    }
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
}


