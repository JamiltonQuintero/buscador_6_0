import 'dart:math';

class BackendService {
  //lista de prueba para la caja de sugerencias 
  static Future<List> getSuggestions(String query) async {
    await Future.delayed(Duration(seconds: 1));

    return List.generate(3, (index) {
      return {'nombre': query + index.toString(), 'precio': Random().nextInt(100)};
    });
  }
}