import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'PieChartScreen.dart';

class historyScreen extends StatefulWidget {
  const historyScreen({Key? key}) : super(key: key);

  @override
  State<historyScreen> createState() => _historyScreenState();
}

class _historyScreenState extends State<historyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("flutter expression detection"),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("temp").snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            final userSnapshot = snapshot.data?.docs;
            if (userSnapshot!.isEmpty) {
              return const Text("no data");
            }
            return ListView.builder(
                itemCount: userSnapshot.length,
                itemBuilder: (context, index) {
                  String s = userSnapshot[index].id;
                  // print("User");
                  // print(userSnapshot[index]["Sad"]);
                  List<int> list = [
                    userSnapshot[index]['Angry'],
                    userSnapshot[index]['Disgust'],
                    userSnapshot[index]['Fear'],
                    userSnapshot[index]['Happy'],
                    userSnapshot[index]['Neutral'],
                    userSnapshot[index]['Sad'],
                    userSnapshot[index]['Surprise']
                  ];
                  return Expanded(
                    child: Container(
                      // margin: const EdgeInsets.symmetric(vertical: 10.0),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ListTile(
                        title: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PieChartScreen(list: list)));
                          },
                          child: Text(s),
                        ),
                        trailing: const Text("Date"),
                        // Text(userSnapshot[index]["Happy"]),
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
