import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/ui/historyScreen.dart';
import '../main.dart';

class liveScreen extends StatefulWidget {
  const liveScreen({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

var arr = [0, 0, 0, 0, 0, 0, 0];

/*
0 Angry
1 Disgust
2 Fear
3 Happy
4 Neutral
5 Sad
6 Surprise
*/
class _HomeState extends State<liveScreen> {
  // final databaseRef = FirebaseDatabase.instance.ref('Post');
  int cam = 0;

  CameraImage? cameraImage;
  CameraController? cameraController;
  String output = '';

  loadModel() async {
    Tflite.loadModel(
      model: 'assets/model/tmodel.tflite',
      labels: 'assets/model/labels.txt',
    );
  }

  loadCamera() {
    cameraController = CameraController(cameras![cam], ResolutionPreset.medium);
    cameraController!.initialize().then((value) {
      if (!mounted) {
        return;
      } else {
        setState(() {
          cameraController!.startImageStream((imageStream) {
            cameraImage = imageStream;
            runModel();
          });
        });
      }
    });
  }

  runModel() async {
    if (cameraImage != null) {
      var predictions = await Tflite.runModelOnFrame(
          bytesList: cameraImage!.planes.map((plane) {
            return plane.bytes;
          }).toList(),
          imageHeight: cameraImage!.height,
          imageWidth: cameraImage!.width,
          imageMean: 127.5,
          imageStd: 127.5,
          rotation: 90,
          numResults: 7,
          threshold: 0.1,
          asynch: true);
      output = '';
      for (var element in predictions!) {
        output += element['label'].toString().substring(0, 1).toUpperCase() +
            element['label'].toString().substring(1) +
            " " +
            (element['confidence'] as double).toStringAsFixed(2) +
            '\n';
      }
      setState(() {
        updateStatus(output);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadCamera();
    loadModel();
  }

  @override
  void dispose() async {
    super.dispose();

    await Tflite.close();
    cameraController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recognition using Camera'),
      ),
      body: Column(children: [
        const Text('Bring your face here'),
        Align(
          alignment: Alignment.topRight,
          child: SizedBox(
            height: 25.0,
            width: 45.0,
            child: ElevatedButton(
              onPressed: () {
                if (cam == 1) {
                  cam = 0;
                } else {
                  cam = 1;
                }
                loadCamera();
              },
              child: const Text(
                '🔄',
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            height: 25.0,
            width: 45.0,
            child: ElevatedButton(
              onPressed: () {
                uploadStatus();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const historyScreen()));
              },
              // icon: const Icon(Icons.stop_circle_outlined),
              child: const Text(
                '🛑',
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width,
            child: !cameraController!.value.isInitialized
                ? Container()
                : AspectRatio(
                    aspectRatio: cameraController!.value.aspectRatio,
                    child: CameraPreview(cameraController!),
                  ),
          ),
        ),
        Container(
          width: 300,
          height: 90,
          padding: const EdgeInsets.all(12),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.purple.shade300,
            // border: Border.all(color: Colors.deepPurpleAccent, width: 4.0),
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Text(
            output,
            style: const TextStyle(fontSize: 20, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ]),
    );
  }
}

void uploadStatus() {
  FirebaseFirestore.instance.collection('temp').add({
    "Angry": arr[0],
    "Disgust": arr[1],
    "Fear": arr[2],
    "Happy": arr[3],
    "Neutral": arr[4],
    "Sad": arr[5],
    "Surprise": arr[6]
  });
  arr = [0, 0, 0, 0, 0, 0, 0];
}

Future<void> updateStatus(String output) async {
  if (output[0] == "0") {
    arr[0]++;
  }
  else if (output[0] == "1") {
    arr[1]++;
  }
  else if (output[0] == "2") {
    arr[2]++;
  }
  else if (output[0] == "3") {
    arr[3]++;
  }
  else if (output[0] == "4") {
    arr[4]++;
  }
  else if (output[0] == "5") {
    arr[5]++;
  }
  else {
    arr[6]++;
  }
}