float rx = 0.0;  // x軸まわりの回転角度
float ry = 0.0;  // y軸まわりの回転角度
float rz = 0.0;  // z軸まわりの回転角度

class Point{  float x; float y; float z; }

void setup() {
  size(800, 800, P3D);  // 3Dモード
  noFill();
  strokeWeight(0.01); 
}

void draw() {
  // 画面をリフレッシュ
  background(64);
  ortho(-width/2, width/2, -height/2, height/2);  // 並行投影 

  // 画面の中心に原点を移動
  translate(width/2, height/2, 0);
  rotateX(rx);  // x軸まわりの回転
  rotateY(ry);  // y軸まわりの回転
  rotateZ(rz);  // z軸まわりの回転
  scale(250);    // 250倍に拡大

// 立方体を描画
   drawPlaneEasy(); 
//   drawPlanewithFunc();
//   drawTetrahedron();

}
void drawPlaneEasy() {
  stroke(255);
  beginShape(QUADS);

    vertex( 1,  1, 0);
    vertex( 1, -1, 0);
    vertex(-1, -1, 0);
    vertex(-1,  1, 0);
     
  endShape(CLOSE);
 }


void drawPlanewithFunc() {  
  Point P1,P2,P3,P4;
  P1=new Point();P2=new Point();P3=new Point();P4=new Point();
  P1.x=1;  P1.y=1 ; P1.z=0; //( 1, 1,0)
  P2.x=1;  P2.y=-1; P2.z=0; //( 1,-1,0)
  P3.x=-1; P3.y=-1; P3.z=0; //(-1,-1,0)
  P4.x=-1; P4.y=1;  P4.z=0; //(-1, 1,0)
  stroke(255);
  draw_quad(P1,P2,P3,P4);
 // draw_triangle(P1,P2,P3);
 }

/*
void drawTetrahedron()
{
  Point P1,P2,P3,P4;
  P1=new Point();P2=new Point();P3=new Point();P4=new Point();

      // *** 　<< P1〜P4の座標の定義 >>


  stroke(255);
  draw_triangle(P1,P2,P3); 
  draw_triangle(P1,P3,P4);
  draw_triangle(P1,P4,P2);
  draw_triangle(P2,P3,P4);
} 
*/

 
void draw_quad(Point P1, Point P2, Point P3, Point P4)
{
     beginShape(QUADS);
     // << vertexとして、P1,P2,P3,P4を順に定義>>

   endShape(CLOSE);  
}

void draw_triangle(Point P1,Point P2, Point P3)
{
    beginShape(TRIANGLES);
      vertex(P1.x, P1.y, P1.z);


 
   endShape(CLOSE); 
}

void keyPressed() {
  if (keyCode == UP)          { rx = rx + PI/30.0; }
  else if (keyCode == DOWN)   { rx = rx - PI/30.0; }
  else if (keyCode == LEFT)   { rz = rz - PI/30.0; }
  else if (keyCode == RIGHT)  { rz = rz + PI/30.0; }
  else if( key== 's' ) { saveFrame("save-50.jpg");}  // Save File Name
}
