import 'package:flutter/material.dart';

class BNavigator extends StatefulWidget {
  final Function currentIndex;

  const BNavigator({Key? key, required this.currentIndex}) : super(key: key);

  @override
  State<BNavigator> createState() => _BNavigatorState();
}

class _BNavigatorState extends State<BNavigator> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: (int i) {
        setState(() {
          index = i;
          widget.currentIndex(i);
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Inicio",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "Busqueda",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: "Listado",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.how_to_vote),
          label: "Votar",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_chart),
          label: "Votos",
        ),
      ],
      type: BottomNavigationBarType.fixed,
    );
  }
}
