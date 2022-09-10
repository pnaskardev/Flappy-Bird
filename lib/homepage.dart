import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:flappy_bird/bird.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget 
{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> 
{


  static double birdY=0;
  double intitalPos=birdY;
  double height=0.0;
  double time=0.0;
  double gravity=-4.9;
  double velocity=3.5;

  bool gameStarted=false;

  void startGame()
  {
    gameStarted=true;
    Timer.periodic(const Duration(milliseconds: 10),(timer)
    {
      height= gravity*time*time+velocity*time;
      setState(() 
      {
        birdY=intitalPos-height;
      });

      print(birdY);
      if(birdY < -1 || birdY>1)
      {
        timer.cancel();
      }
      time+=0.01;
    });
  }


  void jump()
  {
    time=0;
    intitalPos=birdY;
  }


  @override
  Widget build(BuildContext context) 
  {
    return GestureDetector
    (
      onTap: gameStarted?jump:startGame,
      child: Scaffold
      (
        body: Column
        (
          children: 
          [
            Expanded
            (
              flex: 3,
              child:Container
              (
                color: Colors.blue,
                child: Center
                (
                  child: Stack
                  (
                    
                    children: 
                    [
                      MyBird(birdY: birdY),
                      Container
                      (
                        alignment: const Alignment(0,0.5),
                        child:Text
                        (
                          gameStarted ? '' : 'T A P  T O  P L A Y',
                          style: GoogleFonts.poppins
                          (
                            textStyle: const TextStyle
                            (
                              color: Colors.white,
                              fontSize: 20,
                            )
                          ),

                        ),
                      )
                    ],
                  ),
                ),
              )
            ),
            Expanded
            (
              child: Container
              (
                color: Colors.brown,
              )
            )
          ],
        ),
      ),
    );
  }
}