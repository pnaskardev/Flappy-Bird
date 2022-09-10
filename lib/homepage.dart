import 'package:flappy_bird/bird.dart';
import 'package:flappy_bird/providers/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget 
{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> 
{

  // ignore: non_constant_identifier_names
  Function StartOrJump()
  {
    print(Provider.of<Data>(context,listen: false).birdY);


    if(Provider.of<Data>(context,listen: false).gameStarted==true)
    {
      return Provider.of<Data>(context,listen: false).jump;
    }
    return Provider.of<Data>(context,listen: false).startGame;
  }

  // // ignore: non_constant_identifier_names
  // void ResetGame()
  // {
  //   Provider.of<Data>(context,listen: false).resetGame;
  // }
  @override
  Widget build(BuildContext context) 
  {
    return GestureDetector
    (
      onTap: () 
      {
        if(Provider.of<Data>(context,listen: false).gameStarted==true && Provider.of<Data>(context,listen: false).isDead==false)
        {
          print('game already started');
          Provider.of<Data>(context,listen: false).jump();
        }  
        else if(Provider.of<Data>(context,listen: false).gameStarted==false && Provider.of<Data>(context,listen: false).isDead==false)
        {
          print('game started just now');
          Provider.of<Data>(context,listen: false).startGame();
        }
        else if(Provider.of<Data>(context,listen: false).gameStarted==true && Provider.of<Data>(context,listen: false).isDead==true)
        {
          
        }
        Provider.of<Data>(context,listen: false).printnum;
      },
      
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
                      MyBird(),
                      Container
                      (
                        alignment: const Alignment(0,0.5),
                        child:Text
                        (
                          // gameStarted ? '' : 'T A P  T O  P L A Y',
                          Provider.of<Data>(context).gameStarted ? '' : 'T A P  T O  P L A Y',
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