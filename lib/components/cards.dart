import 'package:flutter/material.dart';

import './images.dart';

class OutletCard extends StatelessWidget {
  final List<String> images;

  final String name;
  final String location;
  final double distance;
  final bool foreground;
  final int paidCount;

  const OutletCard({
    Key key,
    this.images,
    this.name,
    this.location,
    this.distance,
    this.paidCount,
    this.foreground = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Swipeable(
      key: GlobalKey(),
      child: buildCard(),
    );
  }

  Widget buildCard() {
    return Padding(
      padding: const EdgeInsets.only(top: 48.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6.0),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                child: foreground
                    ? ImageGallery(
                        srcs: images,
                        visibleImageIndex: 0,
                      )
                    : Image.network(
                        images[0],
                        fit: BoxFit.cover,
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
  final Widget background;
  final double maxAngle;

  Swipeable({
    @required Key key,
    @required this.child,
    this.background,
    this.maxAngle = 0.05,
  }) : super(key: key);

  @override
  _SwipeableState createState() => _SwipeableState();
}

class _SwipeableState extends State<Swipeable> with TickerProviderStateMixin {
  Animation<Offset> _movementAnimation;
  AnimationController _movementController;
  Animation<double> _resizeAnimation;
  AnimationController _resizeController;
  Animation<double> _rotationAnimation;
  AnimationController _rotationController;
  Size _sizePriorToCollapse;
  double _movementExtent = 0.0;
  double _rotationAngle = 0.0;
  bool _isDragging = false;

  @override
  Widget build(BuildContext context) {
    if (_resizeAnimation != null) {
      return SizeTransition(
        sizeFactor: _resizeAnimation,
        axis: Axis.vertical,
        child: SizedBox(
          width: _sizePriorToCollapse.width,
          height: _sizePriorToCollapse.height,
          child: widget.background,
        ),
      );
    }

    return GestureDetector(
      child: RotationTransition(
        turns: _rotationAnimation,
        child: SlideTransition(
          child: widget.child,
          position: _movementAnimation,
        ),
      ),
      onHorizontalDragStart: _handleDragStart,
      onHorizontalDragUpdate: _handleDragUpdate,
      onHorizontalDragEnd: _handleDragEnd,
    );
  }

  @override
  void dispose() {
    _movementController.dispose();
    _resizeController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _movementController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 325),
    )..addStatusListener(_handleDismissStatusChanged);
    _rotationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 325));
    _updateAnimation();
  }

  _handleDismissStatusChanged(AnimationStatus status) async {
    if (status == AnimationStatus.completed && !_isDragging)
      _startResizeAnimation();
  }

  _handleDragEnd(DragEndDetails details) {
    if (!_isDragging || _movementController.isAnimating) return;

    _isDragging = false;

    if (_movementController.value > 0.4) {
      _movementController.forward();
      _rotationController.forward();
    } else {
      _movementController.reverse();
      _rotationController.reverse();
    }
  }

  _handleDragStart(DragStartDetails details) {
    _isDragging = true;

    if (_movementController.isAnimating) {
      _movementExtent =
          _movementController.value * context.size.width * _movementExtent.sign;
      _rotationAngle =
          _rotationController.value * widget.maxAngle * _movementExtent.sign;
      _movementController.stop();
      _rotationController.stop();
    } else {
      _movementExtent = 0.0;
      _rotationAngle = 0.0;
      _movementController.value = 0.0;
      _rotationController.value = 0.0;
    }

    setState(() {
      _updateAnimation();
    });
  }

  _handleDragUpdate(DragUpdateDetails details) {
    if (!_isDragging || _movementController.isAnimating) return;

    final double oldMovementExtent = _movementExtent;
    final double oldRotationAngle = _rotationAngle;
    final double delta = details.primaryDelta;

    _movementExtent += delta;
    _rotationAngle = widget.maxAngle *
        (_movementExtent.abs() / context.size.width) *
        _movementExtent.sign;

    if (oldMovementExtent.sign != _movementExtent.sign ||
        oldRotationAngle.sign != _rotationAngle.sign) {
      setState(() {
        _updateAnimation();
      });
    }

    if (!_movementController.isAnimating) {
      _movementController.value = _movementExtent.abs() / context.size.width;
      _rotationController.value = _movementExtent.abs() / context.size.width;
    }
  }

  _startResizeAnimation() {
    assert(_movementController != null);
    assert(_movementController.isCompleted);
    assert(_resizeController == null);
    assert(_sizePriorToCollapse == null);

    _resizeController =
        AnimationController(duration: Duration(milliseconds: 325), vsync: this)
          ..forward();

    setState(() {
      _sizePriorToCollapse = context.size;
      _resizeAnimation = _resizeController.drive(
        Tween<double>(begin: 1.0, end: 0.0),
      );
    });
  }

  _updateAnimation() {
    _rotationAnimation = _rotationController.drive(
      Tween<double>(
        begin: 0.0,
        end: widget.maxAngle * _rotationAngle.sign,
      ),
    );

    _movementAnimation = _movementController.drive(
      Tween<Offset>(
        begin: Offset.zero,
        end: Offset(_movementExtent.sign, 0.0),
      ),
    );
  }
}
