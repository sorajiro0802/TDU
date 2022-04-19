PImage img_in, img_out;

void setup()
{
  size(1282,480);
  img_in = loadImage("sample_pic1.jpeg");
  img_out = createImage( img_in.width, img_in.height, RGB );
  //size(img_in.width*2, img_in.height);
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
      //img_out.pixels[pos] = img_in.pixels[pos];
      //img_out.pixels[pos] = color(red(img_in.pixels[pos]),0,0); // only red channel //
      int r = color(red(img_in.pixels[pos]), 0, 0);
      int g = color(0, green(img_in.pixels[pos]), 0);
      int b = color(0, 0, blue(img_in.pixels[pos]));
    }
  }
  img_out.updatePixels();
  image(img_out,img_in.width,0);
  img_out.save("result.jpg"); // rewrite save file name
}
