import 'package:flutter/material.dart';

class OutletCard extends StatelessWidget {
  const OutletCard({Key key, this.image, this.name, this.location, this.distance})
      : super(key: key);

  final String image;
  final String name;
  final String location;
  final double distance;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              child: Image.network(this.image, fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(6.0),
            ),
          ),
          Positioned(
            child: Column(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: this.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                    children: [
                      TextSpan(
                        text: ", ${this.distance.round()}m",
                        style: TextStyle(
                          fontWeight: FontWeight.normal
                        ),
                      )
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "Bangsar South",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.8), fontSize: 16.0),
                    children: [
                      TextSpan(text: " • 252 Paid"),
                    ],
                  ),
                ),
              ],
            ),
            bottom: 16.0,
            left: 16.0,
            right: 16.0,
          )
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
    );
  }
}
