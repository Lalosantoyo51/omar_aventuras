import 'package:flutter/material.dart';

class DonacionesView extends StatelessWidget {
  const DonacionesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Donaciones'),
          centerTitle: true,
        ),
      ),
    );
  }
}
