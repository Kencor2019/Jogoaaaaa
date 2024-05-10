class Inventory{
  Item cabeca;
  PImage fundo, vent, despause;
  int score, restante, tempoDecorrido, soma, tempoAoPausar;
  boolean jogoPausado;
  
  public Inventory(PImage fundo, PImage vent, int restante , int score, int tempoDecorrido, int soma){
    this.despause = loadImage("despause.png");
    this.cabeca = null;
    this.fundo = fundo;
    this.vent = vent;
    this.tempoDecorrido = tempoDecorrido;
    this.restante = restante;
    this.score = score;
    this.jogoPausado = true;
    this.soma = soma;
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
  
  public int mostra(){
    //fundo
     image(fundo, 0, 0, 900, 900);
     
    //título
     image(vent, 280, 10, 300, 400);
     textSize(90);
     fill(255);
     stroke(255, 0, 0);
     text("IN", 375, 330);
     text("ORY", 633, 330);
     
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
    text("Tempo: " + restante, 10, 30);
    
    textAlign(RIGHT);
    fill(255, 255, 255);
    rect( width - 85, 10, 80, 30);
    fill(0);
    text("Score: " + score, width - 10, 30);
    
    tempoAoPausar = millis() - tempoDecorrido + soma;
    
    if(mousePressed){
      if(mouseX >= 5 && mouseX <= 35 && mouseY >= 45 && mouseY <= 75){
        jogoPausado = false; 
      }
    }
    return tempoAoPausar;
  }
  
  public void desenha(){
    

  }
}
