import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}
// Obx
// class MyApp extends StatelessWidget {
//   final contC = Get.put(CountController());
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Obx(
//                 () => Text(
//                   'Angka ${contC.count}',
//                   style: TextStyle(
//                     fontSize: 35,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () => contC.increment(),
//         ),
//       ),
//     );
//   }
// }

// class CountController extends GetxController {
//   var count = 0.obs;

//   void increment() {
//     count++;
//   }
// }
// ----------------------------------------------------------------------
// GetX
// class MyApp extends StatelessWidget {
//   // final contC = Get.put(CountController()); // Obs
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               GetX<CountController>(  //GetX
//                 init: CountController(),
//                 builder: (c) {
//                   return Text(
//                     'Angka ${c.count}',
//                     style: TextStyle(
//                       fontSize: 35,
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           // onPressed: () => contC.increment(),  //Obs
//           onPressed: () => Get.find<CountController>().increment(), //GetX
//         ),
//       ),
//     );
//   }
// }

// class CountController extends GetxController {
//   var count = 0.obs;

//   void increment() {
//     count++;
//   }
// }

// ----------------------------------------------------------------

// GetXBuilder
// class MyApp extends StatelessWidget {
//   // final contC = Get.put(CountController()); // Obs
//   final contC = Get.put(CountController());
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               GetBuilder<CountController>(
//                 // init: CountController(), //jika pakai ini 
//                 builder: (_) {
//                   return Text(
//                     'Angka ${contC.count}',
//                     style: TextStyle(
//                       fontSize: 35,
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           // onPressed: () => contC.increment(),  //Obs
//           // onPressed: () => Get.find<CountController>().increment(), //GetX //jika pakai ini
//           onPressed: () => contC.increment(),
//         ),
//       ),
//     );
//   }
// }

// class CountController extends GetxController {
//   // var count = 0.obs;  //Obs & GetX
//   var count = 0;

//   void increment() {
//     count++;
//     update();
//   }
// }
//----------------------------------------------------------------------------------

// Get Builder
class MyApp extends StatelessWidget {
  final contC = Get.put(CountController());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder<CountController>(
                id: 'joni',
                builder: (_) {
                  return Text(
                    'joni ${contC.count}',
                    style: TextStyle(
                      fontSize: 35,
                    ),
                  );
                },
              ),
              GetBuilder<CountController>(
                id: 'panjul',
                builder: (_) {
                  return Text(
                    'panjul ${contC.count}',
                    style: TextStyle(
                      fontSize: 35,
                    ),
                  );
                },
              ),
              GetBuilder<CountController>(
                builder: (_) {
                  return Text(
                    'umum ${contC.count}',
                    style: TextStyle(
                      fontSize: 35,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => contC.increment(),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class CountController extends GetxController {
  var count = 0; //GetBuilder

  void increment() {
    count++;
    update(); //umum
    
    // update(['joni']); //joni
    // update(['joni', 'panjul']); //joni dan panjul
  }
}
