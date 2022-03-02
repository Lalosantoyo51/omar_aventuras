import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:omar_aventuras/models/estados.dart';

class EsferasProvider with ChangeNotifier, DiagnosticableTreeMixin {
  List<EstadosModel> estados = [];
  EstadosModel estado =  EstadosModel(clave: '', nombre: '', coordenadas: '');
  String? selectedValue;

  Completer<GoogleMapController> controller = Completer();

   CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 12,
  );
   get kGooglePlex => _kGooglePlex;


  Future<void> cambiarPosicion(coordenadas) async {
    List<String> latlong =  coordenadas.split(",");
    double latitude = double.parse(latlong[0]);
    double longitude = double.parse(latlong[1]);
    print('lat ${latitude}');
    GoogleMapController controller2 = await controller.future;
    controller2.animateCamera(CameraUpdate.newCameraPosition( CameraPosition(
        target: LatLng(latitude, longitude),
        zoom: 12)));
    notifyListeners();
  }
  onChanged(value) {
    selectedValue = value as String;
    estado = estados.firstWhere((element) => element.nombre == selectedValue);
    print('el estado ${estado.nombre} ${estado.coordenadas}');
    if(estado.coordenadas != ''){
      cambiarPosicion(estado.coordenadas);

    }
    notifyListeners();
  }
  Future<void> readJson(context) async {
    if(estado.nombre == ''){
       _kGooglePlex = CameraPosition(
        target: LatLng(37.42796133580664, -122.085749655962),
        zoom: 12,
      );
    }
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/json/estados.json");
    final jsonResult = jsonDecode(data);
    estados =
        jsonResult.map<EstadosModel>((i) => EstadosModel.fromJson(i)).toList();
    notifyListeners();
  }

}
