import 'package:flutter/cupertino.dart';

class Bird with ChangeNotifier
{
  static var _birdHeight=0.1;
  static var _birdWidth=0.1;
  static get getBirdHeight => _birdHeight;
  static get getBirdWidth => _birdWidth;
}