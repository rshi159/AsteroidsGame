class Bullets extends Floater
{
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
  public Bullets()
  {
    myCenterX = 360;
    myCenterY = 360;
    myPointDirection = myShip.getPointDirection();
    double dRadians =myPointDirection*(Math.PI/180);
    myDirectionX += 5*Math.cos(dRadians);
    myDirectionY += 5*Math.sin(dRadians);
  }
  public void show()
  {
    fill(255);
    ellipse((float)myCenterX, (float)myCenterY, (float)15, (float)15);
  }
  public void move()
  {
    myCenterX += myDirectionX;
    myCenterY += myDirectionY;
  }
}