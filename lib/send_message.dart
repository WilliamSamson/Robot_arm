library send_messagee;

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'Servo.dart';

class ChatPage extends StatefulWidget {
  final BluetoothDevice? server;
  const ChatPage({
    Key? key,
    this.server,
    this.lcdMessage,
  }) : super(key: key);
  final String? lcdMessage;

  @override
  _ChatPageState createState() => _ChatPageState();
}

var hadi;

class _ChatPageState extends State<ChatPage>
    with SingleTickerProviderStateMixin {
  BluetoothConnection? connection;

  bool isConnecting = true;

  bool get isConnected => connection != null && connection!.isConnected;

  bool isDisconnecting = false;
  @override
  void initState() {
    super.initState();

    BluetoothConnection.toAddress(widget.server!.address).then((_connection) {
      print('device connected');
      connection = _connection;

      setState(() {
        isConnecting = false;
        isDisconnecting = false;
      });
    });
  }

  void dispose() {
    if (isConnected) {
      isDisconnecting = true;
      connection?.dispose();
      connection = null;
      mineController.close();
    }
    super.dispose();
  }

  bool btnColor = false;

  StreamController<String> mineController =
      StreamController<String>.broadcast();
  Stream<String> myStream() async* {
    connection?.input?.listen((Uint8List data) {
      print(ascii.decode(data));

      mineController.add(ascii.decode(data));
    });
  }

  int speed = 10;

  Widget build(BuildContext context) {
    String denemee = "No Data";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 22, 40, 113),
        elevation: 20,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Robo Arm Control',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/arm-3.png'),
          ),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                left: 10.0,
              ),
            ),
            const SizedBox(
              height: 25,
              width: 100,
            ),
            const Divider(
              color: Colors.white,
              indent: 30,
              endIndent: 30,
              thickness: 3,
              height: 30,
            ),
            const SizedBox(
              height: 5,
              width: 25,
            ),
            Align(
              alignment: Alignment.center,
              child: ServoPage(
                sendMessageA: () => _sendMessage('A'), //open
                sendMessageB: () => _sendMessage('B'), //close
                sendMessageC: () => _sendMessage('C'), //up
                sendMessageD: () => _sendMessage('D'), //down
                sendMessageE: () => _sendMessage('E'),
                sendMessageF: () => _sendMessage('F'),
                sendMessageM: () => _sendMessage('M'),
                sendMessageN: () => _sendMessage('N'),
                sendMessageO: () => _sendMessage('O'),
                sendMessageP: () => _sendMessage('P'),
                /////////////
                sendMessageA1: () => _sendMessage('A1'), //open
                sendMessageB1: () => _sendMessage('B1'), //close
                sendMessageC1: () => _sendMessage('C1'), //up
                sendMessageD1: () => _sendMessage('D1'), //down
                sendMessageE1: () => _sendMessage('E1'),
                sendMessageF1: () => _sendMessage('F1'),

                sendMessageA2: () => _sendMessage('A2'), //open
                sendMessageB2: () => _sendMessage('B2'), //close
                sendMessageC2: () => _sendMessage('C2'), //up
                sendMessageD2: () => _sendMessage('D2'), //down
                sendMessageE2: () => _sendMessage('E2'),
                sendMessageF2: () => _sendMessage('F2'),
              ),
            ),
            const Divider(
              color: Colors.white,
              indent: 30,
              endIndent: 30,
              thickness: 3,
              height: 30,
            ),
            StreamBuilder<String>(
              stream: mineController.stream.asBroadcastStream(),
              builder: (context, AsyncSnapshot<String> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                }
                return Center(
                  child: Text(
                    snapshot.data ?? denemee,
                    style: const TextStyle(
                        fontSize: 30, color: Color.fromARGB(255, 14, 9, 86)),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  btnColorChange() {
    setState(() {
      btnColor = !btnColor;
    });
  }

  _sendMessage(String text) async {
    text = text.trim();

    if (text.isNotEmpty) {
      try {
        connection!.output.add(Uint8List.fromList(utf8.encode(text)));
        await connection!.output.allSent;
      } catch (e) {
        // Ignore error, but notify state

      }
    }
  }

  _receiveMessage() {
    connection!.input!.listen(
      (Uint8List data) {
        print('Data incoming: ${ascii.decode(data)}');
        void deneme = ascii.decode(data);

        return deneme;
      },
    );
  }
}
