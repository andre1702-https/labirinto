// lib/main.dart
import 'package:flutter/material.dart'; 
import 'dart:async'; // 1. IMPORTANTE: Biblioteca para usar o Timer! 
import 'dart:math'; // 1. IMPORTANTE: Biblioteca para usar o Random()! 

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
            // 6. ATUALIZANDO O HUD 
            Padding( 
              padding: const EdgeInsets.symmetric(vertical: 10.0), 
              child: Row( 
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                children: [ 
                  Text("🏆 Nível: $nivelAtual", style: TextStyle(color: Colors.amber, fontSize: 18)), 
                  Text("⏱ Tempo: $tempoDecorrido s", style: TextStyle(color: Colors.white, fontSize: 18)), 
                  Text("👟 Passos: $passosDados", style: TextStyle(color: Colors.white, fontSize: 18)), 
                ], 
              ), 
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

