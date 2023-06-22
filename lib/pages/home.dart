// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:calculauto/utils/drawer.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final String _texto =
      'O CalculAuto é um aplicativo desenvolvido para auxilixar os inspetores à realizar os mais diversos cálculos durante a inspeção. Se você tiver alguma ideia de algum outro cáculo ou de como melhorar o aplicatico, pode me contatar através do link no menu lateral.'; 

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Calculauto'),
        ),
        drawer: MyNavigationDrawer(),
        body: Padding(
            padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_texto,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20),
                    textAlign: TextAlign.center),
                Image.asset('assets/images/logo.png'),
              ],
            )),
      );
}