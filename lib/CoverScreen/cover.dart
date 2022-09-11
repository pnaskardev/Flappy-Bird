import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/data.dart';
class Cover extends StatefulWidget 
{
  const Cover({super.key});

  @override
  State<Cover> createState() => _CoverState();
}

class _CoverState extends State<Cover> 
{
  @override
  Widget build(BuildContext context) 
  {
    return Container
    (
      alignment: const Alignment(0,0.5),
      child:Text
      (
        // gameStarted ? '' : 'T A P  T O  P L A Y',
        Provider.of<Data>(context).gameStarted ? '' : 'T A P  T O  P L A Y',
        style: Theme.of(context).textTheme.displaySmall!.apply(color: Colors.white),
      ),
    );
  }
}