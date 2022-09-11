import 'package:flutter/cupertino.dart';

class Bird with ChangeNotifier
{
  final birdHeight=0.1;
  final birdWidth=0.1;
  get getBirdHeight => birdHeight;
  get getBirdWidth => birdWidth;
}