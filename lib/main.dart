import 'package:flappy_bird/providers/barrierData.dart';
import 'package:flappy_bird/providers/birdData.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'providers/data.dart';
import 'homepage.dart';

void main() 
{
  runApp
  (
    MultiProvider
    (
      providers:
      [
        ChangeNotifierProvider(create: (_)=>Data()),
        ChangeNotifierProvider(create:(_)=> Barrier()),
        ChangeNotifierProvider(create: (_)=>Bird())
      ],
      child:const MyApp(),
    ),
    
    // const MyApp()
  );
}

class MyApp extends StatelessWidget 
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) 
  {
    //   return MultiProvider(providers: 
    //   [
    //     ChangeNotifierProvider(create: (_)=>Data(context))
    //   ],
    //   child: MaterialApp
    //   (
    //     theme: ThemeData
    //     (
    //       textTheme: GoogleFonts.poppinsTextTheme
    //       (
    //         Theme.of(context).textTheme,
          
    //       ),
    //     ),
    //     debugShowCheckedModeBanner: false,
    //     home: const HomePage(),
    //   ),
    // );
    return MaterialApp
    (
      theme: ThemeData
      (
        textTheme: GoogleFonts.poppinsTextTheme
        (
          Theme.of(context).textTheme,
        
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}