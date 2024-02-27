import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tesingz/statez.dart';

class Game extends StatelessWidget {
  const Game({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyState>(
      builder: (context, val, child) => Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Column(children: [
            SizedBox(height: MediaQuery.of(context).size.height / 5),
            Text("${val.turn}'s Turn",
                style: GoogleFonts.blackOpsOne(
                    fontSize: 32, fontWeight: FontWeight.bold)),
            Expanded(
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.all(4),
                  child: Tilez(
                    text: val.game[index],
                    index: index,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                val.restart();
              },
              child: Container(
                height: 80,
                width: 200,
                margin: EdgeInsets.only(bottom: 100),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green),
                child: Icon(Icons.replay),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class Tilez extends StatefulWidget {
  Tilez({super.key, required this.index, required this.text});
  var index;
  var text;
  @override
  State<Tilez> createState() => _TilezState();
}

class _TilezState extends State<Tilez> {
  bool tapped = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<MyState>(
      builder: (context, val, child) => GestureDetector(
          onTap: () {
            if (val.game[widget.index] == "") {
              val.game[widget.index] = val.turn;
              val.changeTurn();
              print(val.game);
              setState(() {
                tapped = true;
                val.checkWinner(context);
              });
            }
          },
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            alignment: Alignment.center,
            height: 50,
            width: 50,
            color: val.winner == "X"
                ? val.game[widget.index] == "X"
                    ? Colors.green
                    : Colors.blue[100]
                : val.winner == "O"
                    ? val.game[widget.index] == "O"
                        ? Colors.green
                        : Colors.blue[100]
                    : Colors.blue[100],
            child: Text(tapped == false ? "" : widget.text,
                style: GoogleFonts.rowdies(
                    fontSize: 32,
                    color: val.game[widget.index] == "X"
                        ? Colors.orange
                        : Colors.indigo)),
          )),
    );
  }
}
