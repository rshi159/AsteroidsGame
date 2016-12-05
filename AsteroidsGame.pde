SpaceShip myShip;//your variable declarations here
NormalParticle[] particle;
ArrayList <Asteroid> myCluster;
ArrayList <Bullets> myStream;
ArrayList <enemyShip> myFleet;
private boolean wIsPressed = false;
private boolean dIsPressed = false;
private boolean aIsPressed = false;
private boolean sIsPressed = false;
public void setup() 
{//your code here
  myShip = new SpaceShip();
  size(720,720);
  myCluster = new ArrayList <Asteroid>();
  particle = new NormalParticle[120];
    for(int i = 0; i < particle.length; i++)
    {
      particle[i]= new NormalParticle();
    }
  myStream = new ArrayList <Bullets>();
    for(int j = 0; j < 8; j++)
    {
      myCluster.add(new Asteroid());
    }
  /*myFleet = new ArrayList <enemyShip>();
    for(int f = 0; f < 2; f++)
    {
      myFleet.add(new enemyShip());
    }*/
}

public void draw() 
{
  //System.out.println(myStream.size());
  /*System.out.println(myFleet.get(0).getX());
  System.out.println(myFleet.get(0).getY());
  //System.out.println(myFleet.get(0).getPointDirection());*/
  background(30);
  //System.out.println(myCluster.size());
  for(int i = 0; i < particle.length; i++)
  {
      particle[i].move();
      particle[i].show();//your code here
  }
  /*for(int f = 0; f < myFleet.size(); f++)
  {
    myFleet.get(f).show(); //home in
    myFleet.get(f).move();
  }*/
  for(int j = 0; j < myCluster.size(); j++)
  {
    myCluster.get(j).move();
    if ((myCluster.get(j)).getisSolid() == true)
      myCluster.get(j).show();
    for(int e = 0; e < (myStream.size()); e++)
    {
      if(dist((float)((myStream.get(e)).getX()), (float)((myStream.get(e)).getY()),(float) ((myCluster.get(j)).getX()),(float) ((myCluster.get(j)).getY())) <=40) 
        {
          (myCluster.get(j)).setisSolid(0);
        }
    }
  }
  if (myCluster.size() < 8)
    myCluster.add(new Asteroid());
  for(int k = 0; k < myStream.size(); k++)
  {
    myStream.get(k).move();
    myStream.get(k).show();
    if((myStream.get(k).getX() > 1080 || (myStream.get(k).getX() < -180)))
    {
      myStream.remove(k);
    }
    else if((myStream.get(k).getY() > 1080 || (myStream.get(k).getY() < -180)))
      myStream.remove(k);
  }
  myShip.show();//your code here
  myShip.show2();
  myShip.move();
  //System.out.println(myShip.getCoordX());
  //System.out.println(myShip.getCoordY());
  text("x-coordinate = " + myShip.getCoordX(),30,30);
  text("y-coordinate = " + myShip.getCoordY(),30,50); 
  if(wIsPressed == true && aIsPressed == true && dIsPressed == true)
  {
    myShip.accelerate(.1);
    myShip.show3();
    myShip.show4();
    myShip.show5();
  }
  else if(wIsPressed == true && dIsPressed == true)
  {
    myShip.accelerate(.05);
    myShip.rotate(8);
    myShip.show3();
    myShip.show4();
  }
  else if(aIsPressed == true && dIsPressed == true)
  {
    myShip.show4();
    myShip.show5();
    myShip.accelerate(.04);
  }
  else if(wIsPressed == true && aIsPressed == true)
  {
    myShip.accelerate(.05);
    myShip.rotate(-8);
    myShip.show3();
    myShip.show5();
  }
  else if(sIsPressed == true && dIsPressed == true)
  {
    myShip.accelerate(-.05);
    myShip.rotate(10);
    myShip.show4();
  }
  else if(sIsPressed == true && aIsPressed == true)
  {
    myShip.accelerate(-.05);
    myShip.rotate(-10);
    myShip.show5();
  }
  else if (wIsPressed ==true)
  {
    myShip.accelerate(.05);
    myShip.show3();
  }
  else if(sIsPressed == true)
  {
    myShip.accelerate(-.05);
  }
  else if(aIsPressed == true)
  {
    myShip.accelerate(.02);
    myShip.rotate(-8);
    myShip.show5();
  }
  else if(dIsPressed == true)
  {
    myShip.accelerate(.02);
    myShip.rotate(8);
    myShip.show4();
  }
}
void mousePressed()
{
  myStream.add(new Bullets());
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
    for(int j = 0; j < myCluster.size(); j++)
    {
      myCluster.get(j).shuffle();
    }
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



