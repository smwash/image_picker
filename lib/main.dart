import 'package:flutter/material.dart';
import './screens/add_place_screen.dart';

import './providers/great_places.dart';
import 'package:provider/provider.dart';

import 'screens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GreatPlaces(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Visited Places',
        theme: ThemeData(
          fontFamily: 'NunitoSans',
        ),
        home: HomePage(),
        routes: {
          AddPlaceScreen.idPage: (context) => AddPlaceScreen(),
        },
      ),
    );
  }
}
