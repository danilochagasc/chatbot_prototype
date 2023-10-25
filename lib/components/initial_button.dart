import 'package:chatbot_prototype/screens/listening_screen.dart';
import 'package:chatbot_prototype/screens/bluetooth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class InitialButton extends StatelessWidget {
  final String buttonText;

  const InitialButton({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: ElevatedButton(
        onPressed: () {
          FlutterBluePlus.startScan();
          FlutterBluePlus.stopScan();
          buttonText == 'Start Conversation'
              ? Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ListeningScreen()))
              : Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainPage()));
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.grey.shade400; // Cor quando pressionado
              }
              return const Color.fromARGB(255, 248, 246, 246); // Cor padrão
            },
          ),
          minimumSize: MaterialStateProperty.all<Size>(const Size(300, 60)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          ),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
