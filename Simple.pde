Triangle[] triangle;
int count = 10;
float pointSpeed = 0.05;

void setup()
{
  background(0);
  size(800,800);
  frameRate(1000);
  
  triangle = new Triangle[count];
  for(int c = 0; c < count; ++c)
  {
    triangle[c] = new Triangle();
  }
  for(int t = 0; t < count; ++t)
  {
    int nextOne = t + 1;
    int nextAft = t + 2;
    
    if(t + 2 == count)
    {
      nextAft = 0;
    }
    else if(t + 2 > count)
    {
      nextAft = 1;
      nextOne = 0;
    }
    triangle[t].points = new Triangle[]{triangle[nextOne],triangle[nextAft]};
  }
}

void draw()
{
  background(0);
  stroke(255);
  fill(255);
  text(frameRate,0,16);
  
  for(int a = 0; a < count; ++a)
  {
    triangle[a].Update(pointSpeed);
  }
}

void mousePressed()
{
  for(int a = 0; a < count; ++a)
  {
    triangle[a].NewColor();
  }
}