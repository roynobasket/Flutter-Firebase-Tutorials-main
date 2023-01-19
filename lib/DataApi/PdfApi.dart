import 'dart:io';
// import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' ;
// import 'package:untitled1/DataApi/PieChart.dart';
// 0 Angry
// 1 Disgust
// 2 Fear
// 3 Happy
// 4 Neutral
// 5 Sad
// 6 Surprise
// class PdfApi {
//   static Future<File> generateCenteredText(var arr) async {
//     Map<String, double> dataMap = {
//       "Angry": arr[0],
//       "Disgust": arr[1],
//       "Fear": arr[2],
//       "Happy": arr[3],
//       "Neutral": arr[4],
//       "Sad":arr[5],
//       "Surprise":arr[6],
//     };
//     final pdf = Document();
//     pdf.addPage(Page(
//       build: (context) => Center(
//         child: Container(
//           child: ,
//         ),
//         // child: Text("", style: const TextStyle(fontSize: 48)),
//       ),
//     ));
//
//     return saveDocument(name: 'my_example.pdf', pdf: pdf);
//   }
//   Map<String, double> dataMap = {
//     "Food Items": 18.47,
//     "Clothes": 17.70,
//     "Technology": 4.25,
//     "Cosmetics": 3.51,
//     "Other": 2.83,
//   };
//
//   static Future<File> saveDocument({
//     required String name,
//     required Document pdf,
//   }) async {
//     final bytes = await pdf.save();
//
//     final dir = await getApplicationDocumentsDirectory();
//     final file = File('${dir.path}/$name');
//
//     await file.writeAsBytes(bytes);
//
//     return file;
//   }
//
//   static Future openFile(File file) async {
//     final url = file.path;
//     await OpenFile.open(url);
//   }
// }





// class PdfParagraphApi {
//
//   static Future<File> generate() async {
//     final pdf = Document();
//
//      final customFont =
//      Font.ttf(await rootBundle.load('assets/OpenSans-Regular.ttf'));
//
//     pdf.addPage(
//       Page(
//         build: (context) => Center(
//           // buildCustomHeader(),
//           SizedBox(height: 0.5 * PdfPageFormat.cm),
//           // Paragraph(
//           //   text:
//           //   'This is my custom font that displays also characters such as €, Ł, ...',
//           //   style: TextStyle(font: customFont, fontSize: 20),
//           // ),
//           // buildCustomHeadline(),
//           // buildLink(),
//           // ...buildBulletPoints(),
//           Header(child: Text('My Headline')),
//           Paragraph(text: LoremText().paragraph(60)),
//           Paragraph(text: LoremText().paragraph(60)),
//           Paragraph(text: LoremText().paragraph(60)),
//           Paragraph(text: LoremText().paragraph(60)),
//           Paragraph(text: LoremText().paragraph(60)),
//     ),
//         footer: (context) {
//           final text = 'Page ${context.pageNumber} of ${context.pagesCount}';
//
//           return Container(
//             alignment: Alignment.centerRight,
//             margin: EdgeInsets.only(top: 1 * PdfPageFormat.cm),
//             child: Text(
//               text,
//               style: TextStyle(color: PdfColors.black),
//             ),
//           );
//         },
//       ),
//     );
//     return PdfApi.saveDocument(name: 'my_example.pdf', pdf: pdf);
//   }
//
//   static Widget buildCustomHeader() => Container(
//     padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
//     decoration: BoxDecoration(
//       border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
//     ),
//     child: Row(
//       children: [
//         PdfLogo(),
//         SizedBox(width: 0.5 * PdfPageFormat.cm),
//         Text(
//           'Report ',
//           style: TextStyle(fontSize: 20, color: PdfColors.blue),
//         ),
//       ],
//     ),
//   );
//
//   static Widget buildCustomHeadline() => Header(
//     child: Text(
//       'My Third Headline',
//       style: TextStyle(
//         fontSize: 24,
//         fontWeight: FontWeight.bold,
//         color: PdfColors.white,
//       ),
//     ),
//     padding: EdgeInsets.all(4),
//     decoration: BoxDecoration(color: PdfColors.red),
//   );
//
//   static Widget buildLink() => UrlLink(
//     destination: 'https://flutter.dev',
//     child: Text(
//       'Go to flutter.dev',
//       style: TextStyle(
//         decoration: TextDecoration.underline,
//         color: PdfColors.blue,
//       ),
//     ),
//   );
//
//   static List<Widget> buildBulletPoints() => [
//     Bullet(text: 'First Bullet'),
//     Bullet(text: 'Second Bullet'),
//     Bullet(text: 'Third Bullet'),
//   ];
// }
