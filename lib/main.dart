import 'package:admin/constants.dart';
import 'package:admin/controllers/MenuController.dart';
import 'package:admin/provider/chamados_provider.dart';
import 'package:admin/routes/app_routes.dart';
import 'package:admin/screens/dashboard/components/chamados.dart';
import 'package:admin/screens/dashboard/components/chamados_formulario.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:image_picker/image_picker.dart';
//import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

void main() async {

/*  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); */


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
    providers: [
    ChangeNotifierProvider(
    create: (context) => MenuController(),
    ),
    ChangeNotifierProvider(
    create: (context) => ChamadosProviders(),
    ),
    ],

    child: MaterialApp(
    debugShowCheckedModeBanner: false,
    title: ' Sistema de Chamados',
    theme: ThemeData.dark().copyWith(
    scaffoldBackgroundColor: bgColor,
    textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: Colors.white),
    canvasColor: secondaryColor,
    ),

    routes: {
      AppRoutes.USER_FORM: (_) => ChamadosFormulario(),
      AppRoutes.HOME: (_) => MainScreen(),
    },
    ),
    );

  }
}
