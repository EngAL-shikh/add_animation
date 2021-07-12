import 'package:flutter/material.dart';
import 'package:smart_flare/smart_flare.dart';

class Home extends StatefulWidget {
  @override
  _FlareDemoState createState() => _FlareDemoState();
}

class _FlareDemoState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var animationWidth = 250.0;
    var animationHeight = 230.0;
    var animationWidthThirds = animationWidth / 3;
    var halfAnimationHeight =animationHeight / 2;

    var activeAreas = [

      ActiveArea(
          area: Rect.fromLTWH(0, 0,
              animationWidthThirds,
              halfAnimationHeight),
          //debugArea: true,
          guardComingFrom: ['deactivate'],
          animationName: 'camera_tapped'),

      ActiveArea(
          area: Rect.fromLTWH(
              animationWidthThirds, 0,
              animationWidthThirds,
              halfAnimationHeight),
          //debugArea: true,
          guardComingFrom: ['deactivate'],
          animationName: 'pulse_tapped'),

      ActiveArea(
          area: Rect.fromLTWH(
              animationWidthThirds * 2, 0,
              animationWidthThirds,
              halfAnimationHeight),
        //  debugArea: true,
          guardComingFrom: ['deactivate'],
          animationName: 'image_tapped'),

      ActiveArea(
          area: Rect.fromLTWH(
              0,
              animationHeight/2,
              animationWidth,
              animationHeight/2),
        //  debugArea: true,
          animationsToCycle: ['activate', 'deactivate'],
          onAreaTapped: () {
            print('Button tapped!');
          })
    ];


    return Scaffold(
        backgroundColor: Colors.white60,
        body: Stack(
          children: [

            Padding(

              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left:8.0 ,right: 8.0),
                    child: Row(
                      children: [
                        Icon(Icons.person_rounded
                          ,color: Colors.white
                          ,size: 25,),
                        Spacer(),
                        Icon(Icons.person_rounded
                          ,color: Colors.white
                          ,size: 25,),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(8)
                  ),

                  height: 60,
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: SmartFlareActor(
                  width: animationWidth,
                  height: animationHeight,
                  filename: 'assets/button-animation.flr',
                  startingAnimation: 'deactivate',
                  activeAreas: activeAreas,
                )),
          ],
        ));
  }
}
