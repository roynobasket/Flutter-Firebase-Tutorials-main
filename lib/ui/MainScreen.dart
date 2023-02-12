import 'package:flutter/material.dart';
import 'package:untitled1/ui/historyScreen.dart';
import '../MachineLearning/LiveScreen.dart';

class mainScreen extends StatelessWidget {
  const mainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.purple.shade300,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Welcome")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyButton(
                  icon: Icons.broadcast_on_home,
                  title: "Go Live ",
                  fun: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const liveScreen()));
                  }),
              MyButton(
                  icon: Icons.history,
                  title: "History   ",
                  fun: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const historyScreen()));
                    // print("History");
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.fun,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final Function fun;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3),
      width: 180,
      child: ElevatedButton.icon(
        onPressed: () {
          fun();
        },
        icon: Icon(icon), //icon data for elevated button
        label: Text(title), //label text
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side:
                        BorderSide(color: Colors.purple.shade300, width: 2)))),
      ),
    );
  }
}
