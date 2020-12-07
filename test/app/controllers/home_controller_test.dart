import 'package:converson_moedas_curso/app/controllers/home_controller.dart';
import 'package:converson_moedas_curso/app/models/currency_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final toText = TextEditingController();
  final fromText = TextEditingController();
  final homeController = HomeController(toText: toText, fromText: fromText);

  test('deve converter de real para dolar com ponto', () {
    fromText.text = "2.0";
    homeController.convert();
    expect(toText.text, "0.36");
  });

  test('deve converter de real para dolar com vírgula', () {
    fromText.text = "2.0";
    homeController.convert();
    expect(toText.text, "0.36");
  });

  test('deve converter de dolar para real com ponto', () {
    fromText.text = "1.0";
    homeController.fromCurrency = CurrencyModel.getCurrencies()[1];
    homeController.toCurrency = CurrencyModel.getCurrencies()[0];
    homeController.convert();
    expect(toText.text, "5.65");
  });

  test('deve converter de dolar para real com vírgula', () {
    fromText.text = "1,0";
    homeController.fromCurrency = CurrencyModel.getCurrencies()[1];
    homeController.toCurrency = CurrencyModel.getCurrencies()[0];
    homeController.convert();
    expect(toText.text, "5.65");
  });
}
