import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_shop_app/config/pallette.dart';
import 'package:plant_shop_app/pages/introduction_page.dart';
import 'package:plant_shop_app/pages/pannier.dart';
import 'package:plant_shop_app/pages/plant_interface.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context,orientation,deviceType) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: IntroductionPage(),
        );
      }
    );
  }
}


