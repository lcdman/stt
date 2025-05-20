import 'package:flutter/material.dart';
import 'package:speech_to_text_ultra/speech_to_text_ultra.dart';


/*
void main() {
    runApp(const SpeechToTextUltraWidgetImplementation());
}
*/
void main() {
    runApp(MyApp());
}


class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            home: const SpeechToTextUltraWidgetImplementation(),
        );
    }
}


class SpeechToTextUltraWidgetImplementation extends StatefulWidget {
    const SpeechToTextUltraWidgetImplementation({super.key});

    @override
    State<SpeechToTextUltraWidgetImplementation> createState() => _SpeechToTextUltraWidgetImplementationState();
}


class _SpeechToTextUltraWidgetImplementationState extends State<SpeechToTextUltraWidgetImplementation> {
    bool   mIsListening    = false;
    String mEntireResponse = '';
    String mLiveResponse   = '';

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar:          AppBar(
                backgroundColor: Colors.teal,
                centerTitle:     true,
                title:           const Text(
                    'Speech To Text Ultra',
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
                ),
            ),
            body: Center(
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            mIsListening
                                ? Text('$mEntireResponse $mLiveResponse', style: TextStyle(color: Colors.black, fontSize: 32.0),)
                                : Text(mEntireResponse,                   style: TextStyle(color: Colors.red,   fontSize: 32.0),),
                            const SizedBox(height: 20),
                            SpeechToTextUltra(
                                ultraCallback: (String liveText, String finalText, bool isListening) {
                                    setState(() {
                                        mLiveResponse   = liveText;
                                        mEntireResponse = finalText;
                                        mIsListening    = isListening;
                                    });
                                },
                                //toPauseIcon: const Icon(Icons.pause),
                                //toStartIcon: const Icon(Icons.mic),
                                //pauseIconColor: Colors.black,
                                //startIconColor: Colors.black,
                            ),
                            const SizedBox(
                                height: 10,
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
}