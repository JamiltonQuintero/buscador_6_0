import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class Animacion extends StatefulWidget {
  @override
  _AnimacionState createState() => _AnimacionState();
}

class _AnimacionState extends State<Animacion> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.bottomCenter,

      //Imagen animada
      child: Lottie.asset('assets/lottie/6972-seo.json'),
    );

  }
}