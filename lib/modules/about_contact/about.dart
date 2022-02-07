
import 'package:about/about.dart';
import 'package:flutter/material.dart';
class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      body: AboutPage(
          values: {
            'version': '1.0',
            'year': DateTime.now().year.toString(),
          },
          
          applicationLegalese: 'Copyright © David PHAM-VAN, {{ year }}',
          applicationDescription: const Text(
              'Medicen App For Search And Sell Alot Of Medicen  '),
          children: const <Widget>[
            MarkdownPageListTile(
              icon: Icon(Icons.list),
              title: Text('Changelog'),
              filename: 'CHANGELOG.md',
            ),
            LicensesPageListTile(
              icon: Icon(Icons.favorite),
            ),
          ],
          applicationName: "Medicen App",
          applicationIcon: const SizedBox(
            width: 100,
            height: 100,
            child: Image(
              image: AssetImage('assets/images/drawer.jpg'),
            ),
          )),
    );
  }
}