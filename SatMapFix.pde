import de.bezier.data.sql.*;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.event.*;
import java.awt.BorderLayout;
import javax.swing.*;
import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import java.awt.event.MouseListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import javax.swing.event.*;
import java.awt.event.ActionListener;
import java.text.DecimalFormat;

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 
import processing.serial.*;

import java.util.*;

import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.utils.*;
import de.fhpotsdam.unfolding.providers.*;
import de.fhpotsdam.unfolding.mapdisplay.MapDisplayFactory;
import de.fhpotsdam.unfolding.marker.*;
import de.fhpotsdam.unfolding.events.EventDispatcher;
import de.fhpotsdam.unfolding.interactions.MouseHandler;

UnfoldingMap mapDetail;
UnfoldingMap mapOverview;
Location locationLondon = new Location(39.41f, -77.41f);

String text;
//double h;
Serial myPort;
float heading = 0.0;
float altitude = 0.0;


int Latitude_1 = 39;
int Lat_minutes = 24;
int Lat_seconds = 52;
int Longitude_1 = -77;
int Lon_minutes = 24;
int Lon_seconds = 37;
int Zone = 4;  ////Time zone correction
double GMST = 0;
double LMST = 0;
double Lon = 77.410; //W is negative but not here
double Lat = 39.41; //24.5551; //39.410;

double ra = 0;
float RA = 0;
//double dec = Math.toRadians(61.615);
double ma = 0; //Meridian angle
String starName = " ";
boolean Star_1 = false;
boolean Star_2 = false;
boolean Star_3 = false;

String Star1 = "Rasalhague";
String Star2 = "Polaris";
int z = 73;
int j = 25;
 double GHAaries = 187.6816666;
 double GAST = 0;
 double GHA = 0; //Math.toRadians(86.105);
 double SHA = 0;
double GHA1 = Math.toRadians(40.39833333);
double GHA2 = Math.toRadians(323.185);
double GHA3 = Math.toRadians(236.515);
// double dec = Math.toRadians(42); 
double dec = Math.toRadians(19.335);
double dec1 = Math.toRadians(29.23);
double dec2 = Math.toRadians(46.02166666);
double dec3 = Math.toRadians(61.615);
float alt = radians(55.53f);
double alt1 = radians(58.0383333f);
double alt2 = radians(13.6933333f);
double alt3 = radians(12.4383333f);

int clickcount = 0;
 
// double GHA1 = 0;
// double GHA2 = 0;
// double dec1 = 0;
/// double dec2 = 0;
// double alt1 = 0;
// double alt2 = 0;
 double azi1 = 0;
 double azi2 = 0;
 double t12 = 0;
 double alt12 = 0;
 double A = 0;
 double B = 0;
 double Par1 = 0;
 double Par2 = 0;
 double t1 = 0;
 double t2 = 0;
 double Lat1 = 0;
 double Lat2 = 0;
 double Lon1 = 0;
 double Lon2 = 0;
 
 double Az = 0;
 double Alt = radians(67.163333f);
 double[] Fix;
 double Hc;
double Z;


SQLite db;
//TableOne t = new TableOne();

PImage texmap;
PGraphics texture;
float[] x = new float[36000];
float[] y = new float[36000];
int w;

//double Be = Math.toRadians(35.4000);
//double Le = Math.toRadians(26.452837); 
double[]vv = new double[3]; //, vy[3], vyz[3];
double[]vy = new double[3];
double[]vyz = new double[3];
double[]wpt = new double[36000];
float[]WPT = new float[36000];
double[][]My = new double[3][3];
double[][]Mz = new double[3][3]; 
int sDetail = 65;  // Sphere detail setting
float rotationX = 0;
float rotationY = 0;
float velocityX = 0;
float velocityY = 0;
//float globeRadius = 600;
float pushBack = -100; 
float globeRadius = 700;
float[] cx, cz, sphereX, sphereY, sphereZ;
float sinLUT[];
float cosLUT[];
float SINCOS_PRECISION = 0.5;
int SINCOS_LENGTH = int(360.0 / SINCOS_PRECISION);
color [] colors = new color[7];

boolean released = false;

