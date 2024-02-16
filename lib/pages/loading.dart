import 'package:flutter/material.dart';
import 'package:time_zones_globally/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async  {
    WorldTime instance = WorldTime(location: 'Johannesburg', flag: 'South Africa', url: 'Africa/Johannesburg');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location':  instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: SpinKitWaveSpinner(
            color: Colors.lightBlueAccent,
            size: 70.0,
          ),
        ),
    );
  }
}
