class Item{
  int valor;
  String nome;
  String img;
  PImage imagem;
  int tam;
  Item proximo;
  

  Item(int valor) {
    this.proximo = null;
    this.valor = valor;
    this.tam = 60; 
    if(valor == 1){
      this.nome = "Cereja";
      this.imagem = loadImage("Item1.png");
    }
    if(valor == 2){
      this.nome = "Laranja";
      this.imagem = loadImage("Item2.png");
    }
    if(valor == 3){
      this.nome = "Morango";
      this.imagem = loadImage("Item3.png");
    }
    if(valor == 4){
      this.nome = "Maçã";
      this.imagem = loadImage("Item4.png");
    }
    if(valor == 5){
      this.nome = "Limão";
      this.imagem = loadImage("Item6.png");
    }
    if(valor == 6){
      this.nome = "Espada";
      this.imagem = loadImage("Item9.png");
    }
    if(valor == 7){
      this.nome = "Anel";
      this.imagem = loadImage("Item10.png");
    }
    if(valor == 8){
      this.nome = "Flecha";
      this.imagem = loadImage("Item11.png");
    }
    if(valor == 9){
      this.nome = "Arma";
      this.imagem = loadImage("Item12.png");
    }
    if(valor == 10){
      this.nome = "Bala";
      this.imagem = loadImage("Item13.png");
    }
  }
  
  void mostra(int x, int y){
    image(imagem, x, y, tam, tam);
  }
}
