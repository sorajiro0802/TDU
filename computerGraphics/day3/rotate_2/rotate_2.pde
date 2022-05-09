PImage img_in, img_out;
float th = 30;

void setup()
{
  size(400,400);
  surface.setResizable(true);
  img_in = loadImage("sample_pic2.jpeg");
  img_out = createImage( img_in.width, img_in.height, RGB );
  surface.setSize(img_in.width*2, img_in.height);
  noLoop();
}

void draw()
{
  float c = cos(th*PI/180);
  float s = sin(th*PI/180);
  image(img_in,0,0);
  int w = img_in.width;
  int h = img_in.height;
  img_in.loadPixels();
  for ( int Y = 0; Y < h; Y++){
    for ( int X = 0; X < w; X++){
      int x = int( (X-w/2) * c + (Y-h/2) * s + w/2);
      int y = int(-(X-w/2) * s + (Y-h/2) * c + h/2);
      
      if( (x>=0)&&(x<w)&&(y>=0)&&(y<h) ) {
        int OldPos = x + y*w;
        int NewPos = X + Y*w;
        img_out.pixels[NewPos] = img_in.pixels[OldPos];
      }
    }
  }
  img_out.updatePixels();
  image(img_out, w, 0);
  img_out.save("out.jpg"); // rewrite save file name
}
