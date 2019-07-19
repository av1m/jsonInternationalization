import 'package:flutter/material.dart';

import '../internationalization/Internationalization.dart';
import 'second_page.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String dropdownValueLanguage = supportedLanguages[0].toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text("(1/2)"),
        backgroundColor: Colors.grey,
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
              Internationalization.of(context).greetTo('firstPage'),
              style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(Internationalization.of(context).greetTo("selectLang")),
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
              ],
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              color: Colors.grey,
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
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecondPage(),
          ),
        ),
        tooltip: 'Next',
        child: Icon(Icons.arrow_forward),
        backgroundColor: Colors.grey,
      ),
    );
  }
}
