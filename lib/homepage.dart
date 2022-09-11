import 'package:flappy_bird/CoverScreen/cover.dart';
import 'package:flappy_bird/bird.dart';
import 'package:flappy_bird/providers/birdData.dart';
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
  
  @override
  Widget build(BuildContext context) 
  {

    double birdWidth=Provider.of<Bird>(context).getBirdWidth;
    double birdHeight=Provider.of<Bird>(context).getBirdHeight;
    double birdY=Provider.of<Data>(context).birdY;

    int len=Provider.of<Data>(context).getLen;
    List barX=Data.getBarX;
    double barWidth=Data.getBarWidth;
    List<List<double>> barHeight=Data.getbarHeight;
    bool colDead()
    {
      for(int i=0;i<len;i++)
      {
        if(barX[i]<=birdWidth && barX[i]+barWidth>=birdWidth && (birdY<=-1+barHeight[i][0] || 
        birdY+birdHeight>=1-barHeight[i][1]))
        {
          return true;
        }
      }
      return false;
    }

    return GestureDetector
    (
      onTap: () 
      {
        if(Provider.of<Data>(context,listen: false).gameStarted==true && Provider.of<Data>(context,listen: false).birdDead()==false && colDead()==false)
        {
          print('game already started');
          Provider.of<Data>(context,listen: false).jump();
        }  
        else if(Provider.of<Data>(context,listen: false).gameStarted==false && Provider.of<Data>(context,listen: false).birdDead()==false && colDead()==false)
        {
          print('game started just now');
          Provider.of<Data>(context,listen: false).startGame();
        }
        if(Provider.of<Data>(context,listen: false).birdDead()==true || colDead()==true)
        {
          print('bird is dead');
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
                    onTap:(() 
                    {
                      Provider.of<Data>(context,listen: false).resetGame();
                      Navigator.pop(context);  
                    }),
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
                      Cover(gamestart: Provider.of<Data>(context).gameStarted ? true : false,),
                      
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