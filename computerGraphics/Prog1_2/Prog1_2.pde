void setup() {
   size(512,512);
   background(0);
   noStroke();
}

void draw(){
  int i,j;
  int k1, k2, k3;
  int N = 255;
  for(j=0; j<256 ; j++){
    for(i=0; i<256 ; i++){
      k1 = ((0-255) * i) / N + 255;
      k2 = ((0-0) * i) / N + 0;
      k3 = ((k2 - k1) * j) / N + k1;
      v_pixel(2,i,j, k3, k3, k3);
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
void v_pixel(int n, int x, int y, int r,int g, int b)
  {
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
