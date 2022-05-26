float rx = 0.0;  // x軸まわりの回転角度
float ry = 0.0;  // y軸まわりの回転角度
float rz = 0.0;  // z軸まわりの回転角度
float scl=250.0; // 基準拡大

class Point{  float x; float y; float z;

      Point(){};                           // コンストラクター(引数なし）)
      
      Point(float tx,float ty, float tz ) // コンストラクター（引数：値）
        { x=tx; y=ty; z=tz; };
      
      void Normalize(){                   // 正規化
        float r=sqrt(x*x+y*y+z*z);
        x=x/r; y=y/r; z=z/r; }
      
      void SetValue(float tx,float ty, float tz ) // 値の設定
        { x=tx; y=ty; z=tz; };
 }

Point Light;             // 光線位置の設定

void setup() {
  size(800, 800, P3D);  // 3Dモード
  strokeWeight(0.01);
  //noFill(); // wireFrameを描画する際には，コメントアウトを外す．
  Light=new Point(1.0,0.0,2.0);Light.Normalize(); // 光線ベクトル
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
  scale(scl);    // 250倍に拡大
  strokeWeight(2/scl); // 線分の太さ（new）

  // 立方体を描画

 //drawConewf();  
 drawConerend();
 //drawCylinderrend();
}

/*  以下の２関数が演習５－３　*/
void drawConewf() {  // drawConewf -> drawConerend
  Point P1,P2,P3,P4;
  int n=24;
  float dti,dtip1,dt;
  stroke(255); 
  P1=new Point();P2=new Point();P3=new Point();P4=new Point();
  dt=2*PI/float(n);
   for(int i=0;i<n;i++){
     dti=dt*float(i); dtip1=dt*float(i+1);
     P1.SetValue(sin(dti),  cos(dti),  0.0);
     P2.SetValue(sin(dtip1),cos(dtip1),0.0);
     P3.SetValue(0.0,       0.0,       1.0);
     P4.SetValue(0.0,       0.0,       0.0); 
     draw_triangle(P1,P2,P3);  // draw_triangle -> rend_triangle
     draw_triangle(P1,P2,P4);  // draw_triangle -> rend_triangle
 }  
}
void draw_triangle(Point P1,Point P2, Point P3)
{
  beginShape(TRIANGLES);
      vertex(P1.x, P1.y, P1.z);
      vertex(P2.x, P2.y, P2.z); 
      vertex(P3.x, P3.y, P3.z);
   endShape(CLOSE); 
}

/* 演習7-4では、以下の３関数を完成させる　*/
void drawConerend() { 
  Point P1,P2,P3,P4;
  int n=40;
  float dti,dtip1,dt;
  noStroke(); 
  P1=new Point();P2=new Point();P3=new Point();P4=new Point();
  dt=PI/float(n);
   for(int i=0;i<n;i++){
     dti=dt*float(i); dtip1=dt*float(i+1);
     P1.SetValue(sin(dti),  cos(dti),  0.0);
     P2.SetValue(sin(dtip1),cos(dtip1),0.0);
     P3.SetValue(0.0,       0.0,       1.0);
     P4.SetValue(0.0,       0.0,       0.0); 
     rend_triangle(P2,P1,P3);
     rend_triangle(P1,P2,P4);
 }  
}

void FindNormal(Point P0,Point P1, Point P2, Point N)
{
  //  図６－２を参考に完成させる
    float D1x,D1y,D1z,D2x,D2y,D2z;
    D1x=P1.x-P0.x; D1y=P1.y-P0.y; D1z=P1.z-P0.z;
    D2x=P2.x-P1.x; D2y=P2.y-P1.y; D2z=P2.z-P1.z;
    N.SetValue(
    // P1とP2との外積を求め，Nに代入 <-法線ベクトル
     D1y*D2z - D1z*D2y    ,   // N.xの計算
     D1z*D2x - D1x*D2z    ,   // N.yの計算
     D1x*D2y - D1y*D2x    );  // N.zの計算
    // Nを正規化（向きそのまま大きさ1）
    N.Normalize();
} 


void rend_triangle(Point P1,Point P2, Point P3)
{
  // 図7－7を参考に完成させる
  Point NV ; 
  NV=new Point();
  FindNormal(P1, P2, P3, NV);// 面法線を求める  
  //LightとNVの内積：明るさを求める（0〜1）
  float br = (Light.x*NV.x + Light.y*NV.y + Light.z*NV.z) * 255; 
  fill(br, br, br); 
  beginShape(TRIANGLES);
    vertex(P1.x, P1.y, P1.z); 
    vertex(P2.x, P2.y, P2.z); 
    vertex(P3.x, P3.y, P3.z);
  endShape();
}


/* 演習7-8では、以下の関数を完成させる　*/
void drawCylinderrend() { 
  Point P1,P2,P3,P4,P5,P6;
  int n=24;
  float dti,dtip1,dt;
  noStroke(); 
  P1=new Point();P2=new Point();P3=new Point();P4=new Point();
  P5=new Point();P6=new Point();
  dt=2*PI/float(n);
   for(int i=0;i<n;i++){
     dti=dt*float(i); dtip1=dt*float(i+1);
     P1.SetValue( cos(dti),   sin(dti),   0);
     P2.SetValue( cos(dtip1), sin(dtip1), 0);
     P3.SetValue( cos(dtip1), sin(dtip1), 1);
     P4.SetValue( cos(dti),   sin(dti),   1);
     P5.SetValue( 0,           0,         1);
     P6.SetValue( 0,           0,         0);
 /* 以下、「表からみて反時計回り」に指定　*/
     /* ４辺形領域は、二つの３辺形で構成する　*/   
     rend_triangle(  P1, P2, P3  );     rend_triangle( P1, P3, P4 );  
     rend_triangle(  P1, P2, P6  );     rend_triangle( P3, P4, P5 ); 
 }  
}


void keyPressed() {
  int file_num = (int)random(0, 255);
  String saveName = "save-"+file_num+".jpg";
  if (keyCode == UP)          { rx = rx + PI/30.0; }
  else if (keyCode == DOWN)   { rx = rx - PI/30.0; }
  else if (keyCode == LEFT)   { rz = rz - PI/30.0; }
  else if (keyCode == RIGHT)  { rz = rz + PI/30.0; }
  else if( key== '+' ) { scl=scl+10;}               // 拡大（new)
  else if( key== '-' ) { scl=scl-10;}               // 縮小(new)
  else if( key== 'r' ) { rx=0.0; rz=0.0; scl=250;}  // リセット（new）
  else if( key== 's' ) { saveFrame(saveName);print(saveName);} // Save File Name
}
