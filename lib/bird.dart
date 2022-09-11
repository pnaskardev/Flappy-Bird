import 'package:flappy_bird/providers/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class MyBird extends StatelessWidget 
{
  // ignore: prefer_typing_uninitialized_variables
  // final birdY;

  // const MyBird({super.key,this.birdY});

  @override
  Widget build(BuildContext context) 
  {
    return Container
    (
      alignment: Alignment(0,Provider.of<Data>(context,listen: false).birdY),
      child: Image.asset('Assets/bird.png',width: 50,),
    );
  }
}