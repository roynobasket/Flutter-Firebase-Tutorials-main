import 'package:flutter/material.dart';
import 'package:untitled1/MachineLearning/LiveScreen.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({Key? key}) : super(key: key);

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Stack(children: [
            Container(
              height: 100,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton.icon(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => liveScreen()));
                    },
                    icon: const Icon(Icons.manage_accounts),
                    label: const Text('Live')),
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.video_call_sharp),
                    label: const Text('Video Call')),
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.history),
                    label: const Text(' History')),
              ],
            )
          ]),
        ],
      ),
    );
  }
}
