import 'package:chatbot_prototype/screens/speech_screen.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class ListeningScreen extends StatefulWidget {
  const ListeningScreen({super.key});

  @override
  State<ListeningScreen> createState() => _ListeningScreenState();
}

class _ListeningScreenState extends State<ListeningScreen> {
  final SpeechToText speechToText = SpeechToText();
  String wordsSpoken = "";
  bool isListening = false;

  @override
  void initState() {
    super.initState();
    initSpeech();
  }

  void initSpeech() async {
    wordsSpoken = "";
    bool available = await speechToText.initialize(
      onError: (val) => _startListening(),
    );
    setState(() {});

    if (available) {
      isListening = true;
      _startListening();
    }
  }

  void _startListening() async {
    await speechToText.listen(onResult: _onSpeechResult);
  }

  void _onSpeechResult(result) {
    setState(() async {
      wordsSpoken = "${result.recognizedWords}";
      if (result.finalResult) {
        if (wordsSpoken != "") {
          final bool receivedValue = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SpeechScreen(spokenText: wordsSpoken)),
          );

          if (receivedValue != null) {
            isListening = receivedValue;
            if (isListening) {
              _startListening();
            }
          }
        } else {
          isListening = true;
          _startListening();
        }
      }
    });
  }

  @override
  void dispose() {
    isListening = false;
    speechToText.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.orangeAccent,
      child: Image.asset(
        'lib/assets/jake.gif',
        fit: BoxFit.fill,
      ),
    );
  }
}
