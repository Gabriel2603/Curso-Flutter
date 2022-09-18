import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(const PerguntaApp());

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}

class _PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;
  var pontuacaoTotal = 0;

  final List<Map<String, Object>> perguntas = [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 9},
        {'texto': 'Vermelho', 'pontuacao': 10},
        {'texto': 'Azul', 'pontuacao': 8},
        {'texto': 'Amarelo', 'pontuacao': 5},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Leão', 'pontuacao': 2},
        {'texto': 'Cachorro', 'pontuacao': 5},
        {'texto': 'Gato', 'pontuacao': 10},
        {'texto': 'Calopsita', 'pontuacao': 6},
      ],
    },
    {
      'texto': 'Qual sua estação favorita?',
      'respostas': [
        {'texto': 'Outono', 'pontuacao': 7},
        {'texto': 'Inverno', 'pontuacao': 10},
        {'texto': 'Primavera', 'pontuacao': 9},
        {'texto': 'Verão', 'pontuacao': 5},
      ],
    },
  ];

  void responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        perguntaSelecionada++;
        pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      perguntaSelecionada = 0;
      pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: perguntas,
                perguntaSelecionada: perguntaSelecionada,
                responder: responder)
            : Resultado(pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}
