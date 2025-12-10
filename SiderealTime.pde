
 double SiderealTime(){

  Date OldDate = new Date("01/01/2000");
  Date TodaysDate = new Date();
  println(TodaysDate);
  long mills_per_day = 1000*60*60*24;
  long day_diff = (TodaysDate.getTime() - OldDate.getTime())/mills_per_day;

  double dfrac = map(hour()+ Zone + norm(minute(),0,60)+ norm(second(), 0, 3600) ,0,24f,0,24f);
// println(dfrac); 
  double UT = dfrac;

// println(UT);
  dfrac = dfrac/24; // - (5/24);
//println(dfrac);
  double JD = day_diff + dfrac - 0.5 +  2451545;
//println(JD);
  double dwhole = (367*year()-(int)(7*(year()+(int)((month()+9)/12))/4) + (int)(275*month()/9)+day()-730531.5);

  double SD = dwhole + dfrac;
 //   double T = (JD + UT/24 - 2451545.0)/36525;
//  double Theta0 = 280.46061837 + 360.98564736629 * (JD - 2451545.0) + (0.000387933 * (T * T)) - ((T * T * T)/38710000); 
//double Theta = Theta0 + Lon;
//println(Lon);


   GMST = 280.46061837 +( 360.98564746629 * (SD)) + Lon;
  println("GMST: ",GMST);

//double LMST = GMST - (-77.461f);
double LMST = GMST + Lon/15f;// GMST - (Lon);
//println("LMST: ",LMST);
  GMST = (((GMST/360) - (int)GMST/360)*360);
  double T = 367 * year() - (int)(1.75 * (year() + (int)((month()+9)/12))) + (int)(275 * month()/9) + day() + UT/24 - 730531.5; 
// println(GMST);
  GHAaries = 0.9856474 * T + 15 * UT + 100.46062;
//  println("GHAaries: ",GHAaries);
  GHAaries = (((GHAaries/360) - (int)GHAaries/360)*360);
  println("GHAaries: ",GHAaries);
  double SHA = 360.0 - 15 * ra;
  GAST = GHAaries/15f;
  println("GAST: ",GAST);
  GHA = SHA + GHAaries;
  if (GHA > 360.0)GHA = GHA - 360.0;
  println("GHA: ", GHA);
//  println("Declination: ",dec2);
  

  
//println("Julian:  " + JD); 


 return GMST;
}
