library send_messagee;

import 'dart:async';
import 'dart:convert';

import 'dart:typed_data';
import 'package:animated_stack/animated_stack.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import 'buzzer_page.dart';

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

  Widget build(BuildContext context) {
    String denemee = "No Data";

    return Scaffold(
      appBar: AppBar(
        title: Text('Robo Arm'),
      ),
      body: Column(
        children: [
          // Padding(
          //     padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
          // child:
          //  buzzerPage(
          //   sendMessage1: () => _sendMessage('F'),
          //   sendMessage2: () => _sendMessage('B'),
          //   sendMessage3: () => _sendMessage('3'),
          //   sendMessage4: () => _sendMessage('4'),
          //   sendMessage5: () => _sendMessage('5'),
          //   sendMessage6: () => _sendMessage('6'),
          //   sendMessage7: () => _sendMessage('7'),
          //   sendMessage8: () => _sendMessage('8'),
          //   sendMessage9: () => _sendMessage('9'),
          // )),
          Align(
            alignment: Alignment.center,
            child: ledPage(
              sendMessageA: () => _sendMessage('F'),
              sendMessageK: () => _sendMessage('B'),
            ),
          ),
          StreamBuilder<String>(
            stream: mineController.stream.asBroadcastStream(),
            builder: (context, AsyncSnapshot<String> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 150),
                  child: CircularProgressIndicator(),
                );
              }
              return Center(
                child: Text(
                  snapshot.data ?? denemee,
                  style: const TextStyle(fontSize: 30, color: Colors.black),
                ),
              );
            },
          )
        ],
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

    if (text.length > 0) {
      try {
        connection!.output.add(Uint8List.fromList(utf8.encode(text)));
        await connection!.output.allSent;
      } catch (e) {
        // Ignore error, but notify state

      }
    }
  }

  _receiveMessage() {
    connection!.input!.listen((Uint8List data) {
      print('Data incoming: ${ascii.decode(data)}');
      void deneme = ascii.decode(data);

      return deneme;
    });
  }
}