boolean Map = true;
MyPanel controlPanel;


  float lat, lat2,lat3,latA,lat2A,lat3A;
  float lon,lon2,lon3,lonA,lon2A,lon3A;






public void setup() {
 // size(700, 400,P3D);
// size(800, 500, P3D);
     size(1275, 750, P3D);
  /////////////////    printArray(Serial.list());
      
      
      //  mapDetail = new UnfoldingMap(this, "detail", 10, 10, 1275, 750);
    mapDetail = new UnfoldingMap(this, "detail", 10, 10, 1275, 750, true, false, new Microsoft.AerialProvider());
 
  mapDetail.setTweening(true);
  mapDetail.zoomToLevel(3);
  mapOverview = new UnfoldingMap(this, "overview", 605, 10, 185, 185);
 ///////  mapOverview = new UnfoldingMap(this, "overview", 1075, 10, 200, 185, true, false, new Microsoft.AerialProvider());
  
  mapOverview.setTweening(true);

  EventDispatcher eventDispatcher = new EventDispatcher();

  // Add mouse interaction to both maps
  MouseHandler mouseHandler = new MouseHandler(this, mapDetail, mapOverview);
  eventDispatcher.addBroadcaster(mouseHandler);

  // Maps listen to each other, i.e. each interaction in one map is reflected in the other
  eventDispatcher.register(mapDetail, "pan", mapDetail.getId(), mapOverview.getId());
  eventDispatcher.register(mapDetail, "zoom", mapDetail.getId(), mapOverview.getId());
  eventDispatcher.register(mapOverview, "pan", mapDetail.getId(), mapOverview.getId());
  eventDispatcher.register(mapOverview, "zoom", mapDetail.getId(), mapOverview.getId());

//  myPort = new Serial(this, Serial.list()[0], 9600);
//  myPort.bufferUntil(10);  //(10);
////////////  texmap = loadImage("world32k.jpg"); //("starmap_4k2B2b.jpg"); //("world32k.jpg");
///////////////////  texture = createGraphics(texmap.width,texmap.height);
  if (Lon < 0) Lon = -1 * Lon;
initStars();

 JFrame frame2 = new JFrame("MyPanel");
frame2.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
controlPanel = new MyPanel();
controlPanel.setOpaque(true);
frame2.setContentPane(controlPanel);
frame2.getContentPane().add(new MyPanel());
frame2.pack();
frame2.setVisible(true);
  
 
    
    
    
    

  
  
}

public void draw() {
  background(0);
    x = new float[3600];
  y = new float[3600];
 // initStars();
//  getPoints();

if (Star_1 == true) {
 GHA1 = GHA;
 dec1 = dec;
 alt1 = Alt;
 Star_1 = false;
  
  
}
if (Star_2 == true) {
  GHA2 = GHA;
  dec2 = dec;
  alt2 = Alt;
  Star_2 = false;
  
}

if (Star_3 == true) {
 GHA3 = GHA;
 dec3 = dec;
 alt3 = Alt;
 Star_3 = false;
    
}
      
        mapDetail.draw();
  Location location = mapDetail.getLocation(mouseX, mouseY);

    text(location.toString(), mouseX, mouseY);
     // Location loc = new Location(39.41f, -77.41f);
      Location loc = new Location(Lat, -Lon);
  ScreenPosition pos = mapDetail.getScreenPosition(loc);
              noFill();
            stroke(0,255, 0);
           strokeWeight(4);
  point(pos.x, pos.y, 20);
/////////// getStar();
GetMap();

 
 
// image(texture,0,0,width,height);
//  renderGlobe();
  
  
  
}


class TableOne
{
  //  public String fieldOne;
  //  public int fieldTwo;
      public String one;
      public double two;
      public double three;

