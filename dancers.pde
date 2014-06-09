

final int NO_DANCERS = 30 ;
final int MY_WIDTH = 300 ;
final int MY_HEIGHT = 300 ;

float x;
float y;
float easing = 0.03;

int radius = 20;
float edge = 50;
float inner = edge + radius;

Particle[] dancers ;

class Game {

void defineFonts(){
  pauseFont = createFont("Arial",30,true);
}


void initialise() {
  size(MY_WIDTH, MY_HEIGHT) ;
  
  defineFonts();
  
  dancers = new Particle[NO_DANCERS] ;
  for (int i =0; i < NO_DANCERS ; i++) {
    dancers[i] = new Particle((int)random(0,MY_WIDTH),
                                (int)random(0,MY_HEIGHT),
                                random(-.5f,.5f),
                                random(-.5f,.5f),
                                0f,0f) ;
  }

}


void display() {
 background(51);
 fill(255);
  if (mousePressed){
         
        
        float targetX = mouseX;
        float dx = targetX - x;
        if(abs(dx) > 1) {
          x += dx * easing;
        }
        
        float targetY = mouseY;
        float dy = targetY - y;
        if(abs(dy) > 1) {
          y += dy * easing;
        }
        
        
  }
  
  x = constrain(x, inner, MY_WIDTH - inner);
  y = constrain(y, inner, MY_HEIGHT - inner);
  
  fill(90);
  stroke(90);
  rect(edge,edge,MY_WIDTH - (2*edge), MY_HEIGHT - (2*edge));
  
  fill(255);
  ellipse(x, y, radius*2, radius*2);
  
  for (int i =0; i< NO_DANCERS; i++){
    dancers[i].integrate();
    PVector pos = dancers[i].position ;
    ellipse(pos.x, pos.y, 10, 10) ;
  }  
}




}
