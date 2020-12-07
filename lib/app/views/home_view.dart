import 'package:converson_moedas_curso/app/components/currency_box.dart';
import 'package:converson_moedas_curso/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController fromText = TextEditingController();
  final TextEditingController toText = TextEditingController();

  HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(fromText: fromText, toText: toText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(top: 100, left: 30, right: 30),
          child: Column(children: [
            Image.asset(
              'assets/logo.png',
              width: 150,
              height: 150,
            ),
            SizedBox(height: 30),
            CurrencyBox(
              items: homeController.currencies,
              selectedItem: homeController.fromCurrency,
              controller: fromText,
              onChanged: (model) {
                setState(() {
                  homeController.fromCurrency = model;
                });
              },
            ),
            SizedBox(height: 10),
            CurrencyBox(
              items: homeController.currencies,
              selectedItem: homeController.toCurrency,
              controller: toText,
              onChanged: (model) {
                setState(() {
                  homeController.toCurrency = model;
                });
              },
            ),
            SizedBox(height: 50),
            RaisedButton(
              onPressed: () {
                homeController.convert();
              },
              color: Colors.amber,
              child: Text('CONVERTER'),
            )
          ]),
        ),
      ),
    ));
  }
}
