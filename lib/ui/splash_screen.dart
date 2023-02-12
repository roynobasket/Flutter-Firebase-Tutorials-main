import 'package:flutter/material.dart';
import 'package:untitled1/firebase_services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Expression Detection ',
              style: TextStyle(fontSize: 18,),
            ),
            Text(
              'and ',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Suggestion Application',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
