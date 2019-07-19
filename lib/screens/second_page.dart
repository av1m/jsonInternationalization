import 'package:flutter/material.dart';

import '../internationalization/Internationalization.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String dropdownValueLanguage = supportedLanguages[0].toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text("(2/2)"),
        backgroundColor: Colors.indigo,
        title: Text(Internationalization.of(context).greetTo('current') +
            " : " +
            Internationalization.of(context).greetTo('lang')
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              Internationalization.of(context).greetTo('secondPage'),
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(Internationalization.of(context).greetTo("selectLang")),
            SizedBox(
              height: 15,
            ),
            DropdownButton<String>(
              value: dropdownValueLanguage,
              onChanged: (String newLanguage) {
                setState(() {
                  dropdownValueLanguage = newLanguage;
                });
              },
              items: supportedLanguages.map((language) {
                return DropdownMenuItem<String>(
                  value: language,
                  child: Text(language),
                );
              }).toList(),
            ),
            MaterialButton(
              color: Colors.indigo,
              child:
                  Text(Internationalization.of(context).greetTo('changeLang')),
              onPressed: () {
                setState(() {
                  Internationalization.of(context).locale =
                      Locale(dropdownValueLanguage, "");
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        tooltip: 'Back',
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.indigo,
      ),
    );
  }
}
