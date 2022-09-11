import 'package:flappy_bird/providers/birdData.dart';
import 'package:flappy_bird/providers/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class MyBird extends StatelessWidget 
{
  const MyBird({super.key});

  @override
  Widget build(BuildContext context) 
  {

    // final double birdWidth=Provider.of<Bird>(context,listen: false).getBirdWidth;
    // final double birdHeight=Provider.of<Bird>(context,listen: false).getBirdHeight;
    final birdWidth=Bird.getBirdWidth;
    final birdHeight=Bird.getBirdHeight;

    return Container
    (
      alignment: Alignment(0,Provider.of<Data>(context,listen: false).birdY),
      child: Image.asset
      (
        'Assets/bird.png',
        width: MediaQuery.of(context).size.height*birdWidth/2,
        height: MediaQuery.of(context).size.height*3/4*birdHeight/2,
      ),
    );
  }
}