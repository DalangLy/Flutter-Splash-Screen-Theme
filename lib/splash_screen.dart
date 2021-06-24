import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 128,
              height: 128,
              child: Image(
                image: AssetImage('assets/development_only/splash1.png'),
              ),
            ),
            Positioned(
              bottom: 150,
              child: SizedBox(
                width: 250.0,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 30.0,
                    color: Colors.black,
                    fontFamily: 'Bobbers',
                  ),
                  child: AnimatedTextKit(
                    totalRepeatCount: 1,
                    animatedTexts: [
                      TyperAnimatedText(
                        'ATECH',
                        speed: const Duration(milliseconds: 200),
                        textAlign: TextAlign.center
                      ),
                    ],
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
