// lib/main.dart
import 'package:flutter/material.dart'; 
import 'dart:async'; // 1. IMPORTANTE: Biblioteca para usar o Timer! 
import 'dart:math'; // 1. IMPORTANTE: Biblioteca para usar o Random()! 


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
              Color(0xFF1a0a00), // Marrom muito escuro no topo
              Color(0xFF3d1a00), // Marrom escuro no meio
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
                  color: Colors.white70,
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
    14: Color(0xFFFEFEFE),
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

//AZULEJO
class AzulejoPainter extends CustomPainter {

  // Paleta de azulejos brancos com detalhes azuis — cozinha francesa
  static const Map<int, Color> paleta = {
    0: Color(0xFFe8f4f8), // Branco azulado — face principal do azulejo
    1: Color(0xFF2a5a8a), // Azul escuro — fresta entre azulejos
    2: Color(0xFFb8d8e8), // Azul muito claro — face iluminada do azulejo
    3: Color(0xFF7aaac0), // Azul médio — detalhe decorativo central
    4: Color(0xFFd0eaf5), // Branco quase puro — brilho do canto superior
  };

  // Grade 8x8 — dois azulejos quadrados com fresta entre eles
  static const List<List<int>> sprite = [
    [1, 1, 1, 1, 1, 1, 1, 1], // Fresta horizontal superior
    [1, 4, 0, 0, 1, 4, 0, 1], // Topo dos azulejos com brilho
    [1, 0, 3, 0, 1, 0, 3, 1], // Detalhe azul no centro de cada azulejo
    [1, 0, 0, 2, 1, 0, 0, 1], // Interior com sombra sutil
    [1, 1, 1, 1, 1, 1, 1, 1], // Fresta horizontal do meio
    [1, 4, 0, 0, 1, 4, 0, 1], // Segundo par de azulejos
    [1, 0, 3, 0, 1, 0, 3, 1], // Detalhe central
    [1, 0, 0, 2, 1, 0, 0, 1], // Sombra inferior
  ];

