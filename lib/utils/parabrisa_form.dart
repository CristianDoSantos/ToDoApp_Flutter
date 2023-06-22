import 'package:flutter/material.dart';

class ParabrisaForm extends StatefulWidget {
  final void Function(double, double) onSubmit;

  const ParabrisaForm({super.key, required this.onSubmit});

  @override
  State<ParabrisaForm> createState() => _ParabrisaFormState();
}

class _ParabrisaFormState extends State<ParabrisaForm> {
  final menorVelocidadeController = TextEditingController();
  final maiorVelocidadeController = TextEditingController();
  

  _submitForm() {
    final menorVelocidade = double.tryParse(menorVelocidadeController.text) ?? 0.0;
    final maiorVelocidade = double.tryParse(maiorVelocidadeController.text) ?? 0.0;

    if ( menorVelocidade <= 0.0 || maiorVelocidade <= 0.0) {
      return;
    }

    widget.onSubmit(menorVelocidade, maiorVelocidade);
  }

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  controller: menorVelocidadeController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  onSubmitted: (_) => _submitForm,
                  decoration: const InputDecoration(
                    labelText: 'Menor Velocidade'
                  ),
                ),
                TextField(
                  controller: maiorVelocidadeController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  onSubmitted: (_) => _submitForm,
                  decoration: const InputDecoration(
                    labelText: 'Maior  Velocidade'
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: _submitForm, 
                      child: const Text(
                        'Calcular',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 206, 46),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}