
       boolean getPoints(){
         texture.beginDraw();
         getStar();
         texture.endDraw();
        texture.beginDraw();
        texture.stroke(255,0,0);
        texture.strokeWeight(2);
        int w = 0;
        //texture.strokeWeight(2);
        //texture.stroke(0,255,0);
        //texture.point((float)GHA1,(float)dec1);

        for( double L0 = -180.0; L0 <= 180.0; L0 += .1 )
        {
           // Mz = Rz(Math.toRadians(360.0) - (GHA + Math.toRadians(36.082)), Mz);
            //Mz = Rz(Math.toRadians(360.0) - (GHA ), Mz);
           // Mz = Rz(Math.toRadians(360.0 - GHA),Mz);
             Mz = Rz(Math.toRadians(360.0) - (GHA1 ), Mz);
            // Mz = Rz((GHA1) , Mz);


           // My =  Ry(Math.toRadians(90.0 - dec), My);
            My =  Ry(Math.toRadians(90.0) - (-dec1), My);
           // My = Ry(-dec1,My);
    released = false;
         //   float alt = map(mouseX,width-width,width,0,90);
            //  vv =  VectorSpherical2Cartesian((Alt),Math.toRadians(L0) );
              vv =  VectorSpherical2Cartesian((-alt1),Math.toRadians(L0) );
             // vv =  VectorSpherical2Cartesian(-alt1,Math.toRadians(L0) );
         //   vv =  VectorSpherical2Cartesian(alt,Math.toRadians(L0) );


            vy =  MatrixVecProd( My, vv, vy );

            vyz =  MatrixVecProd( Mz, vy, vyz );



            wpt[w] = C2ELat( vyz[0], vyz[1], vyz[2]);
            wpt[w+1] = C2ELon( vyz[0], vyz[1], vyz[2]);

            WPT = toFloatArray(wpt);

            x[w] = map(WPT[w+1],radians(-180) ,radians(180),texture.width, texture.width - texture.width);
            y[w] = map(WPT[w],radians(-90),(radians(90)),texture.height,texture.height - texture.height);
            
            texture.point(x[w],y[w]);
            texture.noFill();
            texture.stroke(255,0, 0);
            texture.strokeWeight(2);
            texture.beginShape();
            texture.curveVertex(x[w],y[w]);
            texture.curveVertex(x[w], y[w]);


            texture.endShape();
            

                }
w++;

       texture.endDraw();

released = true;
   return released;
       }
       
     
      
boolean get3Points(){

  
        texture.beginDraw();
        int w = 0;

        for( double L0 = -180.0; L0 <= 180.0; L0 += .1 )
        {
           // Mz = Rz(Math.toRadians(360.0) - (GHA + Math.toRadians(36.082)), Mz);
          //  Mz = Rz(Math.toRadians(360.0) - (GHA1 ), Mz);
            Mz = Rz( (Math.toRadians(180.0) -GHA1 ), Mz);


            My =  Ry(Math.toRadians(90.0) - (-dec1), My);
    released = false;
         //   float alt = map(mouseX,width-width,width,0,90);
              vv =  VectorSpherical2Cartesian((-alt1),Math.toRadians(L0) );
         //   vv =  VectorSpherical2Cartesian(alt,Math.toRadians(L0) );


            vy =  MatrixVecProd( My, vv, vy );

            vyz =  MatrixVecProd( Mz, vy, vyz );



            wpt[w] = C2ELat( vyz[0], vyz[1], vyz[2]);
            wpt[w+1] = C2ELon( vyz[0], vyz[1], vyz[2]);

            WPT = toFloatArray(wpt);

            x[w] = map(WPT[w+1],radians(-180) ,radians(180),texture.width - texture.width, texture.width);
            y[w] = map(WPT[w],radians(-90),(radians(90)),texture.height,texture.height - texture.height);
            texture.point(x[w],y[w]);
            texture.noFill();
            texture.stroke(255,0, 0);
            texture.strokeWeight(2);
            texture.beginShape();
            texture.curveVertex(x[w],y[w]);
            texture.curveVertex(x[w], y[w]);

            texture.endShape();
          
        }
w++;
        w = 0;
        for( double L0 = -180.0; L0 <= 180.0; L0 += .1 )
        {
          //  Mz = Rz(Math.toRadians(360.0) - (GHA1 + Math.toRadians(36.3334) ), Mz);
            Mz = Rz(Math.toRadians(360.0) - (GHA2 ), Mz);


            My =  Ry((Math.toRadians(90.0) - (-dec2)), My);
            //   float alt = map(mouseX,width-width,width,0,90);
            vv =  VectorSpherical2Cartesian((-alt2),Math.toRadians(L0) );
            //   vv =  VectorSpherical2Cartesian(alt,Math.toRadians(L0) );


            vy =  MatrixVecProd( My, vv, vy );

            vyz =  MatrixVecProd( Mz, vy, vyz );



            wpt[w] = C2ELat( vyz[0], vyz[1], vyz[2]);
            wpt[w+1] = C2ELon( vyz[0], vyz[1], vyz[2]);

            WPT = toFloatArray(wpt);

            x[w] = map(WPT[w+1],radians(-180) ,radians(180),texture.width, texture.width - texture.width);
            y[w] = map(WPT[w],radians(-90),(radians(90)),texture.height,texture.height - texture.height);
            texture.point(x[w],y[w]);
            texture.noFill();
            texture.stroke(255,255, 255);
            texture.strokeWeight(2);
            texture.beginShape();
            texture.curveVertex(x[w],y[w]);
            texture.curveVertex(x[w], y[w]);

            texture.endShape();
        }
        w++;
w = 0;
        for( double L0 = -180.0; L0 <= 180.0; L0 += .1 )
        {
           // Mz = Rz(Math.toRadians(360.0) - (GHA2 + Math.toRadians(36.442675)), Mz);
            Mz = Rz(Math.toRadians(360.0) - (GHA3), Mz);


            My =  Ry(Math.toRadians(90.0) - (-dec3), My);
            //   float alt = map(mouseX,width-width,width,0,90);
            vv =  VectorSpherical2Cartesian((-alt3),Math.toRadians(L0) );
            //   vv =  VectorSpherical2Cartesian(alt,Math.toRadians(L0) );


            vy =  MatrixVecProd( My, vv, vy );

            vyz =  MatrixVecProd( Mz, vy, vyz );



            wpt[w] = C2ELat( vyz[0], vyz[1], vyz[2]);
            wpt[w+1] = C2ELon( vyz[0], vyz[1], vyz[2]);

            WPT = toFloatArray(wpt);

            x[w] = map(WPT[w+1],radians(-180) ,radians(180),texture.width, texture.width - texture.width);
            y[w] = map(WPT[w],radians(-90),(radians(90)),texture.height,texture.height - texture.height);
            texture.point(x[w],y[w]);
            texture.noFill();
            texture.stroke(0,0, 255);
            texture.strokeWeight(2);
            texture.beginShape();
            texture.curveVertex(x[w],y[w]);
            texture.curveVertex(x[w], y[w]);

            texture.endShape();
        }
        w++;

        
        texture.endDraw();
released = true;
   return released; 
         
    }
   
   
