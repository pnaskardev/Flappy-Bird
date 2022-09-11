import 'dart:async';
import 'package:flutter/material.dart';

class Data with ChangeNotifier
{

  static double _birdY=0;
  double _intitalPos=_birdY;
  double _height=0.0;
  double _time=0.0;
  final _gravity=-4.9;
  final _velocity=3.5;
  bool _gameStarted=false;

  static List<double> barX=[2,2+1.5];
  static get getBarX => barX;

//  set setBarX(static barX) => this.barX = barX;
  static double barWidth=0.5;
 static get getBarWidth => barWidth;

//  set setBarWidth(static barWidth) => this.barWidth = barWidth;
  static List<List<double>>barHeight=
  [
    [0.6,0.4],
    [0.4,0.6],
  ];

  static get getbarHeight
  {
    return barHeight;
  }

  get getLen
  {
    return barX.length;
  }


 get birdY => _birdY;

 set birdY(_)
 {
  
   _birdY=_intitalPos-_height;
   notifyListeners();
 }

  get intitalPos => _intitalPos;

  set intitalPos( value)
  {
    _intitalPos = value;
    notifyListeners();
  }

  get height => _height;

  set height(_)
  {
    
     _height= _gravity*_time*_time+_velocity*_time;
     notifyListeners();
  }

  get time => _time;
  set time( value)
  {
    
    _time += value;
    notifyListeners();
  }

  get gravity => _gravity;

  get gameStarted => _gameStarted;

  void startGame()
  {
    _gameStarted=true;
    notifyListeners();
    // gameStarted(true);

    Timer.periodic(const Duration(milliseconds: 10),(timer)
    {
      _height= _gravity*_time*_time+_velocity*_time;
      notifyListeners();
      _birdY=_intitalPos-_height;
      notifyListeners();

      if(birdDead()==true)
      {
        timer.cancel();
        _gameStarted=false;
        notifyListeners();
        return;
      }
      print(_birdY);
      _time+=0.01;
      notifyListeners();

      moveMap();

    });
  }

  void moveMap()
  {
    for (int i=0;i<barX.length;i++)
    {
      barX[i]-=0.05;
      notifyListeners();


      if(barX[i]< -1.5)
      {
        barX[i]+=3;
        notifyListeners();
      }
    }
  }

  void jump()
  {
    
    _time=0;
    notifyListeners();
    _intitalPos=_birdY;
    notifyListeners();
  }


   void resetGame()
  {
    _birdY=0;
    notifyListeners();
    _gameStarted=false;
    notifyListeners();
    _time=0;
    notifyListeners();
    _intitalPos=_birdY;
    notifyListeners();
  }

  bool birdDead()
  {
    if(_birdY < -1 || _birdY>1)
    {
      return true;
    }
    return false;
  }





}