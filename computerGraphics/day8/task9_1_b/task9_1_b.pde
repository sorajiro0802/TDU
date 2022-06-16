void setup() {
  size(512, 512);
  background(0);
  noStroke();
}

/* 以下のdrawは、演習９−１(a),(b)に用いる */
void draw(){
 
 Bresen(10,250, 510, 350); // line-1
 Bresen(10,250, 510, 150); // line-2
 Bresen(510,250, 10, 450); // line-3
 Bresen(510,250, 10, 50); // line-4
 
 }
 



void Bresen(int xs, int ys, int xe, int ye)
{
  int x, y,tmp;
  int er;
  if(xs > xe){
   tmp=xs; xs=xe; xe=tmp;
   tmp=ys; ys=ye; ye=tmp;
  }
  er=(xe-xs);
  y = ys;
  for(x = xs; x <= xe; x++){
    pixel(x, y, 255,255,255);
    er += abs(ye-ys)*2;
    if(er >= (xe-xs)*2){
      if(ys<ye){ y += 1;} else{ y -= 1;}
      er -= (xe-xs)*2;
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
