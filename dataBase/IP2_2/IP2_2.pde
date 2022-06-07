//配列を利用するプログラム

PImage I;
  
void setup()
{
  I = loadImage("street01.bmp");//画像読み込み
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

  dx[0] =-1;dy[0] =0;

  for(y = 0; y < I.height; y++){
      for(x = 1; x < I.width; x++){
        AC[0] += (double)((L[x][y]-ave) * (L[x+dx[0]][y+dy[0]]-ave));
    }
  }
  AC[0] = AC[0]/(I.width-1)/I.height/SD/SD;
  println("AC[0]= "+AC[0]);
}

void draw() {
  image(I, 0, 0);//画像Iを表示
}
