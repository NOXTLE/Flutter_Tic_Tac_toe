import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tesingz/game.dart';
import 'package:tesingz/statez.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyState>(
      builder: (context, val, child) => Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  val.select("X");
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      alignment: Alignment.center,
                      child: Text("X",
                          style: TextStyle(fontSize: 80, color: Colors.black)),
                      decoration: BoxDecoration(
                        borderRadius: val.what_Selected == "X"
                            ? BorderRadius.circular(20)
                            : BorderRadius.all(Radius.circular(0)),
                        color: val.what_Selected == "X"
                            ? val.SelectedColor
                            : Colors.blue[100],
                      ),
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width / 2.5),
                ),
              ),
              GestureDetector(
                onTap: () {
                  val.select("O");
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      alignment: Alignment.center,
                      child: Text("O",
                          style: TextStyle(fontSize: 80, color: Colors.black)),
                      decoration: BoxDecoration(
                          color: val.what_Selected == "O"
                              ? val.SelectedColor
                              : Colors.blue[100],
                          borderRadius: val.what_Selected == "O"
                              ? BorderRadius.circular(20)
                              : BorderRadius.circular(0)),
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width / 2.5),
                ),
              ),
            ],
          ),
          Visibility(
            visible: val.isSelected,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => Game()));
                },
                child: Container(
                  height: 80,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      "Playing as ${val.what_Selected}",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          )
        ])),
      ),
    );
  }
}
