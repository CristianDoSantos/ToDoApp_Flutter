// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../pages/balanco_traseiro.dart';
import '../pages/home.dart';
import '../pages/parabrisa.dart';


class MyNavigationDrawer extends StatefulWidget {
  const MyNavigationDrawer({super.key});

  @override
  State<MyNavigationDrawer> createState() => _MyNavigationDrawerState();
}

class _MyNavigationDrawerState extends State<MyNavigationDrawer> {
  Color myColor = const Color.fromARGB(255, 255, 206, 46);

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );

  Widget buildHeader(BuildContext context) => Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 100,
              alignment: Alignment.center,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'CalculAuto',
              style: TextStyle(
                  color: myColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins'),
            ),
            SizedBox(height: 20)
          ],
        ),
      );

  Widget buildMenuItems(BuildContext context) => Container(
        padding: EdgeInsets.all(24),
        child: Wrap(runSpacing: 10, children: [
          ListTile(
            leading: Icon(Icons.house_outlined,
                color: myColor),
            title: Text('Pagina Inicial',
                style: TextStyle(
                  color: myColor,
                  fontWeight: FontWeight.bold,
                )),
            onTap: () =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => HomePage(),
            )),
          ),
          ListTile(
            leading: Icon(Icons.fire_truck,
                color: myColor),
            title: Text('Balanço Traseiro e Faixas',
                style: TextStyle(
                  color: myColor,
                  fontWeight: FontWeight.bold,
                )),
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => BalancoTraseiro())),
          ),
          ListTile(
            leading: Icon(Icons.timer_outlined,
                color: myColor),
            title: Text('Limpador de Para-brisas',
                style: TextStyle(
                  color: myColor,
                  fontWeight: FontWeight.bold,
                )),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (contexxt) => Parabrisa(),
            )),
          ),
          Divider(color: myColor),
          ListTile(
              leading: Icon(Icons.email_outlined,
                  color: myColor),
              title: Text('Contato',
                  style: TextStyle(
                    color: myColor,
                    fontWeight: FontWeight.bold,
                  )),
              onTap: () async {
                String? encodeQueryParameters(Map<String, String> params) {
                  return params.entries
                      .map((MapEntry<String, String> e) =>
                          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                      .join('&');
                }

                final Uri params = Uri(
                  scheme: 'mailto',
                  path: 'cristiandossantos71@gmail.com',
                  query: encodeQueryParameters(<String, String>{
                    'subject': 'CalculAuto',
                  }),
                );
                final Uri url = params;
                launchUrl(url);
              }
            ),
        ]),
      );
}