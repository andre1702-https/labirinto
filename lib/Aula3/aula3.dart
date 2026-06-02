// lib/main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(MeuJogoApp());
}

class MeuJogoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MazeRunner',
      home: TelaDoJogo(), // Agora chamamos uma tela separada para organizar melhor
    );
  }
}

// Transformamos o StatelessWidget em StatefulWidget para o jogo ter "memória".
class TelaDoJogo extends StatefulWidget {
  @override
  _TelaDoJogoState createState() => _TelaDoJogoState();
}

// O "State" guarda as informações que mudam durante o jogo.
class _TelaDoJogoState extends State<TelaDoJogo> {
  
  // A MATRIZ do labirinto (igual à aula 2).
  final List<List<int>> mapaDoLabirinto = [
    [1, 1, 1, 1, 1, 1, 1],
    [1, 0, 0, 1, 0, 0, 1],
    [1, 1, 0, 1, 0, 1, 1],
    [1, 0, 0, 0, 0, 3, 1],
    [1, 1, 1, 1, 1, 1, 1],
  ];

  // VARIÁVEIS DE ESTADO: Aqui guardamos a posição atual do personagem.
  // Começamos na coluna 1 (X) e linha 1 (Y), que é um espaço vazio (0) na matriz.
  int posicaoPersonagemX = 1;
  int posicaoPersonagemY = 1;

  @override
  Widget build(BuildContext context) {
    int totalDeLinhas = mapaDoLabirinto.length;
    int totalDeColunas = mapaDoLabirinto[0].length;

    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        
        // 1. GESTURE DETECTOR: O "ouvido" do nosso aplicativo para toques na tela.
        child: GestureDetector(
          // onPanUpdate detecta quando o usuário arrasta o dedo pela tela.
          onPanUpdate: (detalhesDoToque) {
            // Deixaremos vazio por enquanto. A mágica acontece na Aula 4!
            print("Usuário deslizou o dedo na tela!"); 
          },
          
          child: AspectRatio(
            aspectRatio: totalDeColunas / totalDeLinhas,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: totalDeColunas,
              ),
              itemCount: totalDeLinhas * totalDeColunas,
              itemBuilder: (context, index) {
                int x = index % totalDeColunas;
                int y = index ~/ totalDeColunas;
                
                int valorDoBloco = mapaDoLabirinto[y][x];
                Color corDoBloco = Colors.white; 
                
                if (valorDoBloco == 1) corDoBloco = Colors.grey; 
                if (valorDoBloco == 3) corDoBloco = Colors.green; 

                // 2. DESENHANDO O PERSONAGEM: 
                // Se a posição atual do bloco (x, y) for igual à posição do nosso personagem...
                if (x == posicaoPersonagemX && y == posicaoPersonagemY) {
                  corDoBloco = Colors.blue; // ...pintamos esse bloco de azul!
                }

                return Container(
                  margin: EdgeInsets.all(1),
                  color: corDoBloco,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

