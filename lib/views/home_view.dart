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
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: constraints.maxHeight * 0.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      ActionButton(icon: Icons.close, color: Colors.red),
                      ActionButton(icon: Icons.check, color: Colors.green),
                    ],
                  ),
                ),
                Positioned(
                  top: 33,
                  left: 0,
                  right: 0,
                  height: constraints.maxHeight * 0.75,
                  child: OutletCardStack(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
