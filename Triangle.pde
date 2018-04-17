class Triangle
{
  Triangle[] points;
  float[] pos;
  float[] tgt;
  color col;
  float rad = 400;
  
  Triangle()
  {
    pos = GetCircumferenceTarget(rad);
    tgt = GetCircumferenceTarget(rad);
    NewColor();
  }
  
  Triangle(Triangle[] t)
  {
    points = t;
    pos = GetCircumferenceTarget(rad);
    tgt = GetCircumferenceTarget(rad);
  }
  
  float[] GetNewPos()
  {
    return new float[]{random(width), random(height)};
  }
  
  float[] GetCircumferenceTarget(float radius)
  {
    float angle = random(1)*PI*2;
    return new float[]{cos(angle)*radius + width/2,sin(angle)*radius + height/2};
  }
  
  void Update(float spd)
  {
    pos[0] = lerp(pos[0],tgt[0],spd);
    pos[1] = lerp(pos[1],tgt[1],spd);
    
    if(points.length > 1)
    {
      float dist = dist(pos[0],pos[1],tgt[0],tgt[1]);
      
      if(dist < 1)
      {
        tgt = GetCircumferenceTarget(rad);
      }
    
      stroke(col);
      fill(col);
   
      triangle(pos[0],pos[1],points[0].pos[0],points[0].pos[1],points[1].pos[0],points[1].pos[1]);
    }
  }
  
  void NewColor()
  {
    col = color(random(128),random(255),random(255),64);
  }
}