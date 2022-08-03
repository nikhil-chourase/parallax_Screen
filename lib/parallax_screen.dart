
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ParallaxScreen extends StatefulWidget {

  @override
  State<ParallaxScreen> createState() => _ParallaxScreenState();
}

class _ParallaxScreenState extends State<ParallaxScreen> {


  late ScrollController _scrollController;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController()..addListener(() {
      onScroll();

    });

  }
  double scrollOffset = 0.0;


  // layerSpeed

  double layer1Speed = 0.3;
  double layer2Speed = 0.4;
  double layer3Speed = 0.32;
  double layer4Speed = 0.275;
  double sunSpeed = 0.275;

  void onScroll(){
    setState((){
      scrollOffset = _scrollController.offset;
      print(scrollOffset);
    });



  }
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var layoutHeight = screenSize.height * 3;

    return Scaffold(
      body: Container(

        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 66, 248, 210),
              Color.fromARGB(255, 253, 244, 193),
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: screenSize.height *0.4+ (sunSpeed*scrollOffset),
              left: 0,
              right:screenSize.width*0.3 ,
              child: SvgPicture.asset('images/sun.svg'),
            ),
            Positioned(
              bottom: -30+layer4Speed * scrollOffset,
              left: 0,
              right: 0,
              child: SvgPicture.asset('images/mountains-layer-4.svg'),
            ),
            Positioned(
              bottom: -30+layer3Speed * scrollOffset,
              left: 0,
              right: 0,
              child: SvgPicture.asset('images/mountains-layer-2.svg'),
            ),
            Positioned(
              bottom:  -20+ layer2Speed *scrollOffset ,
              left: 0,
              right: 0,
              child: SvgPicture.asset('images/trees-layer-2.svg'),
            ),
            Positioned(
              bottom:  -55 + layer1Speed* scrollOffset  ,
                left: 0,
                right: 0,
                child: SvgPicture.asset('images/layer-1.svg'),
            ),
            Positioned(
              top:  screenSize.height + (layer1Speed* scrollOffset *-1) ,
              left: 0,
              right: 0,
              height: screenSize.height,
              child:Container(
                color: Colors.black,
                child: Center(
                  child: Text('this is Parallax',
                    style:TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                      color: Colors.white60,

                    ),
                  ),
                ),
              ),
            ),


            Positioned.fill(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: SizedBox(
                    height: layoutHeight,
                  ),
                ),
            ),

          ],
        ),
      ),
    );
  }
}
