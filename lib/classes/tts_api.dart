import 'package:flutter_tts/flutter_tts.dart';

class TtsApi {
  final FlutterTts _speech = FlutterTts();
  bool isSpeaking = false;
  Function? onCompletion;

  TtsApi() {
    _speech.setStartHandler(() {
      isSpeaking = true;
    });

    _speech.setCompletionHandler(() {
      isSpeaking = false;
      if (onCompletion != null) {
        onCompletion!();
      }
    });
  }

  void textToSpeech(String text) async {
    await _speech.setLanguage('pt-BR');
    await _speech.setVolume(0.5);
    await _speech.setSpeechRate(0.5);
    await _speech.setPitch(1);
    await _speech.speak(text);
  }
}