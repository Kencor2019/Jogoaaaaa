class Inventory{
  Item cabeca;
  PImage fundo, vent, despause;
  int tempoDecorrido, score;
  boolean jogoPausado;
  
  public Inventory(PImage fundo, PImage vent, int tempoDecorrido, int score){
    this.despause = loadImage("despause.png");
    this.cabeca = null;
    this.fundo = fundo;
    this.vent = vent;
    this.tempoDecorrido = tempoDecorrido;
    this.score = score;
    this.jogoPausado = true;
  }
  
  public void add(int valor){
    Item novoItem = new Item(valor);
    if(cabeca == null){
     cabeca = novoItem; 
    } else {
      Item aux = cabeca;
      while(aux.proximo != null){
        aux = aux.proximo;
      }
      aux.proximo = novoItem;
    }
  }
  
  public void mostra(){
    //fundo
     size(900, 900);
     image(fundo, 0, 0, 900, 900);
     
    //título
     image(vent, 250, 10, 300, 400);
     textSize(90);
     fill(255);
     text("IN", 350, 330);
     text("ÁRIO", 640, 330);
     
     //painel
     fill(0);
     stroke(255);
     //primeira
     rect(255, 500, 80, 80);
     rect(335, 500, 80, 80);
     rect(415, 500, 80, 80);
     rect(495, 500, 80, 80);
     rect(575, 500, 80, 80);
     //segunda
     rect(255, 420, 80, 80);
     rect(335, 420, 80, 80);
     rect(415, 420, 80, 80);
     rect(495, 420, 80, 80);
     rect(575, 420, 80, 80);
     
     //tempo decorrido
    fill(255);
    rect(5, 44, 31, 31);
    image(despause, 6, 45, 30, 30);
    
    textAlign(LEFT);
    textSize(20);
    fill(255, 255, 255);
    rect(5, 10, 105, 30);
    fill(0);
    text("Tempo: " + tempoDecorrido, 10, 30);
    
    textAlign(RIGHT);
    fill(255, 255, 255);
    rect( width - 85, 10, 80, 30);
    fill(0);
    text("Score: " + score, width - 10, 30);
    despause();
  }
  
  public void desenha(){
    

  }
  
  void despause(){
    if(mousePressed && mouseX >= 5 && mouseX <= 35 && mouseY >= 45 && mouseY <= 75){
      jogoPausado = false; 
    }
  }
}
