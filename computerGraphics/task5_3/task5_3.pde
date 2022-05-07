PImage img_in, img_out;

void setup()
{
  size(1282,480);
  surface.setResizable(true);
  img_in = loadImage("sample_pic_2.png");
  img_out = createImage( img_in.width, img_in.height, RGB );
  surface.setSize(img_in.width*2, img_in.height);
  noLoop();
}

void draw()
{
  image(img_in,0,0);
  img_in.loadPixels();
  for ( int y = 1; y < img_in.height-1; y++)
  {
    for ( int x = 1; x < img_in.width-2; x++)
    {
       int pos = x + y*img_in.width;
       float fw = -(gray(x-1,y-1)+gray(x-1,y+1) + 2*gray(x-1, y)) +
                    gray(x+1,y-1)+gray(x+1,y+1) + 2*gray(x+1, y);
       float fh = -(gray(x-1,y-1)+2*gray(x,y-1)+gray(x+1,y-1)) +
                    gray(x-1,y+1)+2*gray(x,y+1)+gray(x+1,y+1);
       float gw = sqrt(fw*fw + fh*fh);
       //println(gw);
      img_out.pixels[pos] = color(gw,gw,gw); 
    }
  }
  img_out.updatePixels();
  image(img_out,img_in.width,0);
  img_out.save("result.jpg"); // rewrite save file name
}

float gray(int x, int y)
{    int pos = x + y*img_in.width;
     color c = img_in.pixels[pos];
     float r = red( c );
     float g = green( c );
     float b = blue( c );
     float gray = 0.3 * r + 0.59 * g + 0.11 * b;
     return( gray );
}
