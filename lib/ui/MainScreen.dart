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
    return SafeArea(
      child: Scaffold(
        body: InkWell(
            // child: Column(
            //    mainAxisAlignment: MainAxisAlignment.center,
            //    // mainAxisSize: MainAxisSize.max,
            //   crossAxisAlignment: CrossAxisAlignment.stretch,
            //   children: [
            //     Ink.icon(
            //         onPressed: () {
            //           Navigator.push(context, MaterialPageRoute(builder: (context) => liveScreen()));
            //         },
            //         icon: const Icon(Icons.manage_accounts, size: 65, color: ,),
            //         label: const Text('Live' , style: TextStyle(fontSize: 25),),
            //     ),
            //     TextButton.icon(
            //         onPressed: () {},
            //         icon: const Icon(Icons.video_call_sharp,size: 65,),
            //         label: const Text('Video Call',style: TextStyle(fontSize: 25),)),
            //     TextButton.icon(
            //         onPressed: () {},
            //         icon: const Icon(Icons.history,size: 65,),
            //         label: const Text(' History',style: TextStyle(fontSize: 25),)),
            //   ],
            // ),

            ),
      ),
    );
  }
}
// CustomContainer(
//     {@required this.child, this.height, this.width, this.onTap, this.color});
class mainScreenButton extends StatelessWidget {

  // mainScreenButton({Key? key}) : super(key: key);
mainScreenButton({required this.url,required this.title,required this.buttonFun});
final String url, title;
final Function buttonFun;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.black26,
      onTap: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Ink.image(
            image: NetworkImage(url),
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 32, color: Colors.deepPurple),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
