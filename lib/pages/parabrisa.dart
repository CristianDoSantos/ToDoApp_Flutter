// ignore_for_file: unused_element, unused_local_variable, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../utils/parabrida_result.dart';
import '../utils/parabrisa_form.dart';

class Parabrisa extends StatefulWidget {
  const Parabrisa({super.key});

  @override
  State<Parabrisa> createState() => _ParabrisaState();
}

class _ParabrisaState extends State<Parabrisa> {
  int umMinuto = 60;
  int diferenca = 15;

  _calculate(double menorVelocidade, double maiorVelocidade) {
    FocusScope.of(context).unfocus();
    
    int primeiroCicloQuantidade = (umMinuto / menorVelocidade).round();
    int segundoCicloQuantidade = (umMinuto / maiorVelocidade).round();
    int calculo = (primeiroCicloQuantidade - segundoCicloQuantidade).abs();
    bool result = false;
    String motivo = '';

    if (menorVelocidade < maiorVelocidade) {
      result = false;
      motivo = 'Verifique se os campos foram preenchidos na ordem correta!';
      primeiroCicloQuantidade = 0;
      segundoCicloQuantidade = 0;
      calculo = 0;
    }

    if (calculo < diferenca && menorVelocidade > maiorVelocidade) {
      result = false;
      motivo = 'Diferença entre as velocidades menor que 15 ciclos';
    }

    if (primeiroCicloQuantidade < 20 && menorVelocidade > maiorVelocidade) {
      result = false;
      motivo = 'A quantidade de cilcos na menor velocidade deve ser maior que 20 ciclos por minuto';
    }

    if (calculo > diferenca && primeiroCicloQuantidade >= 20 && menorVelocidade > maiorVelocidade) {
      result = true;
    }

    Navigator.push(
      context,
      PageTransition(
        child: ParabrisaResult(
          approved: result, 
          lowerSpeed: primeiroCicloQuantidade,
          higherSpeed: segundoCicloQuantidade,
          diference: calculo,
          reason: motivo,
        ),
        type: PageTransitionType.bottomToTop,
      )
    );
  }

  @override
  Widget build(
    BuildContext context) => GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
      appBar: AppBar(
        title: const Text('Cálculo limpador de para-brisas'),
        centerTitle: true,
      ),
      body: ParabrisaForm(onSubmit: _calculate),
      ),
    );
}

