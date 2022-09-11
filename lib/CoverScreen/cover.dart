import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/data.dart';
class Cover extends StatelessWidget 
{

  bool gamestart;
  // bool get gamestart => _gamestart;

  Cover({super.key,required this.gamestart});

  late String s;

  @override
  Widget build(BuildContext context) 
  {
    return Container
    (
      alignment: const Alignment(0,0.5),
      child:Text
      (
        gamestart? '' : 'T A P  T O  P L A Y',
        style: Theme.of(context).textTheme.displaySmall!.apply(color: Colors.white),
      ),
    );
  }
}