// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'default_result.dart';

class ParabrisaResult extends StatefulWidget {
  final bool approved;
  final int lowerSpeed;
  final int higherSpeed;
  final int diference;
  final String reason;

  const ParabrisaResult({
    super.key, 
    required this.approved,
    required this.lowerSpeed,
    required this.higherSpeed,
    required this.diference,
    required this.reason,
  });

  @override
  State<ParabrisaResult> createState() => _ParabrisaResultState();
}

class _ParabrisaResultState extends State<ParabrisaResult> {
  TextStyle myStyle = 
  TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: Colors.white
  );

  TextAlign myTextAlign = TextAlign.left;
  
  @override
  Widget build(BuildContext context) => DefaultResult(
    approved: widget.approved,
    content: Column(
      children: [
        Text(
          widget.reason,
          style: myStyle,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20,),
        Text(
          'Menor velocidade  = ${widget.lowerSpeed} ciclos',
          style: myStyle,
          textAlign: myTextAlign,
        ),
        SizedBox(height: 10,),
        Text(
          'Maior velocidade  = ${widget.higherSpeed} ciclos',
          style: myStyle,
          textAlign: myTextAlign,
        ),
        SizedBox(height: 10,),
        Text(
          'Diferença de ciclos  = ${widget.diference}',
          style: myStyle,
          textAlign: myTextAlign,
        ),
      ],
    ),
  );
}