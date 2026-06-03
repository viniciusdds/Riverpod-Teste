import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meu_app_riverpod/pages/login_page.dart';


import 'pages/home_page.dart';


void main(){
  runApp(
     const ProviderScope(
       child: MaterialApp(
          home: LoginScreen(),
       ),
     )
  );
}


// void main(){
//   runApp(
//     const ProviderScope(
//         child: MyApp()
//     )
//   );
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomePage(),
//     );
//   }
// }
