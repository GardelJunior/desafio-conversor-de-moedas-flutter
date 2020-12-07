import 'package:converson_moedas_curso/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class HomeController {
  List<CurrencyModel> currencies;
  CurrencyModel fromCurrency;
  CurrencyModel toCurrency;

  final TextEditingController toText;
  final TextEditingController fromText;

  HomeController({this.toText, this.fromText}) {
    currencies = CurrencyModel.getCurrencies();
    fromCurrency = currencies[0];
    toCurrency = currencies[1];
  }

  void convert() {
    String text = fromText.text;
    double value = double.tryParse(text.replaceAll(",", ".")) ?? 1.0;

    double resultValue = 0;

    if (toCurrency.name == 'Real') {
      resultValue = value * fromCurrency.real;
    } else if (toCurrency.name == 'Dolar') {
      resultValue = value * fromCurrency.dollar;
    } else if (toCurrency.name == 'Euro') {
      resultValue = value * fromCurrency.euro;
    } else if (toCurrency.name == 'Bitcoin') {
      resultValue = value * fromCurrency.bitcoin;
    }

    toText.text = resultValue.toStringAsFixed(2);
  }
}
