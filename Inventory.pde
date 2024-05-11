class Inventory {
    Item cabeca;
    PImage fundo, vent, despause;
    public int score, restante, tempoDecorrido, soma, tempoAoPausar;
    int x, y1, y2;
    public int[] quant;

    Inventory(PImage fundo, PImage vent, int restante, int score, int tempoDecorrido, int soma) {
        this.despause = loadImage("despause.png");
        this.cabeca = null;
        this.fundo = fundo;
        this.vent = vent;
        this.tempoDecorrido = tempoDecorrido;
        this.restante = restante;
        this.score = score;
        this.soma = soma;
        this.y1 = 420;
        this.y2 = 500;
        this.x = 255;
        this.quant = new int[10];
    }

    void add(int valor) {
        Item novoItem = new Item(valor);
        if (cabeca == null) {
            cabeca = novoItem;
        } else {
            Item aux = cabeca;
            while (aux.proximo != null) {
                aux = aux.proximo;
            }
            aux.proximo = novoItem;
        }
    }

    int mostra() {
        // Desenha o fundo e outros elementos gráficos
        image(fundo, 0, 0, 900, 900);
        image(vent, 280, 10, 300, 400);
        textSize(90);
        fill(255);
        stroke(255, 0, 0);
        text("IN", 375, 330);
        text("ORY", 633, 330);

        // Desenha o painel
        fill(0);
        stroke(255);
        for (int i = 0; i < 5; i++) {
            rect(x + (80 * i), y2, 80, 80);
            rect(x + (80 * i), y1, 80, 80);
        }

        // Desenha o tempo decorrido e o score
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
        rect( width - 105, 10, 100, 30);
        fill(0);
        text("Score: " + score, width - 10, 30);

        tempoAoPausar = millis() - tempoDecorrido + soma;

        
        lista();

        if (mousePressed) {
            if (mouseX >= 5 && mouseX <= 35 && mouseY >= 45 && mouseY <= 75) {
                jogoPausado = false;
            }
        }
        return tempoAoPausar;
    }

    void lista() {
        Item atual = cabeca;
        int posicaoX = x + 2;
        int posicaoY = y1 +2;
       
        while (atual != null) {
              if (atual.valor == 1) {
                quant[atual.valor - 1]++;
            } else if (atual.valor == 2) {
                quant[atual.valor - 1]++;
            } else if (atual.valor == 3) {
                quant[atual.valor - 1]++;
            } else if (atual.valor == 4) {
                quant[atual.valor - 1]++;
            } else if (atual.valor == 5) {
                quant[atual.valor - 1]++;
            } else if (atual.valor == 6) {
                quant[atual.valor - 1]++;
            } else if (atual.valor == 7) {
                quant[atual.valor - 1]++;
            } else if (atual.valor == 8) {
                quant[atual.valor - 1]++;
            } else if (atual.valor == 9) {
                quant[atual.valor - 1]++;
            } else if (atual.valor == 10) {
                quant[atual.valor - 1]++;
            }
            println("ai" + quant[atual.valor - 1]);
            if(quant[atual.valor - 1] == 1){
              println(quant[atual.valor - 1]);
              desenha(atual.retornaImg(), posicaoX, posicaoY, atual, quant[atual.valor - 1]);
            }
            posicaoX += 80;
            if (posicaoX >= x + 5 * 80) {
                posicaoX = x + 2;
                posicaoY = y2 + 2;
            }
            atual = atual.proximo;
        }
    }

    void desenha(PImage imgItem, int x, int y, Item atual, int quant) {
      int x2 = 0, y3 = 0;
      if(quant == 1){
        image(imgItem, x, y, 70, 70);
        x2 = x;
        y3 = y;
      }else{
        image(imgItem, x2, y3, 70, 70);
      }
        if(mouseX >= x && mouseX <= x + 70 && mouseY>= y  && mouseY <= 70 +y){
          rect(x, y - 40, 79, 30);
          fill(255);
          textSize(10);
          text("VALOR: " + atual.valor, 86, 30);
        }
    }
}
