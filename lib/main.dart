// lib/main.dart
import 'package:flutter/material.dart'; 
import 'dart:async'; // 1. IMPORTANTE: Biblioteca para usar o Timer! 
import 'dart:math'; // 1. IMPORTANTE: Biblioteca para usar o Random()! 
import 'package:animated_text_kit/animated_text_kit.dart';//Para animação do dialogo
import 'dart:collection';


class TelaDeSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Fundo com gradiente de cozinha francesa — creme e marrom quente
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1F2937), // Marrom muito escuro no topo
              Color(0xFF1F2937), // Marrom escuro no meio
              Color(0xFF0d0500), // Quase preto na base
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Sprite do Remy grande na splash screen
              SizedBox(
                width: 120,
                height: 120,
                child: CustomPaint(painter: RemyPainter()),
              ),
              SizedBox(height: 20),

              // Título do jogo estilo placa de restaurante
              Text(
                "RATATOUILLE",
                style: TextStyle(
                  color: Color(0xFFf5c842), // Dourado estilo menu francês
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 6,
                  shadows: [
                    Shadow(color: Color(0xFFf5c842), blurRadius: 15),
                    Shadow(color: Colors.black, offset: Offset(2, 2), blurRadius: 0),
                  ],
                ),
              ),
              SizedBox(height: 8),

              // Subtítulo temático
              Text(
                "🐭 Ajude o Remy a escapar da cozinha!",
                style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12),

              // Nome do restaurante como decoração
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFf5c842), width: 1),
                ),
                child: Text(
                  "✦ GUSTEAU'S ✦",
                  style: TextStyle(
                    color: Color(0xFFf5c842),
                    fontSize: 12,
                    letterSpacing: 4,
                  ),
                ),
              ),
              SizedBox(height: 50),

              // Botão de jogar
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => TelaDoJogo()),
                  );
                },
                icon: Icon(Icons.restaurant, size: 24),
                label: Text("ENTRAR NA COZINHA", style: TextStyle(fontSize: 16)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFf5c842), // Dourado
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4), // Quase reto, estilo clássico
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MeuJogoApp());
}

//RATINHO
class RemyPainter extends CustomPainter {
  
  // Paleta de cores do Remy — rato azulado/cinza do filme
  static const Map<int, Color> paleta = {
    0: Color(0xFF645650),
    1: Color(0xFFF3E2D2),
    2: Color(0xFFE4867B),
    3: Color(0xFFA55652),
    4: Color(0xFF533432),
    5: Color(0xFFAF9A8F),
    6: Color(0xFFCFAC9C),
    7: Color(0xFF2D2625),
    8: Color(0xFFC96963),
    9: Color(0xFF883A38),
    10: Color(0xFF9E877A),
    11: Color(0xFF50423D),
    12: Color(0xFFDEC7B6),
    13: Color(0xFF95413E),
    14: Color.fromARGB(255, 31, 41, 55),
    15: Color(0xFF8C786D),
  };

