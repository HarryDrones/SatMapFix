void getStar() {
  
  
  
    // RA = map((float)ra,0.0f, 24.0f,0,TWO_PI); 
        //  RA = map((float)ra,0.0f, 24.0f,texture.width - texture.width, texture.width);
     float     X = map((float)GHA1,0.0f,360.0f,texture.width - texture.width, texture.width);
     
     RA = map((float)GHA1/15, 0.0f,24.0f,texture.width - texture.width, texture.width);
 
// float X = map((RA),0,TWO_PI,texture.width - texture.width,texture.width);

 float   Y = map((float)(-dec1),(-90),(90),texture.height - texture.height,texture.height);
  texture.stroke(0,255,0);
texture.strokeWeight(5);

//.point(X,Y);
texture.point(RA,Y);
//texture.point(X,Y);
Location star = new Location(Y,RA);
ScreenPosition pos = mapDetail.getScreenPosition(star);

noFill();
stroke(255,0,0);
strokeWeight(4);
point(pos.x,pos.y);







  // texture.point(X- texture.width,Y);
  // texture.point(texture.width+X,Y);
  // texture.point(X,Y);
  
  
  
  
}
