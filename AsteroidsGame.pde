SpaceShip myShip;//your variable declarations here
Asteroid myAsteroid;
NormalParticle[] particle;
Asteroid[] cluster;
private boolean wIsPressed = false;
private boolean dIsPressed = false;
private boolean aIsPressed = false;
private boolean sIsPressed = false;
public void setup() 
{//your code here
  size(720,720);
  myShip = new SpaceShip();
  myAsteroid = new Asteroid();
  particle = new NormalParticle[30];
    for(int i = 0; i < 30; i++)
    {
      particle[i]= new NormalParticle();
    }
  cluster = new Asteroid[8];
    for(int j = 0; j <8; j++)
    {
      cluster[j] = new Asteroid();
    }
}
public void draw() 
{
  background(30);
    for(int i = 0; i < 30; i++)
  {
      particle[i].show();//your code here
  }
    for(int j = 0; j <8; j++)
    {
      cluster[j].move();
      cluster[j].show();
    }
  myShip.show();//your code here
  myShip.show2();
  myShip.move();
  System.out.println(myShip.getCoordX());
  System.out.println(myShip.getCoordY());
  if(wIsPressed == true && dIsPressed == true)
  {
    myShip.accelerate(.02);
    myShip.rotate(8);
  }
  else if(wIsPressed == true && aIsPressed == true)
  {
    myShip.accelerate(.02);
    myShip.rotate(-8);
  }
  else if(sIsPressed == true && dIsPressed == true)
  {
    myShip.accelerate(-.02);
    myShip.rotate(10);
  }
  else if(sIsPressed == true && aIsPressed == true)
  {
    myShip.accelerate(-.02);
    myShip.rotate(-10);
  }
  else if (wIsPressed ==true)
  {
    myShip.accelerate(.02);
  }
  else if(sIsPressed == true)
  {
    myShip.accelerate(-.02);
  }
  else if(aIsPressed == true)
  {
    myShip.rotate(-8);
  }
  else if(dIsPressed == true)
  {
    myShip.rotate(8);
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
  protected double coordX, coordY;
  protected int[] xCorners2;   
  protected int[] yCorners2;  
  public SpaceShip()
    {  
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
      myColor2 = color(0,255,150,60);
      myColor=color(148,191,188);
      myCenterX = 360;
      myCenterY = 360;
      myDirectionX = 0;
      myDirectionY = 0;
      myPointDirection = 0;
      coordX = 7500;
      coordY = 5000;
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
    if (myDirectionX > 10)
      myDirectionX = 10;
    if (myDirectionX < -10)
      myDirectionX = -10;
    if (myDirectionY > 10)
      myDirectionY = 10;
    if (myDirectionY < -10)
      myDirectionY = -10;
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
    ellipse((float)myX + ((float)(360 -myShip.getDirectionX())), (float)(myY + (360 -myShip.getDirectionY())), (float)mySize, (float)mySize);
  }
}

class Asteroid extends Floater 
{
  private int mySpin, myRotateDirection;
  public Asteroid()
  {
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
  public void move()
  {
    if (Math.random() > .5)
      myRotateDirection = 1;
    else
      myRotateDirection = -1;
    rotate(mySpin);
      //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >900)
    {     
      myCenterX = -180;
      myDirectionX = Math.random()*2+1;
      myDirectionY = Math.random()*6-3;
      mySpin = (int)(Math.random()*3+2)*myRotateDirection;    
    }    
    else if (myCenterX < -180)
    {     
      myCenterX = 900;  
      myDirectionX = Math.random()*-2-1;
      myDirectionY = Math.random()*6-3; 
      mySpin = (int)(Math.random()*3+2)*myRotateDirection;   
    }    
    if(myCenterY >900)
    {    
      myCenterY = 0;  
      myDirectionX = Math.random()*6-3;
      myDirectionY = Math.random()*2+1;  
      mySpin = (int)(Math.random()*3+2)*myRotateDirection;  
    }   
    else if (myCenterY < -180)
    {     
      myCenterY = 900; 
      myDirectionX = Math.random()*6-3;
      myDirectionY = Math.random()*-2-1; 
      mySpin = (int)(Math.random()*3+2)*myRotateDirection;    
    }   

  }
}