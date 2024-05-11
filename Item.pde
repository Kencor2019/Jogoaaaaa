class Item {
    int valor;
    PImage imagem;
    Item proximo;

    Item(int valor) {
        this.valor = valor;
        this.proximo = null;
        
        if (valor == 1) {
            this.imagem = loadImage("folha.png");
        } else if (valor == 2) {
            this.imagem = loadImage("verde.png");
        } else if (valor == 3) {
            this.imagem = loadImage("gato.png");
        } else if (valor == 4) {
            this.imagem = loadImage("ovo.png");
        } else if (valor == 5) {
            this.imagem = loadImage("abobora.png");
        } else if (valor == 6) {
            this.imagem = loadImage("papel.png");
        } else if (valor == 7) {
            this.imagem = loadImage("cachorro.png");
        } else if (valor == 8) {
            this.imagem = loadImage("robo.png");
        } else if (valor == 9) {
            this.imagem = loadImage("chapeu.png");
        } else if (valor == 10) {
            this.imagem = loadImage("ET.png");
        }
    }

    PImage retornaImg() {
        return imagem;
    }
}