  @override
  void paint(Canvas canvas, Size size) {
    int linhas = sprite.length;
    int colunas = sprite[0].length;
    double larguraPixel = size.width / colunas;
    double alturaPixel = size.height / linhas;

    for (int y = 0; y < linhas; y++) {
      for (int x = 0; x < colunas; x++) {
        final paint = Paint()..color = paleta[sprite[y][x]]!;
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

//PISO DE MADEIRA
class PisoMadeiraPainter extends CustomPainter {

  // Paleta de tons de madeira — piso rústico de cozinha francesa
  static const Map<int, Color> paleta = {
    0: Color(0xFF8B5E3C), // Marrom médio — madeira base
    1: Color(0xFFa67c52), // Marrom claro — tábua iluminada
    2: Color(0xFF6b4226), // Marrom escuro — sombra entre tábuas
    3: Color(0xFFc49a6c), // Bege — brilho da madeira
    4: Color(0xFF5a3520), // Marrom bem escuro — fresta entre tábuas
  };

  // Grade 8x8 — tábuas de madeira horizontais com frestas
  static const List<List<int>> sprite = [
    [3, 1, 1, 1, 1, 1, 1, 3], // Tábua superior com brilho nos cantos
    [1, 0, 0, 0, 0, 0, 0, 1], // Interior da tábua superior
    [1, 0, 0, 0, 0, 0, 0, 2], // Fim da tábua com sombra à direita
    [4, 4, 4, 4, 4, 4, 4, 4], // Fresta entre as tábuas
    [3, 1, 1, 1, 1, 1, 1, 3], // Segunda tábua com brilho
    [1, 0, 0, 0, 0, 0, 0, 1], // Interior da segunda tábua
    [1, 0, 0, 0, 0, 0, 0, 2], // Fim com sombra
    [4, 4, 4, 4, 4, 4, 4, 4], // Fresta inferior
  ];

  @override
  void paint(Canvas canvas, Size size) {
    int linhas = sprite.length;
    int colunas = sprite[0].length;
    double larguraPixel = size.width / colunas;
    double alturaPixel = size.height / linhas;

    for (int y = 0; y < linhas; y++) {
      for (int x = 0; x < colunas; x++) {
        final paint = Paint()..color = paleta[sprite[y][x]]!;
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

//PRATO
class PratoSaidaPainter extends CustomPainter {

  // Paleta do prato de ratatouille — legumes coloridos em prato branco
  static const Map<int, Color> paleta = {
    0: Colors.transparent,      // Fundo vazio
    1: Color(0xFFf5f0e8),       // Branco creme — prato
    2: Color(0xFFd4c9b0),       // Bege escuro — borda do prato
    3: Color(0xFFc0392b),       // Vermelho — tomate/abobrinha vermelha
    4: Color(0xFF27ae60),       // Verde — abobrinha verde
    5: Color(0xFFf39c12),       // Laranja — abóbora/cenoura
    6: Color(0xFF8e44ad),       // Roxo — berinjela
    7: Color(0xFFf5c842),       // Dourado — molho
  };

  // Grade 8x8 — prato com fatias coloridas de legumes em espiral
  static const List<List<int>> sprite = [
    [0, 0, 2, 2, 2, 2, 0, 0], // Borda superior do prato
    [0, 2, 1, 1, 1, 1, 2, 0], // Interior do prato
    [2, 1, 3, 4, 3, 4, 1, 2], // Fatias vermelha e verde alternadas
    [2, 1, 7, 5, 6, 7, 1, 2], // Molho dourado, laranja e berinjela
    [2, 1, 6, 7, 5, 3, 1, 2], // Mais fatias coloridas
    [2, 1, 4, 3, 4, 6, 1, 2], // Verde e vermelho
    [0, 2, 1, 7, 7, 1, 2, 0], // Base do prato com molho
    [0, 0, 2, 2, 2, 2, 0, 0], // Borda inferior
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

//HUD
class PainelHudPainter extends CustomPainter {
  static const Map<int, Color> paleta = {
    0: Color(0xFF1a0a00),
    1: Color(0xFF3d1a00),
    2: Color(0xFF5a2e00),
    3: Color(0xFF2a1000),
    4: Color(0xFF4a2200),
    5: Color(0xFFf5c842), // Dourado — destaque estilo restaurante
  };

  static const List<List<int>> sprite = [
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 5, 2, 2, 2, 2, 3, 0],
    [0, 2, 4, 4, 4, 4, 3, 0],
    [0, 3, 3, 3, 3, 3, 0, 0],
  ];

  @override
  void paint(Canvas canvas, Size size) {
    int linhas = sprite.length;
    int colunas = sprite[0].length;
    double larguraPixel = size.width / colunas;
    double alturaPixel = size.height / linhas;

    for (int y = 0; y < linhas; y++) {
      for (int x = 0; x < colunas; x++) {
        final paint = Paint()..color = paleta[sprite[y][x]]!;
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

class MeuJogoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MazeRunner',
      home: TelaDeSplash(), // Agora chamamos uma tela separada para organizar melhor
    );
  }
}

// Criamos um novo Widget para representar a tela onde o labirinto será desenhado.
class TelaDoJogo extends StatefulWidget {
  @override
  _TelaDoJogoState createState() => _TelaDoJogoState();
  }
  
// O "State" guarda as informações que mudam durante o jogo.
class _TelaDoJogoState extends State<TelaDoJogo> {
 // 2. A matriz agora é "late" (será criada quando o jogo iniciar) 
  late List<List<int>> mapaDoLabirinto; 
  // 3. VARIÁVEIS DE PROGRESSÃO 
  int nivelAtual = 1; 
  int tamanhoAtualDaMatriz = 7; // Começamos com um mapa 7x7 (Use sempre números ímpares!) 

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
Widget _itemHud(String rotulo, String valor, Color cor) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        rotulo,
        style: TextStyle(
          color: Colors.white54,
          fontSize: 10,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),
      ),
      SizedBox(height: 2),
      Text(
        valor,
        style: TextStyle(
          color: cor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          shadows: [Shadow(color: Colors.black, offset: Offset(1, 1), blurRadius: 0)],
        ),
      ),
    ],
  );
}
  @override 
  void initState() { 
  super.initState(); 
  // 4. Cria o primeiro mapa assim que o aplicativo abre 
  mapaDoLabirinto = gerarLabirinto(tamanhoAtualDaMatriz); 
}


  // 5. O GERADOR PROCEDURAL DE LABIRINTOS 
  List<List<int>> gerarLabirinto(int tamanho) { 
    // Cria uma matriz totalmente preenchida com Paredes (1) 
    List<List<int>> novoMapa = List.generate(tamanho, (_) => List.filled(tamanho, 1)); 
    Random aleatorio = Random(); 
 
    // Função interna recursiva (O nosso "Tatu Escavador") 
    void cavarCaminho(int x, int y) { 
      novoMapa[y][x] = 0; // Transforma a parede em caminho 
 
      // Tenta ir para: Cima, Direita, Baixo, Esquerda (Pulando 2 blocos) 
      List<List<int>> direcoes = [[0, -2], [2, 0], [0, 2], [-2, 0]]; 
      direcoes.shuffle(aleatorio); // Embaralha para o labirinto ser aleatório! 
 
      for (var direcao in direcoes) { 
        int proximoX = x + direcao[0]; 
        int proximoY = y + direcao[1]; 
 
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
        title: Text("🎉 Nível $nivelAtual Concluído!"), 
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
 
  void avancarFase() { 
    setState(() { 
      nivelAtual++; 
       
      // A cada 5 níveis, aumentamos o labirinto em 2 blocos (para continuar ímpar) 
      if (nivelAtual % 5 == 0) { 
        tamanhoAtualDaMatriz += 2; 
      } 
 
      // Gera o novo mapa com o tamanho atualizado 
mapaDoLabirinto = gerarLabirinto(tamanhoAtualDaMatriz); 
// Reseta as posições para o início 
posicaoPersonagemX = 1; 
posicaoPersonagemY = 1; 
passosDados = 0;  
tempoDecorrido = 0;  
}); 
}

    void moverComBotao(int movimentoX, int movimentoY) { 
    if (jogoIniciado == false) return;  
 
    int proximoX = posicaoPersonagemX + movimentoX; 
    int proximoY = posicaoPersonagemY + movimentoY; 
 
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
          Color(0xFF1a0a00), // Marrom escuro — topo
          Color(0xFF3d1a00), // Marrom médio — centro
          Color(0xFF0d0500), // Quase preto — base
        ],
      ),
    ),
    child: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          // HUD TEMÁTICO
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            height: 64,
            width: double.infinity,
            child: CustomPaint(
              painter: PainelHudPainter(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _itemHud("RECEITA", "$nivelAtual", Color(0xFFf5c842)),
                    Container(width: 1, height: 40, color: Color(0xFFf5c842)),
                    _itemHud("TEMPO", "${tempoDecorrido}s", Colors.white),
                    Container(width: 1, height: 40, color: Color(0xFFf5c842)),
                    _itemHud("PASSOS", "$passosDados", Colors.white),
                  ],
                ),
              ),
            ),
          ),

          // LABIRINTO
          Padding(
            padding: const EdgeInsets.all(8.0),
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
                  bool isPersonagem = (x == posicaoPersonagemX && y == posicaoPersonagemY);

                  // REMY — aparece sobre qualquer célula
                  if (isPersonagem) {
                    return Container(
                      margin: EdgeInsets.all(1),
                      child: CustomPaint(
                        painter: PisoMadeiraPainter(), // Piso embaixo do Remy
                        child: CustomPaint(painter: RemyPainter()), // Remy por cima
                      ),
                    );
                  }

                  // PAREDE → Azulejo da cozinha
                  if (valor == 1) {
                    return Container(
                      margin: EdgeInsets.all(1),
                      child: CustomPaint(painter: AzulejoPainter()),
                    );
                  }

                  // CAMINHO → Piso de madeira
                  if (valor == 0) {
                    return Container(
                      margin: EdgeInsets.all(1),
                      child: CustomPaint(painter: PisoMadeiraPainter()),
                    );
                  }

                  // INÍCIO → Piso com bandeira
                  if (valor == 2) {
                    return Container(
                      margin: EdgeInsets.all(1),
                      child: CustomPaint(
                        painter: PisoMadeiraPainter(),
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
                      painter: PisoMadeiraPainter(),
                      child: CustomPaint(painter: PratoSaidaPainter()),
                    ),
                  );
                },
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