      public String hip;
      public String con;
      public String proper;
      public double dec;
      public double ra;
      public String toString ()
    {
           // return String.format("StarName: %s MeridianAngle: %d Declination: %d", proper, ra, dec);
          // println(String.format("StarName: %s MeridianAngle: %d Declination: %d", proper, ra, dec));
       return String.format("StarName: %s MeridianAngle: %d Declination: %d", proper, ra, dec);
    }
}
/*
public void mouseClicked(MouseEvent e)
{
System.out.println("clicked");
}
*/
/*
//class MyMouseListener  extends JTable implements MouseListener {
class MyMouseListener  implements MouseListener {

    @Override
    public void mouseClicked(MouseEvent e) {
        // Code to execute when the mouse is clicked
        System.out.println("Mouse clicked at (" + e.getX() + ", " + e.getY() + ")");
             //   System.out.println(JTable.getModel().getValueAt(mTable.getRowCount(),0));

    }
        @Override
    public void mousePressed(MouseEvent e) {
        // Code to execute when the mouse button is pressed
    }

    @Override
    public void mouseReleased(MouseEvent e) {
        // Code to execute when the mouse button is released
    }

    @Override
    public void mouseEntered(MouseEvent e) {
        // Code to execute when the mouse enters the component
    }
        @Override
    public void mouseExited(MouseEvent e) {
        // Code to execute when the mouse exits the component
    }
} 
*/

void initStars(){
   
  // texture.beginDraw();
  // texture.background(texmap);
  // texture.endDraw();
}



void initializeSphere(int res)
{
  sinLUT = new float[SINCOS_LENGTH];
  cosLUT = new float[SINCOS_LENGTH];

  for (int i = 0; i < SINCOS_LENGTH; i++) {
    sinLUT[i] = (float) Math.sin(i * DEG_TO_RAD * SINCOS_PRECISION);
    cosLUT[i] = (float) Math.cos(i * DEG_TO_RAD * SINCOS_PRECISION);
  }

  float delta = (float)SINCOS_LENGTH/res;
  float[] cx = new float[res];
  float[] cz = new float[res];
  
  // Calc unit circle in XZ plane
  for (int i = 0; i < res; i++) {
    cx[i] = -cosLUT[(int) (i*delta) % SINCOS_LENGTH];
    cz[i] = sinLUT[(int) (i*delta) % SINCOS_LENGTH];
  }
  
  // Computing vertexlist vertexlist starts at south pole
  int vertCount = res * (res-1) + 2;
  int currVert = 0;
  
  // Re-init arrays to store vertices
  sphereX = new float[vertCount];
  sphereY = new float[vertCount];
  sphereZ = new float[vertCount];
  float angle_step = (SINCOS_LENGTH*0.5f)/res;
  float angle = angle_step;
  
  // Step along Y axis
  for (int i = 1; i < res; i++) {
    float curradius = sinLUT[(int) angle % SINCOS_LENGTH];
    float currY = -cosLUT[(int) angle % SINCOS_LENGTH];
    for (int j = 0; j < res; j++) {
      sphereX[currVert] = cx[j] * curradius;
      sphereY[currVert] = currY;
      sphereZ[currVert++] = cz[j] * curradius;
    }
    angle += angle_step;
  }
  sDetail = res;
}

// Generic routine to draw textured sphere
void texturedSphere(float r, PGraphics t) {
  int v1,v11,v2;
  r = (r + 240 ) * 0.33;
  beginShape(TRIANGLE_STRIP);
  texture(t);
  float iu=(float)(t.width-1)/(sDetail);
  float iv=(float)(t.height-1)/(sDetail);
  float u=0,v=iv;
  for (int i = 0; i < sDetail; i++) {
    vertex(0, -r, 0,u,0);
    vertex(sphereX[i]*r, sphereY[i]*r, sphereZ[i]*r, u, v);
    u+=iu;
  }
  vertex(0, -r, 0,u,0);
  vertex(sphereX[0]*r, sphereY[0]*r, sphereZ[0]*r, u, v);
  endShape();   
  
  // Middle rings
  int voff = 0;
  for(int i = 2; i < sDetail; i++) {
    v1=v11=voff;
    voff += sDetail;
    v2=voff;
    u=0;
    beginShape(TRIANGLE_STRIP);
    texture(t);
    for (int j = 0; j < sDetail; j++) {
      vertex(sphereX[v1]*r, sphereY[v1]*r, sphereZ[v1++]*r, u, v);
      vertex(sphereX[v2]*r, sphereY[v2]*r, sphereZ[v2++]*r, u, v+iv);
      u+=iu;
    }
  
    // Close each ring
    v1=v11;
    v2=voff;
    vertex(sphereX[v1]*r, sphereY[v1]*r, sphereZ[v1]*r, u, v);
    vertex(sphereX[v2]*r, sphereY[v2]*r, sphereZ[v2]*r, u, v+iv);
    endShape();
    v+=iv;
  }
  u=0;
  
  // Add the northern cap
  beginShape(TRIANGLE_STRIP);
  texture(t);
  for (int i = 0; i < sDetail; i++) {
    v2 = voff + i;
    vertex(sphereX[v2]*r, sphereY[v2]*r, sphereZ[v2]*r, u, v);
    vertex(0, r, 0,u,v+iv);    
    u+=iu;
  }
  vertex(sphereX[voff]*r, sphereY[voff]*r, sphereZ[voff]*r, u, v);
  endShape();
  
}


