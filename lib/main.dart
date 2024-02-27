import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import 'package:tesingz/playerScreen.dart';
import 'package:tesingz/statez.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => MyState())],
    child: MaterialApp(
        theme: ThemeData(colorScheme: ColorScheme.dark()),
        debugShowCheckedModeBanner: false,
        home: MyApp()),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TimeOfDay time = TimeOfDay.now();
  var value = "Select a gender";
  var hour = TextEditingController();
  var min = TextEditingController();
  var second = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return OrientationBuilder(
      builder: (context, orientaion) => Scaffold(
          backgroundColor: Colors.blue,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Tic Tac Toe",
                  style: GoogleFonts.alata(
                      fontSize: 32, fontWeight: FontWeight.bold),
                )
                    .animate(
                        onPlay: (controller) =>
                            controller.repeat(reverse: true))
                    .slide(),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PlayerScreen()));
                  },
                  child: Container(
                    height: 70,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.greenAccent),
                    child: Center(child: Icon(Icons.play_arrow)),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
