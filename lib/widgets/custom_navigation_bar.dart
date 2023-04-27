import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart' show UIProvider;

class CustomNavigationBar extends StatelessWidget {

  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProvider>(context);

    return BottomNavigationBar(
      currentIndex: uiProvider.selectedMenuOption,
      items: const [
        BottomNavigationBarItem(
          label: 'Mapa',
          icon: Icon(Icons.map)
        ),
        BottomNavigationBarItem(
          label: 'Direcciones',
          icon: Icon(Icons.compass_calibration)
        ),
      ],
      elevation: 0,
      onTap: (int option) => uiProvider.selectedMenuOption = option
    );
  }

}