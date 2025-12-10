 void  GetMap() {
   
     int w = 0;
        for( double L0 = -180.0f; L0 <= 180.0f; L0 += .1f )
        {
           // Mz = Rz(Math.toRadians(360.0) - (GHA + Math.toRadians(36.082)), Mz);
          /////////////  Mz = Rz(Math.toRadians(360.0f) - (GHA1 ), Mz);
                Mz = Rz((GHA1 ), Mz);   


           ////////// My =  Ry(Math.toRadians(90.0f) - (dec1), My);
                       My =  Ry((dec1), My);
    released = false;
         //   float alt = map(mouseX,width-width,width,0,90);
              vv =  VectorSpherical2Cartesian((alt1),Math.toRadians(L0) );
         //   vv =  VectorSpherical2Cartesian(alt,Math.toRadians(L0) );


            vy =  MatrixVecProd( My, vv, vy );

            vyz =  MatrixVecProd( Mz, vy, vyz );



            wpt[w] = C2ELat( vyz[0], vyz[1], vyz[2]);
            wpt[w+1] = C2ELon( vyz[0], vyz[1], vyz[2]);

            WPT = toFloatArray(wpt);

          //  x[w] = map(WPT[w+1],radians(-180) ,radians(180),width, width - width);
         //   y[w] = map(WPT[w],radians(-90),(radians(90)),height,height - height);
         //   x[w] = WPT[w+1];
         //   y[w] = WPT[w];
  //        lat = (float)wpt[w];
// lon = (float)wpt[w+1];
lat = (float)(Math.toDegrees(WPT[w]));
lon = (float)(Math.toDegrees(WPT[w+1]));
//latA = (float)(Math.toDegrees(WPT[w]));
//lonA = (float)(Math.toDegrees(WPT[w+1]));

//aevents.add(aevent);
Location location = new Location(lat,lon);
Location StarGP = new Location(90 - Math.toDegrees(dec1),Math.toDegrees(GHA1));
//Location locationA = new Location(latA,lonA);
     ScreenPosition pos = mapDetail.getScreenPosition(location);
     ScreenPosition star = mapDetail.getScreenPosition(StarGP);
   //  ScreenPosition posA = mapDetail.getScreenPosition(locationA);

  
   //  beginShape();
 
point(pos.x,pos.y);

   
   //  beginShape();
  
         // strokeWeight(2);
        //    point(x[w],y[w]);
            noFill();
            stroke(255,0, 0);
           strokeWeight(4);
                         noFill();
            stroke(0,255, 0);
           strokeWeight(4);
           point(star.x,star.y);
                       noFill();
            stroke(255,0, 0);
           strokeWeight(4);
        //    beginShape();
         //   curveVertex(x[w],y[w]);
         //   curveVertex(x[w], y[w]);

        //    endShape();
          
        }
w++;


        w = 0;
        for( double L0 = -180.0f; L0 <= 180.0f; L0 += .1f )
        {
          //  Mz = Rz(Math.toRadians(360.0) - (GHA1 + Math.toRadians(36.3334) ), Mz);
            Mz = Rz((GHA2 ), Mz);


          //  My =  Ry((Math.toRadians(90.0f) - (dec2)), My);
                       My =  Ry(( (dec2)), My);
            //   float alt = map(mouseX,width-width,width,0,90);
            vv =  VectorSpherical2Cartesian((alt2),Math.toRadians(L0) );
            //   vv =  VectorSpherical2Cartesian(alt,Math.toRadians(L0) );


            vy =  MatrixVecProd( My, vv, vy );

            vyz =  MatrixVecProd( Mz, vy, vyz );



            wpt[w] = C2ELat( vyz[0], vyz[1], vyz[2]);
            wpt[w+1] = C2ELon( vyz[0], vyz[1], vyz[2]);

            WPT = toFloatArray(wpt);

            x[w] = map(WPT[w+1],radians(-180) ,radians(180),width, width - width);
            y[w] = map(WPT[w],radians(-90),(radians(90)),height,height - height);
           // x[w] = WPT[w+1];
           // y[w] = WPT[w];

           lat2 = (float)(Math.toDegrees(WPT[w]));
lon2 = (float)(Math.toDegrees(WPT[w+1]));

//aevents.add(aevent);
Location location2 = new Location(lat2,lon2);
Location StarGP2 = new Location(90 - Math.toDegrees(dec2),Math.toDegrees(GHA2));
     ScreenPosition pos2 = mapDetail.getScreenPosition(location2);
     ScreenPosition star2 = mapDetail.getScreenPosition(StarGP2);
   //  beginShape();
      point(pos2.x,pos2.y);
    //    ellipse(pos2.x,pos2.y,2,2);    
          //  point(x[w],y[w]);
                      stroke(0,255, 0);
           strokeWeight(4);
           point(star2.x,star2.y);
                       noFill();
            stroke(255,0, 0);
           strokeWeight(4);

        }
        w++;
        
          w = 0;
        for( double L0 = -180.0f; L0 <= 180.0f; L0 += .1f )
        {
          //  Mz = Rz(Math.toRadians(360.0) - (GHA1 + Math.toRadians(36.3334) ), Mz);
            Mz = Rz((GHA3 ), Mz);


          //  My =  Ry((Math.toRadians(90.0f) - (dec2)), My);
                       My =  Ry(( (dec3)), My);
            //   float alt = map(mouseX,width-width,width,0,90);
            vv =  VectorSpherical2Cartesian((alt3),Math.toRadians(L0) );
            //   vv =  VectorSpherical2Cartesian(alt,Math.toRadians(L0) );


            vy =  MatrixVecProd( My, vv, vy );

            vyz =  MatrixVecProd( Mz, vy, vyz );



            wpt[w] = C2ELat( vyz[0], vyz[1], vyz[2]);
            wpt[w+1] = C2ELon( vyz[0], vyz[1], vyz[2]);

            WPT = toFloatArray(wpt);

            x[w] = map(WPT[w+1],radians(-180) ,radians(180),width, width - width);
            y[w] = map(WPT[w],radians(-90),(radians(90)),height,height - height);
           // x[w] = WPT[w+1];
           // y[w] = WPT[w];

           lat3 = (float)(Math.toDegrees(WPT[w]));
lon3 = (float)(Math.toDegrees(WPT[w+1]));

//aevents.add(aevent);
Location location3 = new Location(lat3,lon3);
Location StarGP3 = new Location(90 - Math.toDegrees(dec3),Math.toDegrees(GHA3));
    
     ScreenPosition star3 = mapDetail.getScreenPosition(StarGP3);
     ScreenPosition pos3 = mapDetail.getScreenPosition(location3);
   //  beginShape();
      point(pos3.x,pos3.y);
    //    ellipse(pos2.x,pos2.y,2,2);    
          //  point(x[w],y[w]);
           stroke(0,255, 0);
           strokeWeight(4);
           point(star3.x,star3.y);
                       noFill();
            stroke(255,0, 0);
           strokeWeight(4);

        }
        w++;
  w = 0;  
       
     } 
     
     
