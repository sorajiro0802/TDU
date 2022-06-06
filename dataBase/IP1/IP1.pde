PImage I; //<>// //<>//

void setup()
{
  size(80, 60);
  I = loadImage("./OFF.jpg");
  I.resize(80, 60);

  int x, y;
  int R, G, B, L;
  float ave=0;
  double SD=0.0;

  for (y = 0; y < I.height; y++) {
    for (x = 0; x < I.width; x++) {
      R = (int)( red(I.get(x, y)) );
      G = (int)( green(I.get(x, y)) );
      B = (int)( blue(I.get(x, y)) );
      //L = parseInt(0.3*R + 0.59*G + 0.11*B);//lightness
      L = (R+G+B)/3;
      ave += L;//sum of L
      SD += pow(L, 2);//sum of L*L
    }
  }
  ave = ave / (I.width*I.height);
  SD = (double) sqrt((float) SD/(I.width*I.height) - pow(ave, 2)) ;
  println("average = " + ave);
  println("SD = " + SD);
  
  if(ave > 255/2){
    println("\nON!\n");
  }
  else{
  println("\nOFF!!\n");
}
}

void draw() {
  image(I, 0, 0);
}
