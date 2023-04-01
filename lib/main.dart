import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Music(),
    );
  }
}

class Music extends StatelessWidget {
  const Music({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music"),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Music1(),
                  ),
                );
              },
              child: Text("Music1")),
        ],
      ),
    );
  }
}

class Music1 extends StatefulWidget {
  const Music1({Key? key}) : super(key: key);

  @override
  State<Music1> createState() => _Music1State();
}

class _Music1State extends State<Music1> {

  final player = AudioPlayer();

  Future setMusic({required String path}) {
    return player.setSource(AssetSource(path));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Music1"),
        ),
        body: Column(children: [
          GestureDetector(
            onTap: () async {
              await setMusic(path: "music/bad_guy.mp3");
              player.play(player.source!);
            },
            child: Container(
              color: Colors.pinkAccent,
              margin: EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 110,
                    padding: const EdgeInsets.all(10),
                    child: const Image(
                      image: NetworkImage(
                          "https://www.pngmart.com/files/13/Singer-Billie-Eilish-PNG-Transparent.png"),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Billie Eilish ",
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      ),
                      Text(
                        "Bad Guy",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            color: Colors.purpleAccent,
            margin: EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 100,
                  padding: EdgeInsets.all(5),
                  child: Image(
                    image: NetworkImage(
                        "https://media1.popsugar-assets.com/files/thumbor/m6XtraBKv2sAYH9uABOpdB4SfDE/244x171:1646x1573/fit-in/500x500/filters:format_auto-!!-:strip_icc-!!-/2019/12/12/833/n/1922398/fa87d3a65df28e5bf254f9.58994723_/i/Ariana-Grande.jpg"),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ariana Grande",
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
                    Text(
                      "Side to side",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            color: Colors.orange,
            margin: EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 100,
                  padding: EdgeInsets.all(10),
                  child: Image(
                    image: NetworkImage(
                        "https://yeeeaahnetwork.com/wp-content/uploads/2022/12/Cardi-b-800x640.png"),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cardi B",
                      style: TextStyle(fontSize: 30, color: Colors.red),
                    ),
                    Text(
                      "Up",
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  ],
                )
              ],
            ),
          ),
        ]));
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool passwordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 400,
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.grey, blurRadius: 10, offset: Offset(10, 10))
          ],
        ),
        child: Form(
            child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  suffixIcon: IconButton(
                      onPressed: () {
                        usernameController.clear();
                      },
                      icon: const Icon(Icons.clear)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                obscureText: passwordHidden,
                controller: passwordController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.vpn_key_outlined),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          passwordHidden = !passwordHidden;
                        });
                      },
                      icon: const Icon(Icons.remove_red_eye)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(onPressed: () {}, child: const Text("Log in")),
            ],
          ),
        )),
      ),
    );
  }
}
