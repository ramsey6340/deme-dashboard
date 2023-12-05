import 'package:admin/constants.dart';
import 'package:admin/controllers/MenuAppController.dart';
import 'package:admin/providers/globalValueProvider.dart';
import 'package:admin/providers/sideMenuProvider.dart';
import 'package:admin/providers/statisticalInfoProvider.dart';
import 'package:admin/routes.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Deme dashboard',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => MenuAppController()),
          ChangeNotifierProvider(create: (context) => SideMenuProvider()),
          ChangeNotifierProvider(create: (context) => StatisticalInfoProvider()),
          ChangeNotifierProvider(create: (context) => GlobalValueProvider()),
        ],
        child: MainScreen(),
      ),
    );
  }
}
