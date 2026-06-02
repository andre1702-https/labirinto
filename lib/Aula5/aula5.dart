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
class TelaDoJogo extends StatefulWidget {
  @override
  _TelaDoJogoState createState() => _TelaDoJogoState();
  }
  
// O "State" guarda as informações que mudam durante o jogo.
class _TelaDoJogoState extends State<TelaDoJogo> {

 // lib/main.dart (Atualizando as variáveis em _TelaDoJogoState)

  // ... (manter a variável mapaDoLabirinto) ...

  // Guardamos o ponto de partida original para o botão Restart
  final int pontoDePartidaX = 1;
  final int pontoDePartidaY = 1;
  
  // O jogo só começa quando o aluno apertar o Start!
  bool jogoIniciado = false;   

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

    // Função do botão START
  void iniciarJogo() {
    setState(() {
      jogoIniciado = true;
    });
  }

  // Função do botão RESTART
  void reiniciarJogo() {
    setState(() {
      posicaoPersonagemX = pontoDePartidaX;
      posicaoPersonagemY = pontoDePartidaY;
      jogoIniciado = false; // Pausa o jogo até apertar Start novamente
    });
  }

  // Nova Lógica de Movimento por Botões
  void moverComBotao(int movimentoX, int movimentoY) {
    // Regra número 1: Só anda se o jogo estiver iniciado!
    if (jogoIniciado == false) return; 

    int proximoX = posicaoPersonagemX + movimentoX;
    int proximoY = posicaoPersonagemY + movimentoY;

    // Verifica os limites da matriz e se NÃO é parede (1)
    if (proximoY >= 0 && proximoY < mapaDoLabirinto.length && 
        proximoX >= 0 && proximoX < mapaDoLabirinto[0].length) {
      
      if (mapaDoLabirinto[proximoY][proximoX] != 1) {
        setState(() {
          posicaoPersonagemX = proximoX;
          posicaoPersonagemY = proximoY;
        });
      } else {
        // Feedback visual de parede (mantido da aula anterior)
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Bateu na parede!"), duration: Duration(milliseconds: 500)),
        );
      }
    }
  }




 
  

  
  // A MATRIZ do labirinto (igual à aula 2).
  final List<List<int>> mapaDoLabirinto = [
    [1, 1, 1, 1, 1, 1, 1],
    [1, 0, 0, 1, 0, 0, 1],
    [1, 1, 0, 1, 0, 1, 1],
    [1, 0, 0, 0, 0, 3, 1],
    [1, 1, 1, 1, 1, 1, 1],
  ];

  int posicaoPersonagemX = 1;
  int posicaoPersonagemY = 1;  
  

    @override
  Widget build(BuildContext context) {
    int totalDeLinhas = mapaDoLabirinto.length;
    int totalDeColunas = mapaDoLabirinto[0].length;

    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea( // Protege contra o "notch" da câmera do celular
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Espalha os itens na tela
          children: [
            
            // 1. O LABIRINTO (Nossa grade antiga, agora menorzinha na parte de cima)
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
                    Color cor = Colors.white; 
                    if (valor == 1) cor = const Color.fromARGB(255, 7, 3, 253); 
                    if (valor == 3) cor = Colors.green; 
                    if (x == posicaoPersonagemX && y == posicaoPersonagemY) cor = Colors.blue; 

                    return Container(margin: EdgeInsets.all(1), color: cor);
                  },
                ),
              ),
            ),

            // 2. PAINEL DE CONTROLE: START E RESTART
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: jogoIniciado ? null : iniciarJogo, // Desabilita se já começou
                  icon: Icon(Icons.play_arrow),
                  label: Text("START"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
                SizedBox(width: 20), // Espacinho entre os botões
                ElevatedButton.icon(
                  onPressed: reiniciarJogo,
                  icon: Icon(Icons.refresh),
                  label: Text("RESTART"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                ),
              ],
            ),

            // 3. O D-PAD (Controles Direcionais)
            // Desenhamos uma cruz usando uma Coluna e Linhas
            Column(
              children: [
                // Botão CIMA (Y - 1)
                IconButton(
                  iconSize: 50,
                  color: Colors.white,
                  icon: Icon(Icons.arrow_circle_up),
                  onPressed: () => moverComBotao(0, -1),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Botão ESQUERDA (X - 1)
                    IconButton(
                      iconSize: 50,
                      color: Colors.white,
                      icon: Icon(Icons.arrow_circle_left),
                      onPressed: () => moverComBotao(-1, 0),
                    ),
                    SizedBox(width: 50), // Espaço do meio da cruz
                    // Botão DIREITA (X + 1)
                    IconButton(
                      iconSize: 50,
                      color: Colors.white,
                      icon: Icon(Icons.arrow_circle_right),
                      onPressed: () => moverComBotao(1, 0),
                    ),
                  ],
                ),
                // Botão BAIXO (Y + 1)
                IconButton(
                  iconSize: 50,
                  color: Colors.white,
                  icon: Icon(Icons.arrow_circle_down),
                  onPressed: () => moverComBotao(0, 1),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }

  
}

