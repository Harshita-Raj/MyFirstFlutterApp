import 'package:flutter/material.dart';

class CustomShapeClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    final Path path=Path();
    path.lineTo(0.0,size.height);
    var firstendpoint=Offset(size.width*.5,size.height-35.0);
    var firstcontrolpoint=Offset(size.width*0.25,size.height-50.0);
    path.quadraticBezierTo(firstcontrolpoint.dx, firstcontrolpoint.dy, firstendpoint.dx, firstendpoint.dy);

var secondendpoint=Offset(size.width,size.height-80.0);
var secondcontrolpoint=Offset(size.width*.75,size.height-10);
path.quadraticBezierTo(secondcontrolpoint.dx, secondcontrolpoint.dy, secondendpoint.dx, secondendpoint.dy);

    
    path.lineTo(size.width,0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
  

}