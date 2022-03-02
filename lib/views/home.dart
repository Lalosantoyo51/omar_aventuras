import 'package:flutter/material.dart';
import 'package:omar_aventuras/views/donaciones.dart';
import 'package:omar_aventuras/views/esferas.dart';
import 'package:omar_aventuras/views/info.dart';
import 'package:omar_aventuras/views/noticias.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageIndex = 0;

  final pages = [
    const InfoView(),
    const EsferasView(),
    const DonacionesView(),
    const NoticiasView(),

  ];
  void _onTap(int index)
  {
    pageIndex = index;
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xffC4DFCB),

      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Esferas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Donaciones',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Noticias',
          ),
        ],
        currentIndex: pageIndex,
        unselectedItemColor: Colors.grey,
        onTap: _onTap,
        elevation: 15,
      )
    );
  }
}