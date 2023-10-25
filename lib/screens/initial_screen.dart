import 'package:flutter/material.dart';
import 'package:chatbot_prototype/components/initial_button.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      backgroundColor: Colors.white70,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              //Bem-Vindo
              Padding(
                padding: EdgeInsets.only(top: 150,bottom: 150),
                child: Text(
                  'Bem-Vindo',
                  style: TextStyle(
                      fontSize: 25, color: Color.fromARGB(255, 248, 246, 246)),
                ),
              ),

              //LoginButton
              InitialButton(buttonText: 'Start Conversation',),

              //RegisterButton
              InitialButton(buttonText: 'Bluetooth Config',),


            ],
          ),
        ),
      ),
    );
  }
}
