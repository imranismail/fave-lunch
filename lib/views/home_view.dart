import 'package:flutter/material.dart';
import '../components/outlet_card.dart';
import '../components/action_button.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(top: 36.0),
                child: Stack(
                  children: <Widget>[
                    FractionalTranslation(
                      translation: Offset(0.0, -0.085 * 2),
                      child: Transform.scale(
                        scale: 1 - (0.1 * 2),
                        child: OutletCard(
                          name: "Medifoods",
                          location: "Bangsar South",
                          distance: 500.0,
                          image:
                              "https://image-assets.access.myfave.gdn/attachments/8a152961bae7e78340443844f8e52ff6ca6d6707/store/fill/800/500/e7ff074d4f56ceb38bde11590f64f120875de35bf48250421b66971ff2cf/file.jpg",
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
                          image:
                              "https://image-assets.access.myfave.gdn/attachments/d08b28ffe84b5d36a7d7ed533c4d04b3bc11c7bf/store/fill/800/500/f0c554c776fc2bad1dfea2adceb598d36e5dd4e6bcf64ae942558ded5c2b/Barcook+Bakery+-+main.jpg",
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
                          image:
                              "https://image-assets.access.myfave.gdn/attachments/973f7c74260a556b03496eb2452b0aa1fafc24b3/store/fill/800/500/900b2145987909dc50ab2a8fb40767b9ccbc52fdf779f6f9b09c3bf8fd60/Khan%27s-main.jpg",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 16.0),
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
