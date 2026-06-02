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

// Criamos um novo Widget para representar a tela onde o labirinto será desenhado.
class TelaDoJogo extends StatelessWidget {
  
  // A MATRIZ: Nossa planta baixa do labirinto.
  // 1 = Parede (Cinza)
  // 0 = Caminho Livre (Branco)
  // 2 = Ponto de Partida (Será o personagem na próxima aula)
  // 3 = Saída (Verde)
  final List<List<int>> mapaDoLabirinto = [
    [1, 1, 1, 1, 1, 1, 1],
    [1, 2, 0, 1, 0, 0, 1],
    [1, 1, 0, 1, 0, 1, 1],
    [1, 0, 0, 0, 0, 3, 1],
    [1, 1, 1, 1, 1, 1, 1],
  ];

  @override
  Widget build(BuildContext context) {
    // Descobrindo o tamanho do nosso labirinto
    int totalDeLinhas = mapaDoLabirinto.length;
    int totalDeColunas = mapaDoLabirinto[0].length;

    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        // AspectRatio mantém as proporções dos "quadradinhos" perfeitas na tela
        child: AspectRatio(
          aspectRatio: totalDeColunas / totalDeLinhas,
          
          // O GridView é a ferramenta que desenha nossa grade
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(), // Impede que o labirinto role como uma página de internet
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: totalDeColunas, // Quantas colunas teremos?
            ),
            itemCount: totalDeLinhas * totalDeColunas, // Total de blocos a desenhar
            itemBuilder: (context, index) {
              
              // Matemática simples para descobrir a posição X e Y de cada bloco
              int x = index % totalDeColunas;
              int y = index ~/ totalDeColunas;
              
              // Pegamos o número exato da nossa matriz (0, 1, 2 ou 3)
              int valorDoBloco = mapaDoLabirinto[y][x];
              
              // Definimos a cor com base no número
              Color corDoBloco = Colors.white; // Padrão é caminho (0)
              if (valorDoBloco == 1) corDoBloco = Colors.grey; // Parede
              if (valorDoBloco == 2) corDoBloco = Colors.blue; // Início
              if (valorDoBloco == 3) corDoBloco = Colors.green; // Fim

              // O Container é a nossa peça de LEGO visual (o bloquinho)
              return Container(
                margin: EdgeInsets.all(1), // Um pequeno espaço entre os blocos
                color: corDoBloco,
              );
            },
          ),
        ),
      ),
    );
  }
}
