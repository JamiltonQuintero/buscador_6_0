import 'package:flutter/material.dart';

class BienvenidaNombre extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    //label nombre empresa
    final nombre = Container(
      margin: EdgeInsets.only(
        top: 15.0,

      ),
      child: Text(
          "57Blocks",
          style: TextStyle(

              fontFamily: "Concert_One",
              fontSize: 40.0,
              fontWeight: FontWeight.w900
          ),
          textAlign: TextAlign.center

      ),
    );

    // label para bienvenida
    final bienvenida = Container(

      margin: EdgeInsets.only(
          top: 40.0,
          left: 45.0,
          right: 20.0
      ),
      child: Text(

        "Bienvenidos a",
        style: TextStyle(

            fontFamily: "Concert_One",
            fontSize: 50.0,
            fontWeight: FontWeight.w900
        ),
        textAlign: TextAlign.center

        ,
      ),
    );



    return Column(

      children: <Widget>[

        bienvenida,
        nombre
      ],
    );
  }
}