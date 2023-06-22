// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class DefaultResult extends StatefulWidget {
  final bool approved;
  final Widget content;

  const DefaultResult({super.key, required this.approved, required this.content});

  @override
  State<DefaultResult> createState() => _DefaultResultState();
}

class _DefaultResultState extends State<DefaultResult> {
  late Color color;
  late String textResult;

  @override
  void initState() {
    super.initState();
    color = widget.approved ? Colors.green : Colors.red;
    textResult  = widget.approved ? 'Aprovado' : 'Reprovado';
  } 

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Resultado'),
      centerTitle: true,
      backgroundColor: color,
    ),
    body: Container(
      width: double.infinity,
      height: double.infinity,
      color: color,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              textResult,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding:  const EdgeInsets.all(8.0),
              child: widget.content,
            ),
          ],
        ),
      ),
    ),
  );
}