  // Grade 8x8 — sprite do Remy visto de frente
  static const List<List<int>> sprite = [
    [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 5, 5, 6, 6, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 15, 1, 1, 1, 1, 1, 1, 10, 14, 5, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 1, 1, 1, 1, 1, 1, 1, 1, 6, 1, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 1, 1, 1, 6, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 12, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 12, 1, 14, 5, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 15, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 6, 1, 1, 6, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 6, 1, 1, 1, 1, 1, 6, 1, 1, 1, 1, 1, 1, 12, 5, 12, 1, 12, 5, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 5, 12, 1, 1, 1, 1, 6, 6, 1, 1, 1, 1, 6, 15, 5, 6, 12, 5, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 11, 15, 10, 5, 5, 0, 6, 6, 6, 6, 6, 0, 15, 15, 15, 5, 12, 12, 12, 10, 3, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 0, 15, 15, 15, 15, 15, 5, 0, 10, 6, 6, 5, 15, 5, 5, 6, 1, 1, 1, 1, 12, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 15, 15, 0, 9, 9, 4, 11, 15, 15, 15, 7, 3, 5, 6, 1, 12, 1, 1, 1, 1, 1, 1, 0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 15, 0, 3, 8, 3, 3, 3, 3, 4, 15, 15, 10, 15, 12, 12, 1, 1, 1, 1, 1, 1, 1, 1, 10, 15, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 0, 0, 8, 2, 2, 2, 2, 3, 8, 3, 4, 0, 15, 4, 12, 6, 1, 1, 12, 1, 1, 1, 1, 1, 12, 0, 0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 0, 2, 2, 2, 2, 2, 2, 2, 8, 3, 3, 11, 15, 10, 5, 12, 1, 1, 6, 6, 1, 1, 1, 1, 5, 0, 15, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 4, 0, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 4, 0, 15, 15, 15, 6, 1, 1, 1, 1, 1, 1, 1, 1, 4, 0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 8, 3, 9, 0, 15, 4, 6, 1, 1, 1, 1, 1, 1, 1, 1, 1, 7, 0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 0, 2, 2, 2, 2, 2, 2, 2, 2, 8, 3, 3, 4, 0, 15, 0, 5, 6, 6, 10, 0, 0, 0, 0, 0, 0, 4, 4, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 11, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 4, 0, 0, 15, 4, 4, 0, 15, 15, 15, 15, 15, 15, 5, 0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 4, 3, 2, 2, 2, 2, 2, 2, 3, 8, 3, 9, 4, 4, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 5, 3, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 0, 2, 2, 2, 2, 2, 2, 3, 8, 13, 4, 7, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 5, 11, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 4, 15, 2, 2, 2, 2, 2, 2, 8, 3, 4, 11, 0, 15, 15, 15, 15, 15, 15, 11, 15, 0, 15, 15, 15, 15, 15, 10, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 0, 3, 2, 2, 2, 2, 2, 2, 3, 9, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 5, 0, 3, 2, 2, 2, 2, 3, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 7, 0, 15, 15, 15, 15, 15, 15, 0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 7, 0, 0, 0, 0, 0, 0, 3, 15, 15, 15, 15, 15, 15, 15, 7, 0, 11, 0, 15, 15, 15, 15, 15, 0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 4, 0, 0, 15, 15, 15, 15, 15, 15, 15, 7, 7, 7, 7, 15, 15, 15, 15, 15, 15, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 7, 7, 7, 7, 15, 15, 15, 15, 15, 15, 0, 14, 14, 14, 10, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 4, 0, 0, 0, 15, 15, 15, 15, 15, 15, 0, 7, 0, 15, 15, 15, 15, 15, 15, 3, 3, 3, 1, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 1, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 5, 10, 5, 15, 15, 8, 6, 2, 5, 10, 1, 6, 6, 1, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 8, 3, 3, 8, 2, 8, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 10, 5, 5, 5, 4, 8, 9, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 3, 8, 6, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 4, 4, 7, 0, 0, 0, 0, 0, 15, 15, 15, 15, 15, 10, 5, 15, 15, 5, 5, 15, 4, 7, 14, 14, 14, 10, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 3, 6, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 4, 0, 15, 15, 15, 15, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 11, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 4, 8, 2, 14, 14, 14, 14, 14, 14, 14, 14, 0, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 11, 4, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 3, 2, 8, 14, 14, 14, 14, 14, 14, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 0, 0, 3, 0, 7, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 3, 2, 3, 14, 14, 14, 14, 14, 2, 3, 15, 0, 0, 0, 0, 0, 0, 15, 15, 15, 0, 10, 10, 15, 3, 4, 0, 14, 14, 6, 2, 3, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 3, 2, 2, 1, 14, 14, 14, 3, 2, 2, 3, 5, 7, 7, 0, 0, 0, 15, 15, 15, 15, 5, 5, 10, 10, 4, 0, 0, 4, 8, 13, 2, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 3, 8, 6, 3, 14, 14, 9, 2, 3, 4, 14, 0, 0, 0, 0, 0, 15, 15, 15, 5, 6, 6, 6, 5, 4, 0, 0, 0, 3, 9, 8, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 3, 3, 2, 2, 3, 9, 4, 4, 14, 0, 0, 0, 0, 3, 15, 15, 15, 15, 6, 6, 6, 6, 15, 11, 0, 0, 0, 0, 9, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 4, 3, 3, 3, 3, 9, 4, 4, 0, 0, 0, 15, 15, 15, 15, 15, 5, 6, 6, 6, 6, 0, 14, 7, 4, 4, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 4, 4, 4, 4, 0, 0, 0, 0, 15, 15, 15, 15, 0, 0, 4, 0, 6, 10, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 0, 5, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 4, 1, 14, 7, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 4, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 11, 11, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 9, 3, 3, 4, 7, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 1, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 5, 4, 14, 14, 14, 5, 11, 14, 14, 14, 14, 14, 14, 14, 8, 3, 9, 0, 4, 7, 0, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 5, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 11, 0, 11, 14, 14, 14, 14, 14, 8, 8, 9, 4, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 3, 15, 15, 15, 15, 15, 15, 0, 14, 14, 3, 6, 6, 9, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 1, 11, 7, 0, 14, 14, 14, 8, 8, 3, 9, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 15, 15, 5, 9, 2, 8, 3, 9, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 0, 5, 14, 14, 7, 7, 4, 14, 9, 9, 3, 9, 14, 14, 14, 4, 0, 0, 4, 7, 5, 5, 7, 4, 4, 11, 0, 0, 0, 0, 15, 0, 3, 2, 3, 3, 4, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 4, 11, 14, 14, 5, 7, 14, 14, 1, 8, 3, 14, 14, 14, 14, 14, 5, 5, 1, 14, 14, 14, 14, 14, 14, 14, 14, 0, 0, 0, 0, 3, 2, 8, 3, 3, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 4, 4, 1, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 5, 0, 3, 8, 13, 13, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 9, 3, 3, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 7, 7, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
  [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
];

  @override
  void paint(Canvas canvas, Size size) {
    int linhas = sprite.length;
    int colunas = sprite[0].length;

    double larguraPixel = size.width / colunas;
    double alturaPixel = size.height / linhas;

    for (int y = 0; y < linhas; y++) {
      for (int x = 0; x < colunas; x++) {
        int valor = sprite[y][x];
        if (valor == 0) continue; // Pula transparentes

        final paint = Paint()..color = paleta[valor]!;
        canvas.drawRect(
          Rect.fromLTWH(x * larguraPixel, y * alturaPixel, larguraPixel, alturaPixel),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

//Apiso
class PisoPremiumPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(
      0,
      0,
      size.width,
      size.height,
    );

    final paint = Paint()
      ..shader = LinearGradient(
        colors: [
              Color(0xFFFDF8E8),
              Color(0xFFF0E7C8),
              ],
        ).createShader(rect);

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        rect,
        Radius.circular(6),
      ),
      paint,
    );

    final linha = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..strokeWidth = 1;

    canvas.drawLine(
      Offset(0, size.height),
      Offset(size.width, size.height),
      linha,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

//PAREDE
class ParedePremiumPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final rect = Rect.fromLTWH(
      0,
      0,
      size.width,
      size.height,
    );

    final paint = Paint()
      ..shader = LinearGradient(
        colors: [
          Color(0xFF4B5563),
          Color(0xFF1F2937),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(rect);

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        rect,
        Radius.circular(10),
      ),
      paint,
    );

    canvas.drawShadow(
      Path()
        ..addRRect(
          RRect.fromRectAndRadius(
            rect,
            Radius.circular(10),
          ),
        ),
      Colors.black,
      8,
      false,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

//QUEIJO
class QueijoPainter extends CustomPainter {

  // Paleta do queijo
  static const Map<int, Color> paleta = {
    0: Colors.transparent,      // Fundo
    1: Color(0xFFF4D03F),       // Amarelo claro
    2: Color(0xFFE1B12C),       // Amarelo escuro (borda/sombra)
    3: Color(0xFFD4AC0D),       // Furos
  };

  // Sprite 8x8 - pedaço de queijo
  static const List<List<int>> sprite = [
    [0, 0, 0, 0, 2, 0, 0, 0],
    [0, 0, 0, 2, 1, 2, 0, 0],
    [0, 0, 2, 1, 1, 1, 2, 0],
    [0, 2, 1, 1, 3, 1, 1, 2],
    [2, 1, 1, 1, 1, 3, 1, 2],
    [2, 1, 3, 1, 1, 1, 1, 2],
    [2, 1, 1, 1, 3, 1, 1, 2],
    [0, 2, 2, 2, 2, 2, 2, 0],
  ];

  @override
  void paint(Canvas canvas, Size size) {
    int linhas = sprite.length;
    int colunas = sprite[0].length;

    double larguraPixel = size.width / colunas;
    double alturaPixel = size.height / linhas;

    for (int y = 0; y < linhas; y++) {
      for (int x = 0; x < colunas; x++) {
        int valor = sprite[y][x];

        if (valor == 0) continue;

        Paint paint = Paint();
          paint.color = paleta[valor]!;

        canvas.drawRect(
          Rect.fromLTWH(
            x * larguraPixel,
            y * alturaPixel,
            larguraPixel,
            alturaPixel,
          ),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

//RATOEIRA
class RatoeiraPainter extends CustomPainter {
  static const Map<int, Color> paleta = {
    1: Color(0xFFC0C0C0), // metal claro
    2: Color(0xFF808080), // metal escuro
    3: Color(0xFF404040), // sombra
    4: Color(0xFFB0B0B0), // mola
    5: Color(0xFFFFD54F), // queijo
  };

  static const List<List<int>> sprite = [

[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],

[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],

[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],

[0,0,0,0,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,0,0,0,0],

[0,0,0,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,0,0,0],

[0,0,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,0,0],

[0,0,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,0,0],

[0,0,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,0,0],

[0,0,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,0,0],

[0,0,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,0,0],

[0,0,2,1,1,1,1,1,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,1,1,1,1,1,1,2,0,0],

[0,0,2,1,1,1,1,1,4,0,4,0,4,0,4,0,4,0,4,0,4,0,4,0,4,0,4,1,1,1,1,1,1,2,0,0],

[0,0,2,1,1,1,1,1,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,1,1,1,1,1,1,2,0,0],

[0,0,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,0,0],

[0,0,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,5,5,5,1,1,1,1,1,1,1,1,1,1,1,1,2,0,0],

[0,0,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,5,5,5,5,5,1,1,1,1,1,1,1,1,1,1,1,2,0,0],

[0,0,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,5,5,5,1,1,1,1,1,1,1,1,1,1,1,1,2,0,0],

[0,0,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,0,0],

[0,0,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,0,0],

[0,0,0,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,0,0,0],

[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],

[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],

[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],

[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],

[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],

[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],

[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],

[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],

[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],

[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],

[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],

[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],

[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],

[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],

[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],

[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
];

  @override
  void paint(Canvas canvas, Size size) {
    final pixelW = size.width / sprite[0].length;
    final pixelH = size.height / sprite.length;

    for (int y = 0; y < sprite.length; y++) {
      for (int x = 0; x < sprite[y].length; x++) {
        final cor = sprite[y][x];
        if (cor == 0) continue;

        canvas.drawRect(
          Rect.fromLTWH(
            x * pixelW,
            y * pixelH,
            pixelW,
            pixelH,
          ),
          Paint()..color = paleta[cor]!,
        );
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

//TELA FINAL
class CheesePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final amarelo = Paint()
      ..color = const Color(0xFFFFD54F);

    final sombra = Paint()
      ..color = const Color(0xFFFFB300);

    // Corpo do queijo
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width * 0.1,
          size.height * 0.2,
          size.width * 0.8,
          size.height * 0.6,
        ),
        const Radius.circular(8),
      ),
      amarelo,
    );

    // Buracos
    canvas.drawCircle(
      Offset(size.width * 0.3, size.height * 0.4),
      size.width * 0.08,
      sombra,
    );

    canvas.drawCircle(
      Offset(size.width * 0.6, size.height * 0.55),
      size.width * 0.06,
      sombra,
    );

    canvas.drawCircle(
      Offset(size.width * 0.75, size.height * 0.35),
      size.width * 0.05,
      sombra,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}


class MeuJogoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'REMMY',
      home: TelaDeSplash(), // Agora chamamos uma tela separada para organizar melhor
    );
  }
}
//TELA DIALOGO INICIAL
class PaginaTutorial {
  final String titulo;
  final String texto;

  PaginaTutorial({
    required this.titulo,
    required this.texto,
  });
}
// Criamos um novo Widget para representar a tela onde o labirinto será desenhado.
class TelaDoJogo extends StatefulWidget {
  @override
  _TelaDoJogoState createState() => _TelaDoJogoState();
  }
  

// O "State" guarda as informações que mudam durante o jogo.
class _TelaDoJogoState extends State<TelaDoJogo> {
  //TUTORIAL
  bool mostrarTutorial = true;
  final List<PaginaTutorial> tutorial = [

  PaginaTutorial(
    titulo: "Olá Chef!",
    texto:
        "Eu sou o Remmy e preciso da sua ajuda para encontrar o queijo perdido.",
  ),

  PaginaTutorial(
    titulo: "Como Jogar",
    texto:
        "Use as setas para mover o Remmy pelos corredores do labirinto.",
  ),

  PaginaTutorial(
    titulo: "Cuidado!",
    texto:
        "As ratoeiras são perigosas. Se você pisar em uma delas, perderá a partida.",
  ),

  PaginaTutorial(
    titulo: "Objetivo",
    texto:
        "Encontre o queijo escondido e escape do labirinto para vencer.",
  ),

];
int paginaAtualTutorial = 0;
 // 2. A matriz agora é "late" (será criada quando o jogo iniciar) 
  late List<List<int>> mapaDoLabirinto;
    bool existeCaminhoAteSaida(
  List<List<int>> mapa,
  int inicioX,
  int inicioY,
  int fimX,
  int fimY,
) {
  Queue<List<int>> fila = Queue();

  List<List<bool>> visitado = List.generate(
    mapa.length,
    (_) => List.filled(mapa[0].length, false),
  );

  fila.add([inicioX, inicioY]);
  visitado[inicioY][inicioX] = true;

  List<List<int>> direcoes = [
    [0, -1],
    [1, 0],
    [0, 1],
    [-1, 0],
  ];

  while (fila.isNotEmpty) {
    final atual = fila.removeFirst();

    int x = atual[0];
    int y = atual[1];

    if (x == fimX && y == fimY) {
      return true;
    }

    for (var d in direcoes) {
      int nx = x + d[0];
      int ny = y + d[1];

      if (
          nx >= 0 &&
          ny >= 0 &&
          ny < mapa.length &&
          nx < mapa[0].length &&
          !visitado[ny][nx] &&
          mapa[ny][nx] != 1 &&
          mapa[ny][nx] != 9
      ) {
        visitado[ny][nx] = true;
        fila.add([nx, ny]);
      }
    }
  }

  return false;
}
bool temRatoeira(int x, int y) {
  return ratoeiras.any(
    (r) =>
        r.dx.toInt() == x &&
        r.dy.toInt() == y,
  );
}
List<Offset> ratoeiras = [];
List<Offset> caminhoSeguro = [];
  // 3. VARIÁVEIS DE PROGRESSÃO 
  int nivelAtual = 1; 
  int tamanhoAtualDaMatriz = 11; // Começamos com um mapa 13x13 (Use sempre números ímpares!) 

  int posicaoPersonagemX = 1;
  int posicaoPersonagemY = 1;
   // Guardamos o ponto de partida original para o botão Restart
  final int pontoDePartidaX = 1;
  final int pontoDePartidaY = 1;
  
  // O jogo só começa quando o aluno apertar o Start!
  bool jogoIniciado = false; 
  // 2. NOVAS VARIÁVEIS DE PONTUAÇÃO E TEMPO 
  int passosDados = 0; 
  int tempoDecorrido = 0; 
  Timer? cronometro; // O '?' significa que ele pode ser nulo antes do jogo começar   
// Dentro de _TelaDoJogoState, antes do gerarLabirinto()
Widget _itemHud(
  String titulo,
  String valor,
  IconData icone,
) {
  return Container(
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(0.35),
      borderRadius: BorderRadius.circular(18),
      border: Border.all(
        color: Colors.white24,
      ),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        Icon(
          icone,
          color: Color(0xFFFFD54A),
          size: 26,
        ),

        SizedBox(height: 4),

        Text(
          valor,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        Text(
          titulo,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    ),
  );
}
  @override 
  void initState() { 
  super.initState(); 
  WidgetsBinding.instance.addPostFrameCallback((_) {
    mostrarDialogTutorial();
  });
  // 4. Cria o primeiro mapa assim que o aplicativo abre 
  mapaDoLabirinto = gerarLabirinto(tamanhoAtualDaMatriz); 

}

//DIALOGO INICIAL
void mostrarDialogTutorial() {
  paginaAtualTutorial = 0;

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return StatefulBuilder(
        builder: (context, atualizarDialog) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: SizedBox(
            width: 350,
            height: 300,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(35),
                border: Border.all(
                  color: const Color(0xFFF5C842),
                  width: 3,
                ),
              ),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Expanded(
                    child: AnimatedTextKit(
                    key: ValueKey(paginaAtualTutorial),
                      animatedTexts: [
                        TypewriterAnimatedText(
                          tutorial[paginaAtualTutorial].texto,

                          speed: Duration(
                            milliseconds: 35,
                          ),

                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            height: 1.5,
                          ),
                        ),
                      ],

                      totalRepeatCount: 1,
                      displayFullTextOnTap: true,
                      stopPauseOnTap: true,
                    ),
                  ),

                  SizedBox(height: 20),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(
                        width: 90,
                        height: 90,
                        child: CustomPaint(
                          painter: RemyPainter(),
                        ),
                      ),

                      SizedBox(width: 15),
                    ],
                  ),

                  SizedBox(height: 20),

                  Text(
                    "${paginaAtualTutorial + 1}/${tutorial.length}",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),

                  SizedBox(height: 10),

                  ElevatedButton(
                    onPressed: () {

                      if (paginaAtualTutorial <
                          tutorial.length - 1) {

                        atualizarDialog(() {
                          paginaAtualTutorial++;
                        });

                      } else {

                        Navigator.pop(context);

                      }
                    },
                    child: Text(
                      paginaAtualTutorial ==
                              tutorial.length - 1
                          ? "JOGAR"
                          : "PRÓXIMO",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}

  // 5. O GERADOR PROCEDURAL DE LABIRINTOS 
  List<List<int>> gerarLabirinto(int tamanho) { 
    // Cria uma matriz totalmente preenchida com Paredes (1) 
    List<List<int>> novoMapa = List.generate(tamanho, (_) => List.filled(tamanho, 1)); 
    Random aleatorio = Random(); 

    ratoeiras.clear();
 
    // Função interna recursiva (O nosso "Tatu Escavador") 
    void cavarCaminho(int x, int y) { 
      novoMapa[y][x] = 0; // Transforma a parede em caminho 
 
      // Tenta ir para: Cima, Direita, Baixo, Esquerda (Pulando 2 blocos) 
      List<List<int>> direcoes = [[0, -2], [2, 0], [0, 2], [-2, 0]]; 
      direcoes.shuffle(aleatorio); // Embaralha para o labirinto ser aleatório! 
 
      for (var direcao in direcoes) { 
        int proximoX = x + direcao[0]; 
        int proximoY = y + direcao[1]; 
        if (temRatoeira(proximoY, proximoY)) {
          continue;
        }
 
        // Verifica se o próximo pulo está dentro do mapa e se é uma parede virgem 
        if (proximoY > 0 && proximoY < tamanho - 1 && 
            proximoX > 0 && proximoX < tamanho - 1 && 
            novoMapa[proximoY][proximoX] == 1) { 
           
          // Derruba a parede que ficou no meio do caminho 
          novoMapa[y + (direcao[1] ~/ 2)][x + (direcao[0] ~/ 2)] = 0; 
           
          // O Tatu pula para a nova posição e continua cavando 
          cavarCaminho(proximoX, proximoY); 
        } 
      } 
    } 
 
    // Começa a cavar a partir da posição (1, 1) 
    cavarCaminho(1, 1); 
 
    // Define Início e Fim 
    novoMapa[1][1] = 2; // Ponto de Partida 
    novoMapa[tamanho - 2][tamanho - 2] = 3; // Saída sempre no canto inferior direito 
    
 
    // Garante que a saída não fique bloqueada por acaso 
    novoMapa[tamanho - 2][tamanho - 3] = 0; 
    novoMapa[tamanho - 3][tamanho - 2] = 0; 

    // Adiciona ratoeiras aleatórias
    int quantidadeDeRatoeiras = tamanho ~/ 2;
    for (int i = 0; i < quantidadeDeRatoeiras; i++) {

    int x;
    int y;

    do {
      x = aleatorio.nextInt(tamanho);
      y = aleatorio.nextInt(tamanho);
    } while (
        novoMapa[y][x] != 0 ||
        (x == 1 && y == 1) ||
        (x == tamanho - 2 && y == tamanho - 2)
    );

    // tenta colocar
    novoMapa[y][x] = 9;

    bool caminhoLivre = existeCaminhoAteSaida(
      novoMapa,
      1,
      1,
      tamanho - 2,
      tamanho - 2,
    );

    if (caminhoLivre) {
      ratoeiras.add(
        Offset(
          x.toDouble(),
          y.toDouble(),
        ),
      );
    } else {
      novoMapa[y][x] = 0;
    }
  }
return novoMapa; 
  }


  void moverPersonagem(DragUpdateDetails detalhes) {
    int movimentoX = 0;
    int movimentoY = 0;


    // Lógica para descobrir se o deslize foi na horizontal ou vertical
    if (detalhes.delta.dx.abs() > detalhes.delta.dy.abs()) {
      // Horizontal: Direita (+1) ou Esquerda (-1)
      movimentoX = detalhes.delta.dx > 0 ? 1 : -1;
    } else {
      // Vertical: Baixo (+1) ou Cima (-1)
      movimentoY = detalhes.delta.dy > 0 ? 1 : -1;
    }

    // Calculamos qual seria a PRÓXIMA posição do personagem
    int proximoX = posicaoPersonagemX + movimentoX;
    int proximoY = posicaoPersonagemY + movimentoY;

    // 1. PREVENÇÃO DE ERROS: O personagem não pode sair da tela.
    if (proximoY >= 0 && proximoY < mapaDoLabirinto.length && 
        proximoX >= 0 && proximoX < mapaDoLabirinto[0].length) {
      
      // 2. LÓGICA DE COLISÃO: Verificamos se a próxima posição NÃO é uma parede (1).
      if (mapaDoLabirinto[proximoY][proximoX] != 1) { 
        
        // O setState é o comando que avisa o Flutter: "Os dados mudaram, redesenhe a tela!"
        setState(() {
          posicaoPersonagemX = proximoX;
          posicaoPersonagemY = proximoY;
        });

      } else {
        // 3. FEEDBACK DO SISTEMA: Se for parede, avisamos o jogador!
        ScaffoldMessenger.of(context).clearSnackBars(); // Limpa avisos antigos
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Ops! Bateu na parede."),
            duration: Duration(milliseconds: 500), // Some rápido da tela
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }    
  }

      // 3. ATUALIZANDO AS FUNÇÕES DE CONTROLE 
  void iniciarJogo() { 
    setState(() { 
      jogoIniciado = true; 
    }); 
     
    // Inicia um relógio que roda a cada 1 segundo 
    cronometro = Timer.periodic(Duration(seconds: 1), (timer) { 
      setState(() { 
        tempoDecorrido++; 
      }); 
    }); 
  } 
 
  void reiniciarJogo() { 
    cronometro?.cancel(); // Para o relógio se ele estiver rodando 
     
    setState(() { 
      posicaoPersonagemX = 1; // Volta pro início 
      posicaoPersonagemY = 1; 
      jogoIniciado = false; 
      passosDados = 0; // Zera a pontuação 
      tempoDecorrido = 0; // Zera o tempo 
    }); 
  } 
  
 
    // 7. A NOVA LÓGICA DE VITÓRIA E PROGRESSÃO 
  void venceuJogo() { 
    cronometro?.cancel();  
    jogoIniciado = false;  
     
    showDialog( 
      context: context, 
      barrierDismissible: false, // Impede de fechar clicando fora 
      builder: (context) => AlertDialog( 
        title: Text("🧀 Nível $nivelAtual Concluído!"), 
        content: Text("Tempo: $tempoDecorrido segundos\nPassos: $passosDados"), 
        actions: [ 
          TextButton( 
            onPressed: () { 
              Navigator.pop(context); // Fecha o aviso 
              avancarFase(); // Chama a função de criar a nova fase 
            }, 
            child: Text("Próximo Nível ➡"), 
          ) 
        ], 
      ), 
    ); 
  } 

 //Tela final
 void mostrarTelaFinal() {
    
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        backgroundColor: const Color(0xFF1F2937),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

            SizedBox(
              width: 180,
              height: 180,
              child: CustomPaint(
                painter: RemyPainter(),
              ),
            ),

            const SizedBox(height: 10),

            // PILHA DE QUEIJOS
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: List.generate(
                12,
                (_) => SizedBox(
                  width: 40,
                  height: 40,
                  child: CustomPaint(
                    painter: CheesePainter(),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            const Text(
            "🏆 PARABÉNS!",
            style: TextStyle(
              color: Color(0xFFFFD54F),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

            const SizedBox(height: 10),

              const Text(
                "Remmy encontrou todos os queijos perdidos da cozinha!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 10),

              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFD54F),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Column(
                  children: [

                    Text(
                      "🏆 TÍTULO DESBLOQUEADO",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 8),

                    Text(
                      "CHEF RATATOUILLE",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),


              const Text(
                "Você concluiu as 25 fases do jogo.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {

                  Navigator.pop(context);

                  setState(() {
                    nivelAtual = 1;
                    tamanhoAtualDaMatriz = 11;

                    mapaDoLabirinto =
                        gerarLabirinto(tamanhoAtualDaMatriz);

                    posicaoPersonagemX = 1;
                    posicaoPersonagemY = 1;

                    passosDados = 0;
                    tempoDecorrido = 0;

                    jogoIniciado = false;
                  });
                },
                child: const Text("Jogar Novamente"),
              ),
            ],
          ),
        ),
      );
    },
  );
}
  void avancarFase() {

  // Se terminou a fase 25, mostra a tela final
  if (nivelAtual >= 25) {
    mostrarTelaFinal();
    return;
  }

  setState(() {
    nivelAtual++;

    // A cada 5 níveis aumenta o tamanho do labirinto
    if (nivelAtual % 5 == 0) {
      tamanhoAtualDaMatriz += 2;
    }

    mapaDoLabirinto = gerarLabirinto(tamanhoAtualDaMatriz);

    posicaoPersonagemX = 1;
    posicaoPersonagemY = 1;

    passosDados = 0;
    tempoDecorrido = 0;
  });
}
      void mostrarGameOver() {

        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) {
            return AlertDialog(
              backgroundColor: Color(0xFF1E293B),

              title: Text(
                "💀 Remmy foi capturado!",
                style: TextStyle(color: Colors.white),
              ),

              content: Text(
                "Você caiu em uma ratoeira.",
                style: TextStyle(color: Colors.white70),
              ),

              actions: [

                ElevatedButton(
                  onPressed: () {

                    Navigator.pop(context);

                    reiniciarJogo();

                  },
                  child: Text("Tentar novamente"),
                ),
              ],
            );
          },
        );
      }

    void moverComBotao(int movimentoX, int movimentoY) { 
    if (jogoIniciado == false) return;  
 
    int proximoX = posicaoPersonagemX + movimentoX; 
    int proximoY = posicaoPersonagemY + movimentoY; 

    bool caiuNaRatoeira = ratoeiras.any(
        (r) =>
            r.dx.toInt() == proximoX &&
            r.dy.toInt() == proximoY,
      );

      if (caiuNaRatoeira) {
        mostrarGameOver();
        return;
      }
    
 
    if (proximoY >= 0 && proximoY < mapaDoLabirinto.length &&  
        proximoX >= 0 && proximoX < mapaDoLabirinto[0].length) { 
       
      if (mapaDoLabirinto[proximoY][proximoX] != 1) { 
        setState(() { 
          posicaoPersonagemX = proximoX; 
          posicaoPersonagemY = proximoY; 
          passosDados++; // Soma +1 na pontuação de passos 
        }); 
 
        // 4. VERIFICAÇÃO DE VITÓRIA: Chegou no 3? 
        if (mapaDoLabirinto[proximoY][proximoX] == 3) { 
          venceuJogo(); 
        } 
 
      } else { 
        ScaffoldMessenger.of(context).clearSnackBars(); 
        ScaffoldMessenger.of(context).showSnackBar( 
          SnackBar(content: Text("Bateu na parede!"), duration: Duration(milliseconds: 500)), 
        ); 
      } 
      
    } 
  }  
  
    @override
  Widget build(BuildContext context) {
    int totalDeLinhas = mapaDoLabirinto.length;
    int totalDeColunas = mapaDoLabirinto[0].length;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF111827),
              Color(0xFF0F172A),
          ],
        ),
      ),
    child: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          // HUD TEMÁTICO
          Container(
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _itemHud(
                  "Tempo",
                  "$tempoDecorrido",
                  Icons.timer,
                ),
                _itemHud(
                  "Passos",
                  "$passosDados",
                  Icons.directions_walk,
                ),
                _itemHud(
                  "Nível",
                  "$nivelAtual",
                  Icons.star,
                ),
              ],
            ),
          ),

          // LABIRINTO
          Expanded(
          child: Padding(
            padding: EdgeInsets.all(8),
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
                  int valor = mapaDoLabirinto[y][x];
                  bool temRatoeira = ratoeiras.any(
                    (r) =>
                        r.dx.toInt() == x &&
                        r.dy.toInt() == y,
                  );
                  bool isPersonagem = (x == posicaoPersonagemX && y == posicaoPersonagemY);

                  // REMY — aparece sobre qualquer célula
                  if (isPersonagem) {
                    return Container(
                      margin: EdgeInsets.all(1),
                      child: CustomPaint(
                        painter: ParedePremiumPainter(), // Piso embaixo do Remy
                        child: CustomPaint(painter: RemyPainter()), // Remy por cima
                      ),
                    );
                  }
                  if (temRatoeira) {
                      return Container(
                        margin: EdgeInsets.all(1),
                        child: CustomPaint(
                          painter: PisoPremiumPainter(),
                          child: CustomPaint(
                            painter: RatoeiraPainter(),
                          ),
                        ),
                      );
                    }
                  // PAREDE → Azulejo da cozinha
                  if (valor == 1) {
                    return Container(
                      margin: EdgeInsets.all(1),
                      child: CustomPaint(painter: ParedePremiumPainter()),
                    );
                  }

                  // CAMINHO → Piso de madeira
                  if (valor == 0) {
                    return Container(
                      margin: EdgeInsets.all(1),
                      child: CustomPaint(painter: PisoPremiumPainter()),
                    );
                  }
                  if (valor == 4) {
                      return Container(
                        margin: EdgeInsets.all(1),
                        child: CustomPaint(
                          painter: PisoPremiumPainter(),
                          child: CustomPaint(
                            painter: RatoeiraPainter(),
                          ),
                        ),
                      );
                    }
            
                  // INÍCIO → Piso com bandeira
                  if (valor == 2) {
                    return Container(
                      margin: EdgeInsets.all(1),
                      child: CustomPaint(
                        painter: PisoPremiumPainter(),
                        child: Center(
                          child: Text("🐭", style: TextStyle(fontSize: 8)),
                        ),
                      ),
                    );
                  }
          
                  // SAÍDA → Prato de Ratatouille
                  return Container(
                    margin: EdgeInsets.all(1),
                    child: CustomPaint(
                      painter: PisoPremiumPainter(),
                      child: CustomPaint(painter: QueijoPainter()),
                    ),
                  );
                },
              ),
            ),
          ),
          ),

          // BOTÕES START E RESTART
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: jogoIniciado ? null : iniciarJogo,
                icon: Icon(Icons.restaurant),
                label: Text("COZINHAR"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFf5c842), // Dourado
                  foregroundColor: Colors.black,
                ),
              ),
              SizedBox(width: 20),
              ElevatedButton.icon(
                onPressed: reiniciarJogo,
                icon: Icon(Icons.refresh),
                label: Text("FUGIR"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),

          // D-PAD
          Column(
            children: [
              IconButton(
                iconSize: 50,
                color: Color(0xFFf5c842), // Dourado temático
                icon: Icon(Icons.arrow_circle_up),
                onPressed: () => moverComBotao(0, -1),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 50,
                    color: Color(0xFFf5c842),
                    icon: Icon(Icons.arrow_circle_left),
                    onPressed: () => moverComBotao(-1, 0),
                  ),
                  SizedBox(width: 50),
                  IconButton(
                    iconSize: 50,
                    color: Color(0xFFf5c842),
                    icon: Icon(Icons.arrow_circle_right),
                    onPressed: () => moverComBotao(1, 0),
                  ),
                ],
              ),
              IconButton(
                iconSize: 50,
                color: Color(0xFFf5c842),
                icon: Icon(Icons.arrow_circle_down),
                onPressed: () => moverComBotao(0, 1),
              ),
            ],
          ),
        ],
      ),
    ),
  ),
);
  }

  
}

