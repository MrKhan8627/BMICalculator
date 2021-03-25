import 'dart:math';

class CalculateFunction{

CalculateFunction({this.height, this.weight});
final int height;
final int weight;
double _bmi;

String calculateBMI(){
  _bmi = weight/pow(height/100,2);
  return _bmi.toStringAsFixed(1);
}

String getResult(){
if (_bmi > 40){
  return 'Obese Class III';
}
else if (_bmi > 35 && _bmi <= 40){
    return 'Obese Class II';
  }
  else if (_bmi > 30 && _bmi <= 35){
    return 'Obese Class I';
  }
  else if (_bmi > 25 && _bmi <= 30){
    return 'Overweight';
  }
  else if (_bmi > 18.5 && _bmi <= 25){
    return 'Normal';
  }
  else if (_bmi > 17 && _bmi <= 18.5){
    return 'Mild Thinness';
  }
  else if (_bmi > 16 && _bmi <= 17){
    return 'Moderate Thinness';
  }
  else{
    return 'Severe Thinness';
  }
}

String getInterpretation(){
  if (_bmi > 40){
  return 'Obese Class III! You want to loose ur Weight...';
}
else if (_bmi > 35 && _bmi <= 40){
    return 'Obese Class II! You want to loose ur Weight...';
  }
  else if (_bmi > 30 && _bmi <= 35){
    return 'Obese Class I! You want to loose ur Weight...';
  }
  else if (_bmi > 25 && _bmi <= 30){
    return 'Overweight! You want to loose ur Weight...';
  }
  else if (_bmi > 18.5 && _bmi <= 25){
    return 'Normal! You have a normal body shape. Good job!';
  }
  else if (_bmi > 17 && _bmi <= 18.5){
    return 'Mild Thinness! You can eat a bit more...';
  }
  else if (_bmi > 16 && _bmi <= 17){
    return 'Moderate Thinness! You can eat a bit more...';
  }
  else{
    return 'Severe Thinness! You want to be Serious about ur self...';
  }
}
}