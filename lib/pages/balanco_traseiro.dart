// ignore_for_file: unused_element, non_constant_identifier_names, unused_local_variable

import 'package:calculauto/utils/balanco_form.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../models/balanco_form_data.dart';
import '../utils/balanco_result.dart';

class BalancoTraseiro extends StatefulWidget {
  const BalancoTraseiro({super.key});

  @override
  State<BalancoTraseiro> createState() => _BalancoTraseiroState();
}

class _BalancoTraseiroState extends State<BalancoTraseiro> {
  double limit = 3500;

  _calculate(BalancoFormData entry) {
    FocusScope.of(context).unfocus();

    double rearBalanceCalculation = entry.wheelbase * 0.6;
    double frontBalance = entry.totalLength - entry.wheelbase - entry.rearBalance;
    int sideBands = ((entry.bodyworkLength * .33) / 300).round();
    int rearBands = ((entry.width * .8) / 300).round();

    bool result = false;
    // int maxLimit;
    double? couldIncrease;
    double? heaveToDecrease;

    if (rearBalanceCalculation > limit) {
      rearBalanceCalculation = limit;
    }

    if (entry.rearBalance > rearBalanceCalculation) {
      result = false;
      heaveToDecrease = rearBalanceCalculation - entry.rearBalance;
    } else {
      result = true;
      if (entry.rearBalance < rearBalanceCalculation) {
        couldIncrease = rearBalanceCalculation - entry.rearBalance;
      }
    }

    Navigator.push(
      context,
      PageTransition(
        child: BalancoResult(
          approved: result,
          frontBalance: frontBalance,
          maxLimit: rearBalanceCalculation,
          rearBand: rearBands,
          sideBand: sideBands,
          couldIncrease: couldIncrease,
          heaveToDecrease: heaveToDecrease,
        ),
        type: PageTransitionType.bottomToTop
      )
    );
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () {
      FocusScope.of(context).unfocus();
    },
    child: Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cálculo do balanço traseiro'
        ),
        centerTitle: true,
      ),
      body: BalancoForm(onSubmit: _calculate),
    ),
  );
}