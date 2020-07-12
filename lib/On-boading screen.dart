import 'package:ecatalog_app/customclipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:page_transition/page_transition.dart';
import 'login screen.dart';

class OnBoardScreen extends StatefulWidget {
  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  PageController controller = PageController();
  var currentPageValue = 0.0;
  List<String> imagelist = [
    "assets/images/img6.png",
    "assets/images/img7.png",
    "assets/images/img3.jpeg",
    "assets/images/img4.jpeg",
    "assets/images/img5.jpg",
  ];

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            color: Colors.transparent,
            height: 400,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              controller: controller,
              itemBuilder: (context, position) {
                print(position);
                return Transform(
                  transform: Matrix4.identity()
                    ..rotateX(currentPageValue - position),
                  child: ClipPath(
                    clipper: CustomShapeClipper(),
                    child: Container(
                      width: 400,
                      height: 400,
                      child: Image.asset(
                        imagelist[position],
                        fit: BoxFit.fill,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                );
              },
              itemCount: imagelist.length,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('Hello User',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                            color: Colors.black)),
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Text(
                        '“Fashion & Clothing is the one makes you look awesome and unique from others!”',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.grey,
                            wordSpacing: 2.0),
                      ),
                    ),
                  ]),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Container(
                  height: 100,
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.leftToRight,
                                child: LoginScreen()));
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.blue),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  height: 100,
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: PageIndicator(
                      layout: PageIndicatorLayout.DROP,
                      color: Colors.grey,
                      size: 10.0,
                      controller: controller,
                      space: 5.0,
                      count: imagelist.length,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  height: 100,
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
