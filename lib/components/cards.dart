import 'dart:math';

import 'package:flutter/material.dart';

import './images.dart';

class OutletCard extends StatelessWidget {
  final List<String> images;

  final String name;
  final String location;
  final double distance;
  final int paidCount;

  const OutletCard({
    Key key,
    this.images,
    this.name,
    this.location,
    this.distance,
    this.paidCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Swipeable(
      key: GlobalKey(),
      child: buildCard(),
    );
  }

  Widget buildCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6.0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: ImageGallery(
                srcs: images,
                visibleImageIndex: 0,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.8),
                    ],
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        text: name,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                        children: [
                          TextSpan(
                            text: ", ${distance.round()}m",
                            style: TextStyle(fontWeight: FontWeight.normal),
                          )
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: location,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 16.0),
                        children: [
                          TextSpan(text: " • $paidCount Paid"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OutletCardStack extends StatelessWidget {
  const OutletCardStack({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        FractionalTranslation(
          translation: Offset(0.0, -0.085 * 2),
          child: Transform.scale(
            scale: 1 - (0.1 * 2),
            child: OutletCard(
              name: "JuiceLab",
              location: "The Sphere",
              distance: 350.0,
              paidCount: 2618,
              images: [
                "https://image-assets.access.myfave.gdn/attachments/c3b3e3b47e5b2da96d91858f7d68147f1af45d17/store/fill/800/500/43d5dc80128c0b7d0e1cb43dafea7d783acc66b736f0a16b74872b95ad7e/JuiceLab+-+main+new.jpg",
              ],
            ),
          ),
        ),
        FractionalTranslation(
          translation: Offset(0.0, -0.085 * 1),
          child: Transform.scale(
            scale: 1 - (0.1 * 1),
            child: OutletCard(
              name: "Barcook Bakery",
              location: "Bangsar South",
              distance: 425.0,
              paidCount: 16689,
              images: [
                "https://image-assets.access.myfave.gdn/attachments/d08b28ffe84b5d36a7d7ed533c4d04b3bc11c7bf/store/fill/800/500/f0c554c776fc2bad1dfea2adceb598d36e5dd4e6bcf64ae942558ded5c2b/Barcook+Bakery+-+main.jpg",
              ],
            ),
          ),
        ),
        FractionalTranslation(
          translation: Offset(0.0, 0.0),
          child: Transform.scale(
            scale: 1.0,
            child: OutletCard(
              name: "Khan's",
              location: "Bangsar South",
              distance: 500.0,
              paidCount: 690,
              images: [
                "https://image-assets.access.myfave.gdn/attachments/973f7c74260a556b03496eb2452b0aa1fafc24b3/store/fill/800/500/900b2145987909dc50ab2a8fb40767b9ccbc52fdf779f6f9b09c3bf8fd60/Khan%27s-main.jpg",
                "https://image-assets.access.myfave.gdn/attachments/b183c5669d2f9c0e10f9f0ad9bc048c09a568715/store/fill/800/500/64c2c99991f023ef49f000222b550fcc0dd1eb44984058d1a645ce3de1e0/Khan%27s-3.jpg",
                "https://image-assets.access.myfave.gdn/attachments/7046794938c5053a4545cadf5109b72c678928f2/store/fill/800/500/715f61515f805783caa41e0ba97f75291e4b6f0c664b374d9ca8b692f90b/Khan%27s-4.jpg",
                "https://image-assets.access.myfave.gdn/attachments/fc6a94a6ee8fd8ec2e6d06b323bd012834d158b8/store/fill/800/500/b9e0dea65b350586d624301f7a6628fc6f949f8f40a19c02521121442319/Khan%27s-2.jpg",
                "https://image-assets.access.myfave.gdn/attachments/509ad51f945245bfeaf4fc69df6254da0810d288/store/fill/800/500/f7fef8794d745067019ded4347e32898200889f4f741f729343ee74430f9/Khan%27s-1.jpg",
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Swipeable extends StatefulWidget {
  final Widget child;

  Swipeable({
    @required Key key,
    @required this.child,
  }) : super(key: key);

  @override
  _SwipeableState createState() => _SwipeableState();
}

class _SwipeableState extends State<Swipeable>
    with SingleTickerProviderStateMixin {
  Offset _dragStartPosition = Offset.zero;
  Offset _dragPosition = Offset.zero;
  Offset _cardPosition = Offset.zero;
  AnimationController _controller;
  Animation<double> _animation;

  Matrix4 getTransform(BoxConstraints constraints) {
    double rotation = 0.0;

    if (_dragStartPosition != null) {
      final topOffset = 100;
      final dragStartedFromTop =
          _dragStartPosition.dy >= (constraints.maxHeight / 2) + topOffset;
      final sign = dragStartedFromTop ? -1 : 1;
      rotation = (_cardPosition.dx / constraints.maxWidth) * 0.325 * sign;
    }

    return Matrix4.identity()
      ..translate(_cardPosition.dx * _animation.value,
          _cardPosition.dy * _animation.value)
      ..rotateZ(rotation * _animation.value);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return AnimatedBuilder(
            animation: _controller,
            child: widget.child,
            builder: (context, child) {
              return Transform(
                transform: getTransform(constraints),
                child: child,
              );
            },
          );
        },
      ),
      onPanStart: _onPanStart,
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );

    _animation = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );
  }

  void _onPanStart(DragStartDetails details) {
    if (_controller.isAnimating) _controller.stop(canceled: true);
    _dragStartPosition = details.globalPosition;
  }

  void _onPanUpdate(DragUpdateDetails details) {
    _dragPosition = details.globalPosition;
    _cardPosition = _dragPosition - _dragStartPosition;
    _controller.reset();
  }

  void _onPanEnd(DragEndDetails details) {
    _controller.forward();
  }
}
