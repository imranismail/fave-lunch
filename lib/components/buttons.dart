import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;

  const ActionButton({
    Key key,
    this.icon,
    this.color,
    this.size: 48,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
      child: Icon(
        icon,
        color: color,
        size: size,
      ),
      shape: CircleBorder(),
      fillColor: Colors.white,
      padding: const EdgeInsets.all(16.0),
    );
  }
}
