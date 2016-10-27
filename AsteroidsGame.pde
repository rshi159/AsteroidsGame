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
  myShip.show2();
  myShip.move();
  if(wIsPressed == true && dIsPressed == true)
  {
    myShip.accelerate(.2);
    myShip.rotate(8);
  }
  else if(wIsPressed == true && aIsPressed == true)
  {
    myShip.accelerate(.2);
    myShip.rotate(-8);
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
    myShip.rotate(-8);
  }
  else if(dIsPressed == true)
  {
    myShip.rotate(8);
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
  protected int corners2;  //the number of corners, a triangular floater has 3   
  protected int myColor2;
  protected int[] xCorners2;   
  protected int[] yCorners2;  
  public SpaceShip()
    {  
      myColor=255;
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
      myColor = 255;
      myColor2 = 255;
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