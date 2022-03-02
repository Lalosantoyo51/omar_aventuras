
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:omar_aventuras/models/estados.dart';
import 'package:omar_aventuras/providers/esferas_provider.dart';
import 'package:provider/provider.dart';

class EsferasView extends StatelessWidget {
  const EsferasView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final esferas = Provider.of<EsferasProvider>(context);


    esferas.readJson(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Esferas'),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black,width: 1.5),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        hint: const Text(
                          'Selecionar ciudad',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        icon: Icon(Icons.arrow_downward),
                        items: esferas.estados
                            .map((item) =>
                            DropdownMenuItem<String>(
                              value: item.nombre,
                              child: Text(
                                item.nombre,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                            .toList(),
                        value: esferas.selectedValue,
                        onChanged: esferas.onChanged,
                        buttonHeight: 40,
                        buttonWidth: width,
                        itemHeight: 40,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: height/1.5,
                    width: width,
                    child:  GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: esferas.kGooglePlex,
                      onMapCreated: (GoogleMapController controller) {
                        esferas.controller.complete(controller);
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
