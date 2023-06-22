// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'default_result.dart';

class BalancoResult extends StatefulWidget {
  final bool approved;
  final double maxLimit;
  final double? couldIncrease;
  final double frontBalance;
  final int sideBand;
  final int rearBand;
  final double? heaveToDecrease;

  const BalancoResult({super.key, 
    required this.approved, 
    required this.maxLimit, 
    this.couldIncrease, 
    required this.frontBalance, 
    required this.sideBand, 
    required this.rearBand, 
    this.heaveToDecrease,    
  });

  @override
  State<BalancoResult> createState() => _BalancoResultState();
}

class _BalancoResultState extends State<BalancoResult> {
  TextStyle myStyle = 
  TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    fontSize: 14,
    color: Colors.white
  );

  TextAlign myTextAlign = TextAlign.center;

  @override
  Widget build(BuildContext context) => DefaultResult(
    approved: widget.approved,
    content: Column(
      children: [
        Text(
          !widget.approved 
          ? 'Você tera que reduzir o balanço traseiro em ${widget.heaveToDecrease?.toInt().abs()}mm'
          : '',
          style: myStyle,
          textAlign: myTextAlign,
        ),
        Text(
          'O limite do balanço traseiro é de ${widget.maxLimit.toInt()}mm.',
          style: myStyle,
          textAlign: myTextAlign,
        ),
        SizedBox(height: 10),
        Text(
          widget.couldIncrease != null && widget.couldIncrease! > 0.0 
          ? 'É possível aumentar o balanço traseiro em ${widget.couldIncrease?.toInt()}mm.'
          : '' ,
          style: myStyle,
          textAlign: myTextAlign,
        ),
        SizedBox(height: 10),
        Text(
          'O balanço dianteiro é de ${widget.frontBalance.toInt()}mm.',
          style: myStyle,
          textAlign: myTextAlign,
        ),
        SizedBox(height: 10),
        Text(
          'O número de faixas nas laterais é de ${widget.sideBand} faixas.',
          style: myStyle,
          textAlign: myTextAlign,
        ),
        SizedBox(height: 10),
        Text(
          'O número de faixas na traseira é de ${widget.rearBand} faixas.',
          style: myStyle,
          textAlign: myTextAlign,
        ),
        SizedBox(height: 10),
      ],
    ),
  );
}