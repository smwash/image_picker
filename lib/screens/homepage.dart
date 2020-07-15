import 'package:flutter/material.dart';
import 'package:my_places/models/place.dart';
import 'package:my_places/providers/great_places.dart';
import 'package:my_places/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, AddPlaceScreen.idPage);
              }),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (context, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<GreatPlaces>(
                child: Center(
                    child: Text('No places added yet, start adding some')),
                builder: (context, places, child) => places.items.length <= 0
                    ? child
                    : ListView.builder(
                        itemCount: places.items.length,
                        itemBuilder: (context, index) {
                          Place visitedPlaces = places.items[index];
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: FileImage(visitedPlaces.image),
                            ),
                            title: Text(visitedPlaces.title),
                            onTap: () {
                              //TODO go to detail page.
                            },
                          );
                        }),
              ),
      ),
    );
  }
}
