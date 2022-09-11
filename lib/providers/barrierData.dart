import 'package:flutter/cupertino.dart';

class Barrier with ChangeNotifier
{
  static List<double> barX=[2,2+1.5];
  static double barWidth=0.5;
  List<List<double>>barHeight=
  [
    [0.6,0.4],
    [0.4,0.6],
  ];
}