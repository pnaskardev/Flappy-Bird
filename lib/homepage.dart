import 'dart:async';
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

  void resetGame()
  {
    Navigator.pop(context);
    setState(() 
    {
      birdY=0;
      gameStarted=false;
      time=0;
      intitalPos=birdY;
    });
  }

  void _showDialogue() 
  {
    showDialog
    (
      context: context, builder: (BuildContext context)
      {
        return AlertDialog
        (
          backgroundColor: Colors.brown,
          title: Center
          (
            child: Text('G A M E   O V E R', style:Theme.of(context).textTheme.bodyLarge!.apply(color:Colors.white)),
          ),
          actions: 
          [
            GestureDetector
            (
              onTap: resetGame,
              child: ClipRRect
              (
                borderRadius: BorderRadius.circular(5),
                child: Center
                (
                  child: Container
                  (
                    padding: const EdgeInsets.all(7),
                    color: Colors.white,
                    child: Text('PLAY AGAIN',style:Theme.of(context).textTheme.bodyLarge!.apply(color:Colors.brown)),
                  ),
                ),
              ),
            )
          ],
        );
      }
    );
  }

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
      if(birdDead()==true)
      {
        timer.cancel();
        gameStarted=false;
        _showDialogue();
      }
      // print(birdY);
      time+=0.01;
    });
  }


  void jump()
  {
    time=0;
    intitalPos=birdY;
  }

  bool birdDead()
  {
     if(birdY < -1 || birdY>1)
    {
      return true;
    }
    return false;
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
                          style: Theme.of(context).textTheme.displaySmall!.apply(color: Colors.white),
                        ),
                      ),
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