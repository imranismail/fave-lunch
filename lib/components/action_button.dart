import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key key,
    this.icon,
    this.color,
  }) : super(key: key);

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
      child: Icon(
        this.icon,
        color: this.color,
        size: 48.0,
      ),
      shape: CircleBorder(),
      fillColor: Colors.white,
      padding: const EdgeInsets.all(16.0),
    );
  }
}
