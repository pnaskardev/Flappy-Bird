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
  static bool _isDead=false;
  
  bool get isDead => _isDead;

  set isDead(bool value)
  {
    _isDead = value;
    notifyListeners();
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

      if(_isDead==true)
      {
        // print('bird is dead');
      }


      if(birdDead()==true)
      {
        _isDead=true;
        notifyListeners();
        
        timer.cancel();
        _gameStarted=false;
        notifyListeners();
      }
      print(_birdY);
      _time+=0.01;
      notifyListeners();
    });
  }

  void printnum()
  {
    if(_isDead==true)
    {
      print('bird is dead');
    }
  }

  void jump()
  {
    
    _time=0;
    notifyListeners();
    // time(0);
    _intitalPos=_birdY;
    notifyListeners();
  }


   void resetGame()
  {
    _isDead=false;
    notifyListeners();
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