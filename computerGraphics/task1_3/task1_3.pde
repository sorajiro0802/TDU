void setup() {
   size(512,512);
   background(0);
   noStroke();
}

void draw(){
    int i,j;
    int N = 255;
    int rxu, rxd, ry, r;
    int gxu, gxd, gy, g;
    int bxu, bxd, by, b;

    for(j=0; j<256 ; j++){
        for(i=0; i<256 ; i++){
            rxu = ((0-255) / N) * i + 255;
            rxd = ((255-0) / N) * i + 0;
            ry = ((rxd - rxu) * j) / N + rxu;
            r = ry;

            gxu = ((0-0) / N) * i + 0;
            gxd = ((0-255) / N) * i + 255;
            gy = ((gxd - gxu) * j) / N + gxu;
            g = gy;

            bxu = ((255-0) / N) * i + 0;
            bxd = ((255-0) / N) * i + 0;
            by = ((bxd - bxu) * j) / N + bxu;
            b = by;

            v_pixel(2,i,j, r, g, b);
        }
    }
}

// 以下の部分は、変更・削除しないこと
// 


void keyPressed(){
    if( key== 's' ) {
    saveFrame("Result.jpg");  // Save File Name
    println("Result.jpg was saved");
    }
}
//
void v_pixel(int n, int x, int y, int r,int g, int b){
  if(n==1)
    {
      stroke(color(r,g,b));
      point(x,y);}
    else
    {
      fill(r,g,b);
      rect(x*n,y*n,n,n);
    }
  }
