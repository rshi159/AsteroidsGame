SpaceShip myShip;//your variable declarations here
NormalParticle[] particle;
private boolean wIsPressed = false;
private boolean dIsPressed = false;
private boolean aIsPressed = false;
private boolean sIsPressed = false;
public void setup() 
{//your code here
  size(720,720);
  myShip = new SpaceShip();
  particle = new NormalParticle[30];
    for(int i = 0; i < 30; i++)
    {
      particle[i]= new NormalParticle();
    }
}
public void draw() 
{
  background(30);
  myShip.show();//your code here
  myShip.move();
  if(wIsPressed == true && dIsPressed == true)
  {
    myShip.accelerate(.2);
    myShip.rotate(10);
  }
  else if(wIsPressed == true && aIsPressed == true)
  {
    myShip.accelerate(.2);
    myShip.rotate(-10);
  }
  else if(sIsPressed == true && dIsPressed == true)
  {
    myShip.accelerate(-.2);
    myShip.rotate(10);
  }
  else if(sIsPressed == true && aIsPressed == true)
  {
    myShip.accelerate(-.2);
    myShip.rotate(-10);
  }
  else if (wIsPressed ==true)
  {
    myShip.accelerate(.2);
  }
  else if(sIsPressed == true)
  {
    myShip.accelerate(-.2);
  }
  else if(aIsPressed == true)
  {
    myShip.rotate(-10);
  }
  else if(dIsPressed == true)
  {
    myShip.rotate(10);
  }
  for(int i = 0; i < 30; i++)
  {
      particle[i].show();//your code here
  }
}
void keyPressed()
{
  if(key=='w')
  {
    wIsPressed = true;
  }
  else if (key == 'd')
  {
    dIsPressed = true;
  }
  else if (key == 'a')
  {
    aIsPressed = true;
  }
  else if (key == 's')
  {
    sIsPressed = true;
  }
  if (key == 'f')
  {
    myShip.hyperspace();
  }
}
void keyReleased()
{
  if(key=='w')
  {
    wIsPressed = false;
  }
  else if (key == 'd')
  {
    dIsPressed = false;
  }
  else if (key == 'a')
  {
    aIsPressed = false;
  }
  else if (key == 's')
  {
    sIsPressed = false;
  }
}
class SpaceShip extends Floater  
{ 
  public SpaceShip()
    {  
      myColor=255;
      corners = 3;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] = 8;
      xCorners[1] = -5;
      xCorners[2] = -5;
      yCorners[0] = 0;
      yCorners[1] = 3;
      yCorners[2] = -3;
      myColor = 255;
      myCenterX = 360;
      myCenterY = 360;
      myDirectionX = 0;
      myDirectionY = 0;
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
  public void hyperspace()
    {
      myDirectionX = 0;
      myDirectionY = 0;
      myPointDirection = Math.random()*360;
      myCenterX = Math.random()*720;
      myCenterY = Math.random()*720;
    }
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
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
} 
class NormalParticle
{
  double myX, myY,mySpeed, mySize;
  int myColorR, myColorG, myColorB;
  NormalParticle()
  {
    mySize = Math.random()*7;
    myX = Math.random()*720;
    myY = Math.random()*720;
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
}