import 'package:flutter/material.dart';
class MyBarrier extends StatelessWidget 
{

  // ignore: prefer_typing_uninitialized_variables
  final barWidth;
  // ignore: prefer_typing_uninitialized_variables
  final barHeight;
  // ignore: prefer_typing_uninitialized_variables
  final barX;
  final bool isThisBottomBarrier;
  

  const MyBarrier
  (
    {
      super.key,
      this.barWidth,
      this.barHeight,
      this.barX,
      required this.isThisBottomBarrier
    }
  );

  @override
  Widget build(BuildContext context) 
  {
    return Container
    (
      alignment: Alignment((2*barX+barWidth)/(2-barWidth),
      isThisBottomBarrier ? 1 : -1),
      child: Container
      (
        color:Colors.green,
        width: MediaQuery.of(context).size.width*barWidth/2,
        height: MediaQuery.of(context).size.height*3/4*barHeight/2,
      ),
    );
  }
}