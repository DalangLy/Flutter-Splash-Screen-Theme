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
              bottom: 50,
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
