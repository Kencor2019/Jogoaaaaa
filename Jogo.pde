PImage imgGrama, imgArvore, imgJogador, imgItem;

int adm = 2;
int linhas = 30; 
int colunas = 30;
Cell [][] grid;
Cell [][] grid1;
Cell player;

int tempoInicio;
int duracaoPartida = 120000; // 2 minutos em milissegundos
int score = 0;

void setup() {
  frameRate(80);
  size(900, 900);
  
  linhas /= adm;
  colunas /= adm;
  
  imgGrama = loadImage("graminha.png");
  imgGrama.resize(30*adm, 30*adm);
  imgArvore = loadImage("arvorezinha.png");
  imgArvore.resize(30*adm, 30*adm);
  imgJogador = loadImage("bunequinho.png");
  imgJogador.resize(30*adm, 30*adm);
  
  grid1 = new Cell[linhas][colunas];
  for (int i = 0; i < linhas; i++) {
    for (int j = 0; j < colunas; j++) {
      String tipoDaCelula = "grama" ;
      PImage img = tipoDaCelula.equals("grama")? imgGrama : imgArvore;
      grid1[i][j] = new Cell(tipoDaCelula, j * 30 * adm, i * 30 * adm, img, adm);
    }
  }
  grid = new Cell[linhas][colunas];
  for (int i = 0; i < linhas; i++) {
    for (int j = 0; j < colunas; j++) {
      String tipoDaCelula = random(1) < 0.9? "grama" : "árvore";
      PImage img = tipoDaCelula.equals("grama")? imgGrama : imgArvore;
      grid[i][j] = new Cell(tipoDaCelula, j * 30 * adm, i * 30 * adm, img, adm);
    }
  }
  player = grid[linhas/2][colunas/2];
  player.tipoDaCelula = "jogador";
  player.img = imgJogador;
}

void draw(){
  background(255);
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
  timescore();
}

void keyPressed(){
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
 
 void timescore() 
 {
   int tempoDecorrido = millis() - tempoInicio;
  int tempoRestante = duracaoPartida - tempoDecorrido;
  int segundos = tempoRestante / 1000;
  
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
