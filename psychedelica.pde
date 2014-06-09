PFont font;
color aColor = color(12,100,100);

boolean intro = true;
boolean menu = false;
boolean play = false;
boolean quit = false;

boolean paused = false;
PFont pauseFont;

Game game;

void setup(){
  size(300,300);
  font = createFont("Arial",28,true);  
  game = new Game(); 
}

void draw(){  
  if (intro) displayIntro();
  else if (menu) displayMenu();
  else if (play) game.display();
  else if (quit) displayQuit();
  
  
}

void displayMenu(){
  
  background(0);  
  
  textAlign(CENTER);
  
  fill(255);
  textFont(font,15);
  text("PLAY",width/2,150);
  text("QUIT",width/2,220);
  
  textFont(font,28);

  aColor = alternateColor(aColor);

  fill(aColor);
  text("MENU",width/2,50);

}


void displayIntro(){
   background(0);
  
  
  textAlign(CENTER);
  
  fill(255);
  textFont(font,15);
  text("Press <space> to start.",width/2,200);
  
  textFont(font,28);
  
  aColor = alternateColor(aColor);
  
  fill(aColor);
  text("PSYCHEDELICA",width/2,100);

  
  
}

void displayGame(){
background(0);
  
  
  textAlign(CENTER);

  


  textFont(font,28);
  
  aColor = alternateColor(aColor);
  
  fill(aColor);
  text("GAME.",width/2,100);

  if (frameCount > 800)
    exit();
  
}


void displayQuit(){

  background(0);
  
  
  textAlign(CENTER);

  fill(255);
  textFont(font,15);
  text("vsmart\n2012\n(ɔ)",width/2,200);
  

  textFont(font,28);
  
  aColor = alternateColor(aColor);
  
  fill(aColor);
  text("GOOD BYE.",width/2,100);

  if (frameCount > 700)
    exit();
}

void keyPressed(){
  if (play) {
     if (key == 'p')
       controlPause();
  }
  if (intro)
     if (key == ' ') { 
       intro = false;
       menu = true;
     }
  
  
  if (menu) {
     if (key == 'p'){
       menu = false; 
       play = true;
       game.initialise();
     }
     if (key == 'q'){
       menu = false;
       quit = true;
     }
  }

}




void controlPause(){
  if (paused)
    loop();   
  else {
    noLoop();
    textFont(pauseFont, 30);
    fill(240,0,0);
    textAlign(CENTER);
    text("PAUSED",width/2,140);
    
  }  
  paused = !paused;
  


}

color alternateColor(color aColor){
  if (frameCount % 30 == 0){
     float x = random(0,360);
     float y = random(50,200);
     float z = random(100,200);
     aColor = color(x,y,z);
  }
  return aColor;
}  
