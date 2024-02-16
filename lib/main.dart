import 'package:flutter/material.dart';
import 'package:time_zones_globally/pages/choose_location.dart';
import 'package:time_zones_globally/pages/home.dart';
import 'package:time_zones_globally/pages/loading.dart';

void main() => runApp( MaterialApp(

  routes: {
    '/home': (context) =>  Home(),
    '/': (context) => Loading(),
    '/location': (context) =>  ChooseLocation(),
  },
));