import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ServoPage extends StatefulWidget {
  const ServoPage({
    Key? key,
    required this.sendMessageA,
    required this.sendMessageB,
    required this.sendMessageC,
    required this.sendMessageD,
    required this.sendMessageE,
    required this.sendMessageF,
    required this.sendMessageM,
    required this.sendMessageN,
    required this.sendMessageO,
    required this.sendMessageP,
/////////
    required this.sendMessageA1,
    required this.sendMessageB1,
    required this.sendMessageC1,
    required this.sendMessageD1,
    required this.sendMessageE1,
    required this.sendMessageF1,
    required this.sendMessageA2,
    required this.sendMessageB2,
    required this.sendMessageC2,
    required this.sendMessageD2,
    required this.sendMessageE2,
    required this.sendMessageF2,
/////////
  }) : super(key: key);
  final Function sendMessageA;
  final Function sendMessageB;
  final Function sendMessageC;
  final Function sendMessageD;
  final Function sendMessageE;
  final Function sendMessageF;

  //////////
  final Function sendMessageA1;
  final Function sendMessageB1;
  final Function sendMessageC1;
  final Function sendMessageD1;
  final Function sendMessageE1;
  final Function sendMessageF1;

  final Function sendMessageA2;
  final Function sendMessageB2;
  final Function sendMessageC2;
  final Function sendMessageD2;
  final Function sendMessageE2;
  final Function sendMessageF2;

  /////////
  final Function sendMessageM;
  final Function sendMessageN;
  final Function sendMessageO;
  final Function sendMessageP;

  @override
  _ServoPageState createState() => _ServoPageState();
}

class _ServoPageState extends State<ServoPage> {
  int speed = 0;

  int A = 0;
  int B = 0;
  int C = 0;
  int D = 0;
  int E = 0;
  int F = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Card(
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 50,
              shadowColor: const Color.fromARGB(255, 177, 173, 220),
              color: const Color.fromARGB(124, 7, 7, 7),
              child: Column(
                children: [
                  Text(
                    'Gripper',
                    style: GoogleFonts.acme(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 200,
                        child: Slider(
                          value: A.toDouble(),
                          onChanged: (value) {
                            var z = value;
                            if (A == 10) {
                              setState(
                                () {
                                  widget.sendMessageA();
                                },
                              );
                            } else if (A == 20) {
                              setState(
                                () {
                                  widget.sendMessageA1();
                                },
                              );
                            } else if (A == 30) {
                              setState(
                                () {
                                  widget.sendMessageA2();
                                },
                              );
                            }
                            setState(
                              () {
                                A = value.toInt();
                              },
                            );
                          },
                          min: 0,
                          max: 30,
                          divisions: 3,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Open:",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(width: 25),
            Card(
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 50,
              shadowColor: Colors.black,
              color: const Color.fromARGB(124, 7, 7, 7),
              child: Column(
                children: [
                  Text(
                    'Wrist',
                    style: GoogleFonts.acme(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 200,
                        child: Slider(
                          value: B.toDouble(),
                          onChanged: (value) {
                            if (B == 10) {
                              setState(
                                () {
                                  widget.sendMessageB();
                                },
                              );
                            } else if (B == 20) {
                              setState(
                                () {
                                  widget.sendMessageB1();
                                },
                              );
                            } else if (B == 30) {
                              setState(
                                () {
                                  widget.sendMessageB2();
                                },
                              );
                            }
                            setState(
                              () {
                                B = value.toInt();
                              },
                            );
                          },
                          min: 0,
                          max: 30,
                          divisions: 3,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Close: ",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        /////////////////////////////////
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Card(
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 50,
              shadowColor: Colors.black,
              color: const Color.fromARGB(124, 7, 7, 7),
              child: Column(
                children: [
                  Text(
                    'Joint',
                    style: GoogleFonts.acme(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 200,
                        child: Slider(
                          value: C.toDouble(),
                          onChanged: (value) {
                            if (C == 10) {
                              setState(
                                () {
                                  widget.sendMessageC();
                                },
                              );
                            } else if (C == 20) {
                              setState(
                                () {
                                  widget.sendMessageC1();
                                },
                              );
                            } else if (C == 30) {
                              setState(
                                () {
                                  widget.sendMessageC2();
                                },
                              );
                            }
                            setState(
                              () {
                                C = value.toInt();
                              },
                            );
                          },
                          min: 0,
                          max: 30,
                          divisions: 3,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(width: 25),
            Card(
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 50,
              shadowColor: Colors.black,
              color: const Color.fromARGB(124, 7, 7, 7),
              child: Column(
                children: [
                  Text(
                    'Elbow',
                    style: GoogleFonts.acme(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 200,
                        child: Slider(
                          value: D.toDouble(),
                          onChanged: (value) {
                            if (D == 10) {
                              setState(
                                () {
                                  widget.sendMessageD();
                                },
                              );
                            } else if (D == 20) {
                              setState(
                                () {
                                  widget.sendMessageD1();
                                },
                              );
                            } else if (D == 30) {
                              setState(
                                () {
                                  widget.sendMessageD2();
                                },
                              );
                            }
                            setState(
                              () {
                                D = value.toInt();
                              },
                            );
                          },
                          min: 0,
                          max: 30,
                          divisions: 3,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        //////////////
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Card(
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 50,
              shadowColor: Colors.black,
              color: const Color.fromARGB(124, 7, 7, 7),
              child: Column(
                children: [
                  Text(
                    'Shoulder',
                    style: GoogleFonts.acme(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 200,
                        child: Slider(
                          value: E.toDouble(),
                          onChanged: (value) {
                            if (E == 10) {
                              setState(
                                () {
                                  widget.sendMessageE();
                                },
                              );
                            } else if (E == 20) {
                              setState(
                                () {
                                  widget.sendMessageE1();
                                },
                              );
                            } else if (E == 30) {
                              setState(
                                () {
                                  widget.sendMessageE2();
                                },
                              );
                            }
                            setState(
                              () {
                                speed = value.toInt();
                              },
                            );
                          },
                          min: 0,
                          max: 30,
                          divisions: 3,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(width: 25),
            Card(
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 50,
              shadowColor: Colors.black,
              color: const Color.fromARGB(124, 7, 7, 7),
              child: Column(
                children: [
                  Text(
                    'Base',
                    style: GoogleFonts.acme(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 200,
                        child: Slider(
                          value: F.toDouble(),
                          onChanged: (value) {
                            if (F == 10) {
                              setState(
                                () {
                                  widget.sendMessageF();
                                },
                              );
                            } else if (F == 20) {
                              setState(
                                () {
                                  widget.sendMessageF1();
                                },
                              );
                            } else if (F == 30) {
                              setState(
                                () {
                                  widget.sendMessageF2();
                                },
                              );
                            }
                            setState(
                              () {
                                F = value.toInt();
                              },
                            );
                          },
                          min: 0,
                          max: 30,
                          divisions: 3,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Slider(
              value: speed.toDouble(),
              onChanged: (value) {
                if (speed == 10) {
                  setState(
                    () {
                      widget.sendMessageM();
                    },
                  );
                } else if (speed == 20) {
                  setState(
                    () {
                      widget.sendMessageN();
                    },
                  );
                } else if (speed == 30) {
                  setState(
                    () {
                      widget.sendMessageO();
                    },
                  );
                } else if (speed == 40) {
                  setState(
                    () {
                      widget.sendMessageP();
                    },
                  );
                }
                setState(
                  () {
                    speed = value.toInt();
                  },
                );
              },
              min: 0,
              max: 40,
              divisions: 4,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Speed: $speed",
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
