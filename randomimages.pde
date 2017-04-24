PImage[] images = new PImage[19];  //number of images to load
int r;
float angle;
PGraphics alphabackground;

void setup()
{
  size(1024 ,1024);
  alphabackground = createGraphics(width,height, JAVA2D);  //initialize images layer
  background(0,255,0);
  for (int i = 1; i < images.length; i ++)
   {
    images[i] = loadImage("data/" + i +".png");  //location and filetype of source images
   } 
   randomarrange();
}
void draw()
{
    text("press r to randomize",100,100);
    text("press s to save",100,150);
}

void keyPressed() {
  if (key == 'r') {
  randomarrange();  //press to generate new iterations
  }
  if (key == 's'){
  alphabackground.save("randomarrangement.png");  //save in the sketch folder
  }
}

void randomarrange(){
  alphabackground.beginDraw();  
  alphabackground.clear();  //erase before adding new images
  clear();
  background(0,255,0);
    for(int count = 0; count < images.length; count ++)
    {
      r=int(random(1,images.length));
      print(r);
      alphabackground.imageMode(CENTER);
      angle = random(120,180);  //rotation degree
      float c = cos(angle);
      alphabackground.translate(width/2, height/2);
      alphabackground.rotate(c);
      int randmoveX = int(random(-100,200));  //spread from center
      int randmoveY = int(random(-100,100));
      alphabackground.image(images[r], randmoveX, randmoveY, 425, 550);  //place image and resize
      alphabackground.translate(-(width/2),-(height/2));  //reset translation before next placement
      
    }
    alphabackground.endDraw();
    image(alphabackground,0,0);  //draw layer of images
}