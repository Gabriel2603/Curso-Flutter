import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  late final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 17) {
      return 'Parabéns!';
    } else if (pontuacao < 20) {
      return 'Você é bom!';
    } else if (pontuacao < 25) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(fontSize: 36, color: Color(-1)),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
          ),
          onPressed: quandoReiniciarQuestionario,
          child: const Text(
            'Reiniciar',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
