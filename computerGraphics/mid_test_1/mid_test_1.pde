PImage img_in, img_out;

void setup()
{
  size(1282,480);
  surface.setResizable(true);
  img_in = loadImage("sample.jpeg");
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
      
      float red   = red(img_in.get(x,y));
      float green = green(img_in.get(x,y));
      float blue  = blue(img_in.get(x,y));
      int out = 0;
      if(red > 196 && green <= red*0.5 && blue <= red*0.5 ){
        out = 0;
      }
      else{
        out = 128;
      }
        img_out.pixels[pos] = color(out, out, out); 
    }
  }
  img_out.updatePixels();
  image(img_out,img_in.width,0);
  img_out.save("result.jpg"); // rewrite save file name
}