void renderGlobe() {
 
  pushMatrix();
  translate(width/2, height/2, pushBack);
  pushMatrix();
  noFill();
  stroke(255,200);
  strokeWeight(2);
  smooth();
  popMatrix();
  lights();    
  pushMatrix();
  
  rotateX( radians(-rotationX) );
   
  rotateY( radians( - rotationY) );
  
  fill(200);
  noStroke();
  textureMode(IMAGE);  
  texturedSphere(globeRadius, texture);
  popMatrix();  
  popMatrix();
  rotationX += velocityX;
  rotationY += velocityY;
  velocityX *= 0.95;
  velocityY *= 0.95;
  
  


    
  
  
     
}







//Funcition to convert double[] to float[]
float[] toFloatArray(double[] arr) {
  if (arr == null) return null;
  int n = arr.length;
  float[] ret = new float[n];
  for (int i = 0; i < n; i++) {
  ret[i] = (float)arr[i];
  }
  return ret;
}
// end of function to convert double[] to float[]

 double[] VectorSpherical2Cartesian(double B, double L){
  
   double v[] = new double[3];
   v[0] = Math.cos(B) * Math.cos(L);
   v[1] = Math.cos(B) * Math.sin(L);
   v[2] = Math.sin(B);

   return(v);
   
 }

public double C2ELat( double x, double y, double z )
{
  double[]res = new double[3];
  res[0] = Math.sqrt( x*x+y*y+z*z);  //R
//*B = ASIN(z/(*R));
  res[1] = Math.atan2( z, Math.sqrt(x*x+y*y) ); //B
  res[2] = Math.atan2( y, x ); //L

  return (res[1]);

}

public double C2ELon( double x, double y, double z )
{
  double[]res = new double[3];
  res[0] = Math.sqrt( x*x+y*y+z*z);  //R
  res[1] = Math.atan2( z, Math.sqrt(x*x+y*y) ); //B
  res[2] = Math.atan2( y, x ); //L

  return (res[2]);

}
 

public double[] E2C( double B, double L, double R )
{
  double[]res = new double[3];
  
  res[0] = R*Math.cos((B))*Math.cos((L));
  res[1] = R*Math.cos((B))*Math.sin((L));
  res[2] = R*Math.sin((B));
 

 
  return(res);
}
 
 public double[][] Rx( double a, double[][] M ){

  M[0][0] = 1.0;
  M[1][0] = 0.0;
  M[2][0] = 0.0;
  M[0][1] = 0.0;
  M[1][1] = Math.cos(a); //Math.cos(Math.toRadians(a));
  M[2][1] = Math.sin(a); //Math.sin(Math.toRadians(a));
  M[0][2] = 0.0;
  M[1][2] = -Math.sin(a); //-Math.sin(Math.toRadians(a));
  M[2][2] = Math.cos(a); //Math.cos(Math.toRadians(a));
  
  return(M);
}

public double[][] Ry( double a, double[][] M ){

  M[0][0] = Math.cos(a);
  M[1][0] = 0.0;
  M[2][0] = -Math.sin(a);
  M[0][1] = 0.0;
  M[1][1] = 1.0;
  M[2][1] = 0.0;
  M[0][2] = Math.sin(a);
  M[1][2] = 0.0; 
  M[2][2] = Math.cos(a);
  
  return(M);
}

