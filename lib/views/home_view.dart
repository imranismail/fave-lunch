import 'package:flutter/material.dart';
import '../components/cards.dart';
import '../components/buttons.dart';

class HomeView extends StatelessWidget {
  final String title;

  HomeView({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Flexible(
              child: OutletCardStack(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ActionButton(icon: Icons.close, color: Colors.red),
                  ActionButton(icon: Icons.check, color: Colors.green),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
