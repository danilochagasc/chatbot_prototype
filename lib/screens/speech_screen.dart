import 'package:chatbot_prototype/classes/chatGPT_api.dart';
import 'package:chatbot_prototype/classes/tts_api.dart';
import 'package:flutter/material.dart';

class SpeechScreen extends StatefulWidget {
  final String spokenText;
  const SpeechScreen({super.key, required this.spokenText});

  @override
  State<SpeechScreen> createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  final TtsApi ttsApi = TtsApi();
  final ChatGptApi chatGptApi = ChatGptApi();
  String response = "";

  getResponse() async {
    response = await chatGptApi.getGptResponse(widget.spokenText);
    setState(() {
      ttsApi.textToSpeech(response);
    });
  }



  @override
  void initState() {
    super.initState();
    ttsApi.textToSpeech(widget.spokenText);
    getResponse();
    ttsApi.onCompletion = () {
      Future.delayed(const Duration(seconds: 1));
      Navigator.pop(context, true);
    };

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.orangeAccent,
      child: Image.asset(
        'lib/assets/talking.gif',
        fit: BoxFit.fill,
      ),
    );
  }
}
