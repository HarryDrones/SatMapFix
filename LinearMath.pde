
double Mod(double x[]) {

  return(Math.sqrt(x[0] * x[0] + x[1] * x[1] + x[2] * x[2]));
  
}

double[] Add(double x[], double y[]) {
  double z[] = new double[3];
  for (int i = 0; i < 3; i++) {
       z[i] = x[i] + y[i];
      } 
 
 return   z ;  
 }
 
 double[] aVector(double a, double x[]) {
   double z[] = new double[3];
   z[0] = a * x[0];
   z[1] = a * x[1];
   z[2] = a * x[2];
   
   return (z);
   
 }
 
 double[] Unit(double x[]) {
   
   return (aVector(1.0/Mod(x),x));
   
 }
 
 double Dot(double x[], double y[])
 {
   return (x[0]*y[0]+x[1]*y[1]+x[2]*y[2]);
   
 }
 
 double[] Cross(double x[], double y[]){
  
   double z[] = new double[3];
   z[0] = (x[1]*y[2]) - (x[2]*y[1]);
   z[1] = (x[2]*y[0]) - (x[0]*y[2]);
   z[2] = (x[0]*y[1]) - (x[1]*y[0]);
   
   return (z);
   
 }
