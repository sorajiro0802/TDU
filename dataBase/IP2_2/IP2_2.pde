//配列を利用するプログラム

PImage I;
  
void setup()
{
  I = loadImage("texture04.bmp");//画像読み込み
  I.resize(80,60);//WebClass問１
    
  int x, y, z;//pixelのx,y座標&RGB
  int[][][] RGB = new int[I.width][I.height][3];
  int[][] L = new int[I.width][I.height];
  float ave=0;//明度Lの累積値→平均値
  double SD=0.0;//明度Lの二乗値の累積値→標準偏差

  int i;
  double[] AC = new double[4];
  for(i = 0; i < 4; i++)
    AC[i] = 0.0;
  int[] dx = new int[4];
  int[] dy = new int[4];

  for(y = 0; y < I.height; y++){//y座標のΣ
    for(x = 0; x < I.width; x++){//x座標のΣ
      RGB[x][y][0] = (int)red(I.get(x,y));//WebClass問2。座標(x,y)のR値（関数）を読み込む
      RGB[x][y][1] = (int)green(I.get(x,y));//座標(x,y)のG値（関数）を読み込む
      RGB[x][y][2] = (int)blue(I.get(x,y));//座標(x,y)のB値（関数）を読み込む
      for(z = 0; z < 3; z++){
        L[x][y] += RGB[x][y][z];//R+G+Bと同じ計算
      }
      L[x][y] = L[x][y]/3;//明度Lの計算式
      ave += L[x][y];//明度Lの累積値。
      SD += (double)pow(L[x][y],2);//明度Lの二乗値の累積値。pow()の前には(double)を挿入すること
    }
  }
  //すべてが足し算された。∑∑
  ave = ave/I.width/I.height;//ピクセル数＝αで？
  SD = (double) sqrt((float)SD/I.width/I.height-pow(ave,2)); //SDを用いた標準偏差の式を利用 。sqrtの前には(double)を挿入すること
  println("average= " + ave);//明度Lの平均値の表示
  println("SD= " + SD);//明度Lの標準偏差の表示

  dx[0] = -1; dy[0] = 0;
  dx[1] = -1; dy[1] = 1;
  dx[2] =  0; dy[2] = 1;
  dx[3] =  1; dy[3] = 1;
   // 水平
  for(y = 0; y < I.height; y++){
      for(x = 1; x < I.width; x++){
        AC[0] += (double)((L[x][y]-ave) * (L[x+dx[0]][y+dy[0]]-ave));
    }
  }
  AC[0] = AC[0]/(I.width-1)/I.height/SD/SD; 
 // 右斜上
  for(y = 0; y < I.height-1; y++){
    for(x = 1; x < I.width; x++){
      AC[1] += (double)( (L[x][y]-ave) * (L[x+dx[1]][y+dy[1]]-ave) );
    }
  }
  AC[1] = AC[1]/(I.width-1)/(I.height-1)/SD/SD; 
  
  // 垂直
  for(y = 0; y < I.height-1; y++){
    for(x = 0; x < I.width; x++){
       AC[2] += (double)( (L[x][y]-ave) * (L[x+dx[2]][y+dy[2]]-ave) );
    }
  }
  AC[2] = AC[2]/(I.height-1)/I.width/SD/SD; 
  
  //左斜め上
  for(y = 0; y < I.height-1; y++){
   for(x = 0; x < I.width-1; x++){
     AC[3] += (double)( (L[x][y]-ave) * (L[x+dx[3]][y+dy[3]]-ave) );
   }
  }
  AC[3] = AC[3]/(I.height-1)/(I.width-1)/SD/SD;
  for(int s = 1; s<4; s++){
  println("AC"+s+"= "+AC[s]);}
}

void draw() {
  image(I, 0, 0);//画像Iを表示
}
