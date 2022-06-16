void setup() {
  size(512, 512);
  background(0);
  noStroke();
}

void draw() {
  int x[]={350, 450, 450, 350, 150, 50, 50, 150, 250, 50};
  int y[]={ 50, 150, 350, 450, 450, 350, 150, 50, 50, 250};
  int i;
  for(i=0; i<10; i++){
    Bresen(250,250, x[i], y[i]);
  }
}

void Bresen(int xs, int ys, int xe, int ye)
{
  int x, y;
  int er;
  if (abs(xe-xs) > abs(ye-ys)) {
    if (xs > xe) {
    int tmp  = xs;xs = xe;xe = tmp;
    int tmp2 = ys;ys = ye;ye = tmp2;}
    er=(xe-xs);
    y=ys;
    for ( x=xs; x<=xe; x++) {
      pixel(x, y, 255, 255, 255);
      er=er+abs(ye-ys)*2;
      if ( er >=(xe-xs)*2) {
        if (ys < ye) {y = y+1;} else {y = y-1;}
        er = er-(xe-xs)*2;
      }
    }
    
  } 
  else 
  {

    if (ys > ye) {
    int tmp  = ys;ys = ye;ye = tmp;
    int tmp2 = xs;xs = xe;xe = tmp2;}
    er = (ys-ye);
    x=xs;
    for (y = ys; y <= ye; y++) {
      pixel(x, y, 255, 255, 255);
      er += abs(xe-xs)*2;
      if ( er >= (ye-ys)*2) {
        if (xs < xe) {x += 1;} else {x -= 1;}
        er = er-(ye-ys)*2;
      }
    }
  }
  
}

//---------------------------------------------------------//
// Do not Delete folowing function

void keyPressed() {
  if ( key== 's' ) {
    saveFrame("Result.jpg");  // Save File Name
  }
}

//
// Don't rewrite following function v_pixel !!
//

void pixel(int x, int y, int r, int g, int b)
{
  stroke(color(r, g, b));
  point(x, y);
}
