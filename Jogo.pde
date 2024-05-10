PImage imgGrama, imgArvore, imgJogador, imgItem, imgMenu, imgConfig, imgStart, imgQuit, Girar, imgPause, fundoInventario, vent;

int adm = 2;
int linhas = 30; 
int colunas = 30;
Cell [][] grid;
Cell [][] grid1;
Cell player;
Inventory inventario;
float moveColdown;

int tempoInicio;
int duracaoPartida = 120000; // 2 minutos em milissegundos
int score = 0;

boolean started;
boolean paused, jogoPausado;
boolean settings;
float startbut, startadder;
float girar;

void setup() {
  frameRate(80);
  size(900, 900);
  
  started = false;
  paused = false;
  jogoPausado = false;
  settings = false;
  
  imgMenu = loadImage("Menu.png");
  imgConfig = loadImage("ConfigBut.png");
  imgStart = loadImage("StartBut.png");
  imgQuit = loadImage("QuitBut.png");
  Girar = loadImage("arvorezinha.png");
  fundoInventario = loadImage("fundoEstrelado.png");
  vent = loadImage("vent.png");
  Girar.resize(300, 300);
  startbut = 200;
}


void draw(){
  background(255);
  if(started == false) {
    desenhaMenu();
    
    //menuAqui
    if(mousePressed && mouseX > 100) {
      started = true;
      duracaoPartida = 120000 + millis();
      startGame();  
    }
    if(settings == true) {
      //config  
    }
    if(mousePressed && mouseX < 100) {
      exit();
    }
    
  } else if(paused == true) {
    
  } else {
  moveColdown++;
  
  //desenhaGrids
  for (int i = 0; i < linhas; i++) {
    for (int j = 0; j < colunas; j++){
      grid1[i][j].display();
    }
  }
  for (int i = 0; i < linhas; i++) {
    for (int j = 0; j < colunas; j++){
      grid[i][j].display();
    }
  }
  
  
  if(mousePressed && mouseX >= 5 && mouseX <= 35 && mouseY >= 45 && mouseY <= 75){
      jogoPausado = true;
  }
    
    while(jogoPausado == true){
      inventario.mostra();
      jogoPausado = inventario.jogoPausado;
    }
    println("oi");
      timescore();
    
  } 
}

void keyPressed(){
  if(moveColdown < 8) {
    return;  
  }
  moveColdown = 0;
  int i = int(player.y / (30*adm));
  int j = int(player.x / (30*adm));
  Cell nextCell = null;
  if (keyCode == UP && i > 0) {
    nextCell = grid[i-1][j];
  } else if (keyCode == DOWN && i < linhas-1) {
    nextCell = grid[i+1][j];
  } else if (keyCode == LEFT && j > 0) {
    nextCell = grid[i][j-1];
  } else if (keyCode == RIGHT && j < colunas-1) {
    nextCell = grid[i][j+1];
  }
  if (nextCell!= null &&!nextCell.tipoDaCelula.equals("árvore")) {
    player.tipoDaCelula = "grama";
    player.img = imgGrama;
    player = nextCell;
    player.tipoDaCelula = "jogador";
    player.img = imgJogador;
  }
}

void desenhaMenu() 
{
  if(startbut <= 200) { startadder = 5;} else if(startbut > 300) { startadder = -5;}
    startbut += startadder;
    image(imgMenu, 0, 0, width, height);
    image(imgConfig, 100, 550, 200, 200);
    image(imgQuit, 675, 75, 100, 100);
    image(imgStart, (width*1/4) - startbut/2,  height/4 -startbut/2, startbut+70, startbut);
    
    
    pushMatrix();
    translate(500, 500);
    girar += 5;
    rotate(girar*PI/100);
    image(Girar, -75, -75, 150, 150);
    translate(50, 50);
    rotate(girar*PI/100);
    image(Girar, 00, 00, 75, 75);
    translate(50, 50);
    rotate(girar*PI/100);
    image(Girar, 00, 00, 75, 75);
    translate(50, 50);
    rotate(girar*PI/100);
    image(Girar, 00, 00, 75, 75);
    popMatrix();  
}

void startGame() 
{
  linhas /= adm;
  colunas /= adm;
  
  preparaSprite();
  gridDeFundo();
  gridDeCima();
  
  player = grid[linhas/2][colunas/2];
  player.tipoDaCelula = "jogador";
  player.img = imgJogador;  
}

void preparaSprite() 
{
  imgGrama = loadImage("graminha.png");
  imgGrama.resize(30*adm, 30*adm);
  imgArvore = loadImage("arvorezinha.png");
  imgArvore.resize(30*adm, 30*adm);
  imgJogador = loadImage("bunequinho.png");
  imgJogador.resize(30*adm, 30*adm);
    
}

void gridDeFundo() 
{
  grid1 = new Cell[linhas][colunas];
  for (int i = 0; i < linhas; i++) {
    for (int j = 0; j < colunas; j++) {
      String tipoDaCelula = "grama" ;
      PImage img = tipoDaCelula.equals("grama")? imgGrama : imgArvore;
      grid1[i][j] = new Cell(tipoDaCelula, j * 30 * adm, i * 30 * adm, img, adm);
    }
  }  
}

void gridDeCima() 
{
    grid = new Cell[linhas][colunas];
  for (int i = 0; i < linhas; i++) {
    for (int j = 0; j < colunas; j++) {
      String tipoDaCelula = random(1) < 0.9? "grama" : "árvore";
      PImage img = tipoDaCelula.equals("grama")? imgGrama : imgArvore;
      grid[i][j] = new Cell(tipoDaCelula, j * 30 * adm, i * 30 * adm, img, adm);
    }
  }
}
 
 void timescore() 
 {
  int tempoDecorrido = millis() - tempoInicio;
  int tempoRestante = duracaoPartida - tempoDecorrido;
  int segundos = tempoRestante / 1000;
  imgPause = loadImage("pause.png");
  
  fill(255);
  rect(5, 44, 31, 31);
  image(imgPause, 6, 45, 30, 30);
  inventario = new Inventory(fundoInventario, vent, segundos, score);
  
  textAlign(LEFT);
  textSize(20);
  fill(255, 255, 255);
  rect(5, 10, 105, 30);
  fill(0);
  text("Tempo: " + segundos, 10, 30);
  
  textAlign(RIGHT);
  fill(255, 255, 255);
  rect( width - 85, 10, 80, 30);
  fill(0);
  text("Score: " + score, width - 10, 30);

  // Verificar fim do jogo
  if (tempoRestante <= 0) {
    gameOver();
  }  
 }
 
 void gameOver() {
  background(255);
  textAlign(CENTER);
  textSize(30);
  fill(0);
  text("Fim do jogo!", width/2, height/2 - 20);
  text("Seu score: " + score, width/2, height/2 + 20);
}

// Função para atualizar o score quando o jogador coleta um item
void coletarItem(int valorDoItem) {
  score += valorDoItem;
}