public double[][] Rz( double a, double[][] M ){

  M[0][0] = Math.cos(a); //Math.cos(a);
  M[1][0] = Math.sin(a);
  M[2][0] = 0.0;
  M[0][1] = -Math.sin(a);
  M[1][1] = Math.cos(a);
  M[2][1] = 0.0;
  M[0][2] = 0.0; 
  M[1][2] = 0.0; 
  M[2][2] = 1.0;
  
  return(M);
}
 
public double[] MatrixVecProd( double[][] A, double[] v, double[] res ) {

  int i,j;
  int n = 3;

  for( i=0; i<n; i++ ) {
    res[i] = 0.0;
    for( j=0; j<n; j++ ) {
    res[i] += A[i][j]*v[j];
   
  }
}
  return (res);
}

 
 void serialEvent (Serial myPort)
{
  String inString = myPort.readStringUntil(10);  //(10);

  if (inString != null)
  {
   // println(inString);
    String[] list = split(inString,' '); //'\n'); //','); // ' '); //'\n');
    heading = float(list[0]);
    altitude = float(list[1]);
    println(altitude);
  }  
}

public void calculateTable() { 

   db = new SQLite(this, "hygdata.db"); //open database file
    Object rowData[][] = {{"Row1-Column1", "Row1-Column2", "Row1-Column3", "Row1-Column4"}};
   // Object rowData[][] = {{"Proper Name", "Constellation", "Right Ascension", "Declination"}};
    // array to hold column names
    Object columnNames[] = {"Proper Name", "Constellation", "Right Ascension","GHA    ", "Declination", "altitude"};
    DefaultTableModel mTableModel = new DefaultTableModel(rowData, columnNames);
    JTable table = new JTable(mTableModel);
   

// if (released == true) {
 JFrame frame = new JFrame("Navigation Stars");
// JButton button = new JButton("Click Me!");
 JScrollPane scrollPane = new JScrollPane(table);
// frame.add(button);
// frame.setSize(200,100);
 frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
 frame.setVisible(true); 
 
 //    // create the gui
//    JFrame frame = new JFrame();
 //   frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
   
    frame.add(scrollPane, BorderLayout.CENTER);
    frame.setSize(800, 500); //(800, 450);
    frame.setVisible(true);
    mTableModel.removeRow(0);

    
   table.addMouseListener(new MouseAdapter(){
    public void mouseClicked(MouseEvent e) {
     // table.setSelectionMode(ListSelectionModel.MULTIPLE_INTERVAL_SELECTION);
      //if (e.getClickCount() == 2 || e.getClickCount() == 1){
      if (e.getClickCount() == 1){
        println("ClickCount:  ", e.getClickCount());
        JTable target = (JTable)e.getSource();
     //   target.setRowSelectionAllowed(true);
       // target.setSelectionModel(ListSelectionModel.MULTIPLE_INTERVAL_SELECTION);
        int row = target.getSelectedRow();
        int count = target.getSelectedRowCount();
        GHA = (double)target.getValueAt(row,3);
        GHA = Math.toRadians(-GHA);
                  //   if (GHA < 180) GHA = (-GHA); //(180 - GHA);
          //   if (GHA >180) GHA = (360 - GHA); //(180 + (360 - GHA));
        dec = (double)target.getValueAt(row,4);
        dec = Math.toRadians(90 -dec);
        Alt = (double)target.getValueAt(row,5);
        Alt = Math.toRadians(Alt);

        int column = target.getSelectedColumn();
        Object Data = table.getValueAt(row, column);
        
       // table.setRowSelectionAllowed(true);
       // table.setSelectionMode(ListSelectionModel.MULTIPLE_INTERVAL_SELECTION);
       
       // System.out.print( GHA + "  " + dec + "  " + Alt + " " + count);
       
       
       

        
        
       System.out.println(" " + row );
     //  initStars();
    
  //   getStar();
    // getPoints();
      // initStars();
   //   GetMap();
     
      // clickcount = clickcount + 1;

       
       
       
       
       
       

       
       
      }
     
    }
     
   
     });
   
  

 // });
           // System.out.println(mTableModel.getValueAt(mTable.getRowCount(),0));

    
    
    
    

     
    
    
              if ( db.connect() )
     {
       // String[] tableNames = db.getTableNames();
        String[] tableNames = db.getTableNames();     //  db.query( "SELECT con,ra,dec,proper FROM %s WHERE proper = 'Betelgeuse' OR proper = 'Capella' OR proper = 'Arcturus' OR proper = 'Vega' OR proper = 'Dubhe' OR con = 'Peg' OR con = 'Lyr' OR con = 'Cep' OR con = 'UMa' AND proper > ' '", tableNames[0] );
       db.query( "SELECT con,ra,dec,proper FROM %s WHERE proper =='Alpheratz' OR proper == 'Ankaa' OR proper == 'Schedar' OR proper == 'Diphda' OR proper == 'Achernar' OR proper == 'Hamal' OR proper == 'Acamar' OR proper == 'Menkar' OR proper == 'Mirfak' OR proper == 'Aldebaran' OR proper == 'Rigel' OR proper == 'Capella' OR proper == 'Bellatrix' OR proper == 'Elnath' OR proper == 'Alnilam' OR proper == 'Betelgeuse' OR proper == 'Canopus' OR proper == 'Sirius' OR proper == 'Adhara' OR proper == 'Procyon' OR proper == 'Pollux' OR proper == 'Avior' OR proper == 'Suhail' OR proper == 'Miaplacidus' OR proper == 'Alphard' OR proper == 'Regulus' OR proper == 'Dubhe' OR proper == 'Denebola' OR proper == 'Gienah' OR proper == 'Acrux' OR proper == 'Gacrux' OR proper == 'Alioth' OR proper == 'Spica' OR proper == 'Alkaid' OR proper == 'Hadar' OR proper == 'Menkent' OR proper == 'Rigil Kentaurus' OR proper == 'Arcturus' OR proper == 'Zubenelgenubi' OR proper == 'Kochab' OR proper == 'Alphecca' OR proper == 'Antares' OR proper == 'Atria' OR proper == 'Sabik' OR proper == 'Shaula' OR proper == 'Rasalhague' OR proper == 'Eltanin' OR proper == 'Kaus Australis' OR proper == 'Vega' OR proper == 'Nunki' OR proper == 'Altair' OR proper == 'Peacock' OR proper == 'Deneb' OR proper == 'Enif' OR proper == 'Fomalhaut' OR proper == 'Markab' OR proper == 'Polaris'", tableNames[0] );
Object[] rows;
       int i = 1;
        while (db.next())
        {

            TableOne t = new TableOne();

            db.setFromRow( t );
           // rows = new Object[]{db.getString(1),db.getString(4),db.getString(2),db.getString(3)};  //works this way too
            SiderealTime();
           // CalcAstro();
            
           // CalcAstro();

         //  getStar(); 
            float ra = (float)(t.ra);
              double SHA = 360.0 - (15 * t.ra);
              GAST = GHAaries/15f;
//  println("GAST: ",GAST);
              GHA = SHA + GHAaries;
             if(GHA >=360) GHA = GHA-360;

            GMST = (GHA + (15 * t.ra)); //(15 * t.ra));
            if (GMST >= 360) GMST = GMST - 360;
           // GMST = GMST/15.000;
            println(GMST);
           // println(GMST/15);
           // GHA = GMST - t.ra;
            float dec = (float)(t.dec);
            String conName = t.con;
            String starName = t.proper;
          //  if (Lon < 0) Lon = -1 * Lon;
            double h = Math.sin(Math.toRadians(Lat)) * Math.sin(Math.toRadians(t.dec)) + Math.cos(Math.toRadians(Lat)) * Math.cos(Math.toRadians(t.dec)) * Math.cos(Math.toRadians(GHA - Lon)); //(Math.toRadians(GHA)); //( t.ra - (GMST)));

            h = Math.asin(h);
            h = Math.toDegrees(h);
         
            rows = new Object[]{t.proper,t.con,db.getString(2),GHA,t.dec,h};
            mTableModel.addRow(rows);
          //  mTableModel.getSelectedRow();
          //  println(i,t.con,t.proper, t.ra, t.dec);
         // println(rows);
            
            

           i++;
       

        } //end while

     } //end if 
    
       
    
    
   
   
    
 } 
