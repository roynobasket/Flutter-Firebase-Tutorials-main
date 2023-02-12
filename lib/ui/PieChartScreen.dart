import 'package:flutter/material.dart';

class PieChartScreen extends StatelessWidget {
  final List<int> list;

  const PieChartScreen({Key? key, required this.list}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Report")),
      body: Column(
        children: [
          const Text("Your Report is as follow : "),
          Expanded(
              child: Image.network(
                  "https://quickchart.io/chart?c={ type: 'pie', data: { datasets: [ { data: [${list[0]},${list[1]},${list[2]},${list[3]},${list[4]},${list[5]},${list[6]}], backgroundColor: [ 'rgb(255, 99, 132)', 'rgb(255, 159, 64)', 'rgb(255, 205, 86)', 'rgb(75, 192, 192)', 'rgb(148, 0, 100)', 'rgb(0, 162, 235)', 'rgb(54, 162, 0)' ], label: 'Dataset 1', }, ], labels: ['Angry', 'Disgust', 'Fear', 'Happy','Neutral','Sad','Surprise'],},}"))
        ],
      ),
    );
  }
}
