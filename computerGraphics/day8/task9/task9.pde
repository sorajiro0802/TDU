void setup() {
  size(512, 512);
  background(0);
  noStroke();
}

/* 以下のdrawは、演習９−１(a),(b)に用いる */
/*void draw(){
 
 Bresen(10,250, 510, 350); // line-1
 
 Bresen(10,250, 510, 150); // line-2
 Bresen(510,250, 10, 450); // line-3
 Bresen(510,250, 10, 50); // line-4
 
 }
 */


//（演習９−２）プログラム９の実行時は、以下のdrawを使う
void draw() {
  int x[]={350, 450, 450, 350, 150, 50, 50, 150, 250, 50};
  int y[]={ 50, 150, 350, 450, 450, 350, 150, 50, 50, 250};
  int i;
  for(i=0; i<10; i++){
    Bresen(250,250, x[i], y[i]);
    //stroke(255,255,255);
    //line(250,250, x[i], y[i]);
  }
}
/* ここまで */



void Bresen(int xs, int ys, int xe, int ye)
{
  int x, y;
  int er;
  if (abs(xe-xs) > abs(ye-ys)) {
    if (xs > xe) {
    int tmp  = xs;xs = xe;xe = tmp;
    int tmp2 = ys;ys = ye;ye = tmp2;
  }
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
    int tmp2 = xs;xs = xe;xe = tmp2;
  }
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
