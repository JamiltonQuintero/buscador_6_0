import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'data.dart';
import 'lotti_animacion.dart';
import 'bienvenida_nombre.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   
    return _MyApp();
  }
}

class _MyApp extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(

        appBar: AppBar(
          title: Text("Search/Busqueda"),
        ),

        body: Stack(
          children: <Widget>[
            Animacion(),
            BienvenidaNombre(),
            Container(

              child: Center(
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    //Input de busqueda
                    child: TypeAheadField(
                      suggestionsBoxDecoration:  SuggestionsBoxDecoration(
                          elevation: 15.0
                      ),
                        transitionBuilder: (context, suggestionsBox, animationController) =>
                            FadeTransition(
                              child: suggestionsBox,
                              opacity: CurvedAnimation(
                                  parent: animationController,
                                  curve: Curves.fastOutSlowIn
                              ),
                            ),
                      textFieldConfiguration: TextFieldConfiguration(
                          autofocus: false,
                          style: DefaultTextStyle.of(context).style.copyWith(
                              fontStyle: FontStyle.normal,
                          ),
                          decoration: InputDecoration(

                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                              hintText: ("Que estas buscando?"),
                              labelStyle: TextStyle(
                                color: Colors.blueAccent,
                              ),
                              hintStyle: TextStyle(
                                color: Colors.black
                              ),


                          )
                      ),
                      suggestionsCallback: (pattern) async {
                        //aqui podemos hacer los callback de la http
                        return await BackendService.getSuggestions(pattern);
                      },
                      // estas son las recomendacions que le apareceran al usuario
                      itemBuilder: (context, suggestion) {
                        return ListTile(
                          leading: Icon(Icons.search),
                          title: Text(suggestion['nombre']),
                          subtitle: Text('\$${suggestion['precio']}'),
                        );
                      },
                      onSuggestionSelected: (suggestion) {
                        //aqui es lo que sucedera cuando el usuario de click
                        print(suggestion);
                      },
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}