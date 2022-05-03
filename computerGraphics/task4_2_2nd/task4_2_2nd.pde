PImage img_in, img_out;

void setup()
{
  size(1282,480);
  surface.setResizable(true);
  img_in = loadImage("sample_pic2.jpeg");
  img_out = createImage( img_in.width, img_in.height, RGB );
  surface.setSize(img_in.width*2, img_in.height);
  noLoop();
}

void draw()
{
  image(img_in,0,0);
  img_in.loadPixels();
  for ( int y = 0; y < img_in.height; y++)
  {
    for ( int x = 0; x < img_in.width; x++)
    {
      int pos = x + y*img_in.width;
      float gray=gray(x,y);
      if(gray < 256/2){
        gray = 255;
      }else{
        gray = 0;
      }
      img_out.pixels[pos] = color(gray,gray,gray); 
      
 
    }
  }
  img_out.updatePixels();
  image(img_out,img_in.width,0);
  img_out.save("result.jpg"); // rewrite save file name
}

float gray(int x, int y) {
  int pos = x + img_in.width*y;
  color c = img_in.pixels[pos];
  float r = red(c);
  float g = green(c);
  float b = blue(c);
  float gray = 0.3*r + 0.59*g + 0.11*b;
  return gray;
}
