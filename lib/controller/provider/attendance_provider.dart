
import 'package:flutter/material.dart';

class AttendanceProvider with ChangeNotifier{
  List<DateTime> puncInTime = [];
  List<DateTime> puncOutTime = [];
 
 String formateWorkingHours(DateTime time){
  return '${time.toLocal()}'.split('.').first;
 }
   
  String calculateWorkingHours(){
    Duration duration = const Duration();
    for(int i = 0; i<puncInTime.length; i++){
      if(i<puncOutTime.length){
        duration += puncOutTime[i].difference(puncInTime[i]);
      }
    }
    int hours = duration.inHours;
    int minutes = duration.inMinutes.remainder(60);
    return '$hours  hours $minutes minutes'; 
  }
}