import 'package:flutter/material.dart';
import '../MachineLearning/LiveScreen.dart';

class mainScreen extends StatelessWidget {
  const mainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.purple.shade300,
      theme: ThemeData(
          primarySwatch: Colors.deepPurple
      ),
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
                        MaterialPageRoute(builder: (context) => liveScreen()));
                  }),
              MyButton(
                  icon: Icons.video_call,
                  title: "Video Call",
                  fun: () {
                    print("Video Call");
                  }),
              MyButton(
                  icon: Icons.history,
                  title: "History   ",
                  fun: () {
                    print("History");
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

// import 'package:flutter/material.dart';
// import 'package:untitled1/MachineLearning/LiveScreen.dart';
//
// class mainScreen extends StatefulWidget {
//   const mainScreen({Key? key}) : super(key: key);
//
//   @override
//   State<mainScreen> createState() => _mainScreenState();
// }
//
// class _mainScreenState extends State<mainScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           // mainAxisSize: MainAxisSize.max,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextButton.icon(
//               onPressed: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => liveScreen()));
//               },
//               icon: const Icon(
//                 Icons.manage_accounts,
//                 size: 65,
//               ),
//               label: const Text(
//                 'Live',
//                 style: TextStyle(fontSize: 25),
//               ),
//             ),
//             TextButton.icon(
//                 onPressed: () {},
//                 icon: const Icon(
//                   Icons.video_call_sharp,
//                   size: 65,
//                 ),
//                 label: const Text(
//                   'Video Call',
//                   style: TextStyle(fontSize: 25),
//                 )),
//             TextButton.icon(
//                 onPressed: () {},
//                 icon: const Icon(
//                   Icons.history,
//                   size: 65,
//                 ),
//                 label: const Text(
//                   ' History',
//                   style: TextStyle(fontSize: 25),
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
// }
// // CustomContainer(
// //     {@required this.child, this.height, this.width, this.onTap, this.color});
// // class mainScreenButton extends StatelessWidget {
// //
// //   // mainScreenButton({Key? key}) : super(key: key);
// // mainScreenButton({required this.url,required this.title,required this.buttonFun});
// // final String url, title;
// // final Function buttonFun;
// //   @override
// //   Widget build(BuildContext context) {
// //     return InkWell(
// //       splashColor: Colors.black26,
// //       onTap: () {},
// //       child: Row(
// //         mainAxisSize: MainAxisSize.min,
// //         children: [
// //           Ink.image(
// //             image: NetworkImage(url),
// //             height: 80,
// //             width: 80,
// //             fit: BoxFit.cover,
// //           ),
// //           SizedBox(
// //             width: 10,
// //           ),
// //           Text(
// //             title,
// //             style: TextStyle(fontSize: 32, color: Colors.deepPurple),
// //           ),
// //           SizedBox(
// //             width: 10,
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
