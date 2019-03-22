import 'package:flutter/material.dart';

import './images.dart';

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
              name: "Medifoods",
              location: "Bangsar South",
              distance: 500.0,
              images: [
                "https://image-assets.access.myfave.gdn/attachments/d08b28ffe84b5d36a7d7ed533c4d04b3bc11c7bf/store/fill/800/500/f0c554c776fc2bad1dfea2adceb598d36e5dd4e6bcf64ae942558ded5c2b/Barcook+Bakery+-+main.jpg",
                "https://image-assets.access.myfave.gdn/attachments/8a152961bae7e78340443844f8e52ff6ca6d6707/store/fill/800/500/e7ff074d4f56ceb38bde11590f64f120875de35bf48250421b66971ff2cf/file.jpg",
                "https://image-assets.access.myfave.gdn/attachments/973f7c74260a556b03496eb2452b0aa1fafc24b3/store/fill/800/500/900b2145987909dc50ab2a8fb40767b9ccbc52fdf779f6f9b09c3bf8fd60/Khan%27s-main.jpg"
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
              distance: 500.0,
              images: [
                "https://image-assets.access.myfave.gdn/attachments/973f7c74260a556b03496eb2452b0aa1fafc24b3/store/fill/800/500/900b2145987909dc50ab2a8fb40767b9ccbc52fdf779f6f9b09c3bf8fd60/Khan%27s-main.jpg",
                "https://image-assets.access.myfave.gdn/attachments/8a152961bae7e78340443844f8e52ff6ca6d6707/store/fill/800/500/e7ff074d4f56ceb38bde11590f64f120875de35bf48250421b66971ff2cf/file.jpg",
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
              images: [
                "https://image-assets.access.myfave.gdn/attachments/8a152961bae7e78340443844f8e52ff6ca6d6707/store/fill/800/500/e7ff074d4f56ceb38bde11590f64f120875de35bf48250421b66971ff2cf/file.jpg",
                "https://image-assets.access.myfave.gdn/attachments/d08b28ffe84b5d36a7d7ed533c4d04b3bc11c7bf/store/fill/800/500/f0c554c776fc2bad1dfea2adceb598d36e5dd4e6bcf64ae942558ded5c2b/Barcook+Bakery+-+main.jpg",
                "https://image-assets.access.myfave.gdn/attachments/973f7c74260a556b03496eb2452b0aa1fafc24b3/store/fill/800/500/900b2145987909dc50ab2a8fb40767b9ccbc52fdf779f6f9b09c3bf8fd60/Khan%27s-main.jpg"
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class OutletCard extends StatelessWidget {
  const OutletCard({
    Key key,
    this.images,
    this.name,
    this.location,
    this.distance,
    this.foreground = true,
  }) : super(key: key);

  final List<String> images;
  final String name;
  final String location;
  final double distance;
  final bool foreground;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return foreground
            ? Draggable(
                child: buildCard(),
                feedback: Container(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth,
                  child: buildCard(),
                ),
                axis: Axis.horizontal,
                childWhenDragging: Container(),
              )
            : buildCard();
      },
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
                padding: const EdgeInsets.all(24.0),
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
                          TextSpan(text: " • 252 Paid"),
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
