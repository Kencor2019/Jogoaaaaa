class Item{
  int valor;
  String img;
  PImage imagem;
  int tam;
  Item proximo;
  
  
  //tem que olhar o tamanho dos itens
  Item(int valor) {
    this.proximo = null;
    this.valor = valor;
    this.tam = 80; 
    if(valor == 1){
      this.imagem = loadImage("folha.png");
    }
    if(valor == 2){
      this.imagem = loadImage("verde.png");
    }
    if(valor == 3){
      this.imagem = loadImage("gato.png");
    }
    if(valor == 4){
      this.imagem = loadImage("ovo.png");
    }
    if(valor == 5){
      this.imagem = loadImage("abobora.png");
    }
    if(valor == 6){
      this.imagem = loadImage("papel.png");
    }
    if(valor == 7){
      this.imagem = loadImage("cachorro.png");
    }
    if(valor == 8){
      this.imagem = loadImage("robo.png");
    }
    if(valor == 9){
      this.imagem = loadImage("chapeu.png");
    }
    if(valor == 10){
      this.imagem = loadImage("ET.png");
    }
  }
  
  void mostra(int x, int y){
    image(imagem, x, y, tam, tam);
  }
}
