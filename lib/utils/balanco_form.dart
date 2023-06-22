// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

import '../models/balanco_form_data.dart';

class BalancoForm extends StatefulWidget {
  final void Function(BalancoFormData) onSubmit;

  const BalancoForm({super.key, required this.onSubmit});

  @override
  State<BalancoForm> createState() => _BalancoFormState();
}

class _BalancoFormState extends State<BalancoForm> {
  final totalLengthController = TextEditingController();
  final wheelbaseController = TextEditingController();
  final rearBalanceController = TextEditingController();
  final bodyworkLengthController = TextEditingController();
  final widthController = TextEditingController();

  String? totalLengthError;
  String? wheelbaseError;
  String? rearBalanceError;
  String? bodyworkLengthError;
  String? widthError;

  @override
  void dispose() {
    totalLengthController.dispose();
    wheelbaseController.dispose();
    rearBalanceController.dispose();
    bodyworkLengthController.dispose();
    widthController.dispose();
    super.dispose();
  }

  _submitForm() {
    final totalLength = double.tryParse(totalLengthController.text) ?? 0.0;
    final wheelbase = double.tryParse(wheelbaseController.text) ?? 0.0;
    final rearBalance = double.tryParse(rearBalanceController.text) ?? 0.0;
    final bodyworkLength = double.tryParse(bodyworkLengthController.text) ?? 0.0;
    final width = double.tryParse(widthController.text) ?? 0.0;

    setState(() {
      totalLengthError = _validateValue(totalLength);
      wheelbaseError = _validateValue(wheelbase);
      rearBalanceError = _validateValue(rearBalance);
      bodyworkLengthError = _validateValue(bodyworkLength);
      widthError = _validateValue(width);
    });

    if (
      totalLength  <= 0.0 || 
      wheelbase <= 0.0 ||
      rearBalance <= 0.0 ||
      bodyworkLength <= 0.0 || 
      width <= 0.0
    ) {
      return;
    }

    final formData = BalancoFormData(
      totalLength: totalLength,
      wheelbase: wheelbase,
      rearBalance: rearBalance,
      bodyworkLength: bodyworkLength,
      width: width,
    );


    widget.onSubmit(formData);
  }

  
  String? _validateValue(double value) {
    if (value <= 0.0) {
      return 'Valor inválido';
    }
    return null;
  }

  TextInputType myKeyboardType = const TextInputType.numberWithOptions(decimal: true);

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
                  controller: totalLengthController,
                  keyboardType: myKeyboardType,
                  onSubmitted: (_) => _submitForm(),
                  decoration: InputDecoration(
                    labelText: 'Comprimento Total',
                    hintText: 'ex: 10000',
                    errorText: totalLengthError,
                  ),
                ),
                TextField(
                  controller: wheelbaseController,
                  keyboardType: myKeyboardType,
                  onSubmitted: (_) => _submitForm(),
                  decoration: InputDecoration(
                    labelText: 'Entre eixos',
                    hintText: 'ex:5000',
                    errorText: wheelbaseError,
                  ),
                ),
                TextField(
                  controller: rearBalanceController,
                  keyboardType: myKeyboardType,
                  onSubmitted: (_) => _submitForm(),
                  decoration: InputDecoration(
                    labelText: 'Balanço traseiro',
                    hintText: 'ex: 2600',
                    errorText: rearBalanceError,
                  ),
                ),
                TextField(
                  controller: bodyworkLengthController,
                  keyboardType: myKeyboardType,
                  onSubmitted: (_) => _submitForm(),
                  decoration: InputDecoration(
                    labelText: 'Comprimento da carroceria',
                    hintText: 'ex: 8500',
                    errorText: bodyworkLengthError,
                  ),
                ),
                TextField(
                  controller: widthController,
                  keyboardType: myKeyboardType,
                  onSubmitted: (_) => _submitForm(),
                  decoration: InputDecoration(
                    labelText: 'Largura',
                    hintText: 'ex: 2600',
                    errorText: widthError,
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
                      )
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )
    ],
  );
}