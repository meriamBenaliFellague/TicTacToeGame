import 'package:flutter/material.dart';
import '../constant/colors.dart';

class GemeScreen extends StatefulWidget {
  const GemeScreen({super.key});

  @override
  State<GemeScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GemeScreen> {
  String player1Name = "Meriam";
  String player2Name = "Ghofran";
  int player1Score = 0;
  int player2Score = 0;
  int filledBoxes = 0;
  bool player1Start = true;
  bool winnerFound = false;
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];
  String resultDeclaration = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MainColor.primaryColor,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 150,
                color: MainColor.primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                          child: Row(
                            children: [
                              Text(
                                player1Name,
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'Coiny',
                                  color: Colors.white,
                                ),
                              ),
                              const Text(
                                '  X',
                                style: TextStyle(
                                  fontSize: 35,
                                  fontFamily: 'Coiny',
                                  color: Color.fromARGB(255, 177, 65, 200),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          player1Score.toString(),
                          style: const TextStyle(
                              fontSize: 30,
                              fontFamily: 'Ciony',
                              color: Colors.white),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                          child: Row(
                            children: [
                              Text(
                                player2Name,
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'Coiny',
                                  color: Colors.white,
                                ),
                              ),
                              const Text(
                                '  O',
                                style: TextStyle(
                                  fontSize: 35,
                                  fontFamily: 'Coiny',
                                  color: Color.fromARGB(255, 177, 65, 200),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          player2Score.toString(),
                          style: const TextStyle(
                              fontSize: 30,
                              fontFamily: 'Ciony',
                              color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                height: 355,
                color: MainColor.primaryColor,
                child: Column(
                  children: [
                    Expanded(
                      flex: 12,
                      child: GridView.builder(
                          itemCount: 9,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                _tapped(index);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      width: 5, color: MainColor.primaryColor),
                                  color: MainColor.secondaryColor,
                                ),
                                child: Center(
                                  child: Text(
                                    displayXO[index],
                                    style: const TextStyle(
                                      fontSize: 65,
                                      fontFamily: 'coiny',
                                      color: Color.fromARGB(255, 177, 65, 200),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
              Container(
                  child: Expanded(
                      flex: 1,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              resultDeclaration,
                              style: const TextStyle(
                                color: Colors.green,
                                fontSize: 25,
                                fontFamily: 'Coiny',
                              ),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 40,
                                    vertical: 18,
                                  )),
                              onPressed: () {
                                _clearBoard();
                              },
                              child: const Text(
                                'Play Again!',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Coiny',
                                  fontSize: 22,
                                ),
                              ),
                            )
                          ],
                        ),
                      )))
            ],
          ),
        ));
  }

  void _tapped(int index) {
    setState(
      () {
        if (player1Start && displayXO[index] == '') {
          displayXO[index] = 'X';
          filledBoxes++;
        } else if (!player1Start && displayXO[index] == '') {
          displayXO[index] = 'O';
          filledBoxes++;
        }
        player1Start = !player1Start;
        _checkWinner();
      },
    );
  }

  void _checkWinner() {
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'Player ${displayXO[0]} Wins!';
        _updateScore(displayXO[0]);
      });
    }
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      setState(() {
        resultDeclaration = 'Player ${displayXO[3]} Wins!';
        _updateScore(displayXO[3]);
      });
    }
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      setState(() {
        resultDeclaration = 'Player ${displayXO[6]} Wins!';
        _updateScore(displayXO[6]);
      });
    }
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'Player ${displayXO[0]} Wins!';
        _updateScore(displayXO[0]);
      });
    }
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      setState(() {
        resultDeclaration = 'Player ${displayXO[1]} Wins!';
        _updateScore(displayXO[1]);
      });
    }
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      setState(() {
        resultDeclaration = 'Player ${displayXO[2]} Wins!';
        _updateScore(displayXO[2]);
      });
    }
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'Player ${displayXO[0]} Wins!';
        _updateScore(displayXO[0]);
      });
    }
    if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != '') {
      setState(() {
        resultDeclaration = 'Player ${displayXO[2]} Wins!';
        _updateScore(displayXO[2]);
      });
    }
    if (!winnerFound && filledBoxes == 9) {
      setState(() {
        resultDeclaration = 'Nobody Wins!';
      });
    }
  }

  void _updateScore(String winner) {
    if (winner == 'O') {
      player2Score++;
    } else if (winner == 'X') {
      player1Score++;
    }
    winnerFound = true;
  }

  void _clearBoard() {
    setState(() {
      for (var i = 0; i < 9; i++) {
        displayXO[i] = '';
      }
      resultDeclaration = '';
      filledBoxes = 0;
      winnerFound = false;
    });
  }
}
