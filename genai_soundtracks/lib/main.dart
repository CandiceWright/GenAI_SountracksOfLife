import 'package:flutter/material.dart';
import 'package:genai_soundtracks/services/server_service.dart';
import 'package:genai_soundtracks/song_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum Genre { rb, pop, country, hiphop, afrobeats }

enum Emotion { excited, nervous, happy, frustrated, sad }

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextEditingController gratitudeTextController = TextEditingController();
  TextEditingController bestQualityController = TextEditingController();
  TextEditingController worstQualityController = TextEditingController();
  TextEditingController dreamController = TextEditingController();
  TextEditingController bestThisMonthController = TextEditingController();
  String selectedGenre = 'R&B';
  String selectedEmotion1 = 'Excited';
  String selectedEmotion2 = 'Nervous';

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
        //title: Text("Soundtracks of Life"),
        backgroundColor: Colors.black,
        title: Image.asset('../assets/bard_image.jpeg'),
        //elevation: 0,
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Bring your story to life with AI",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 30, left: 20, right: 20),
              child: Text(
                "Soundtracks of Life",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const Text(
              "Your favorite music genre.",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: DropdownButton<String>(
                value: selectedGenre,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedGenre = newValue!;
                  });
                },
                items: <String>['R&B', 'Pop', 'Country', 'HipHop', 'Afrobeats']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            const Text(
              "What emotions are you feeling most in life right now?",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: DropdownButton<String>(
                value: selectedEmotion1,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedEmotion1 = newValue!;
                  });
                },
                items: <String>[
                  'Excited',
                  'Nervous',
                  'Happy',
                  'Frustrated',
                  'Sad'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: DropdownButton<String>(
                value: selectedEmotion2,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedEmotion2 = newValue!;
                  });
                },
                items: <String>[
                  'Excited',
                  'Nervous',
                  'Happy',
                  'Frustrated',
                  'Sad'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: TextFormField(
                controller: gratitudeTextController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'What are you most grateful for right now?',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: TextFormField(
                controller: bestQualityController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Best quality about you?',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: TextFormField(
                controller: worstQualityController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Worst Quality about you?',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: TextFormField(
                controller: dreamController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'What’s something you dream of?',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: TextFormField(
                controller: bestThisMonthController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:
                      'What’s the best thing that’s happened to you this month?',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: ElevatedButton(
                onPressed: () async {
                  var song = await ServerService.sharedInstance.generateSong(
                      selectedGenre,
                      selectedEmotion1,
                      selectedEmotion2,
                      gratitudeTextController.text,
                      bestQualityController.text,
                      worstQualityController.text,
                      dreamController.text,
                      bestThisMonthController.text);
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SongPage(
                      song: song,
                    ),
                  ));
                },
                child: const Text("Make My Life a Song"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        //const Color(0xffd1849e),
                        Colors.black),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(
                                //color: Color(0xffd1849e),
                                color: Colors.white)))),
              ),
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
