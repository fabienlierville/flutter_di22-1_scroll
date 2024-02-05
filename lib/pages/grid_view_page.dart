import 'package:flutter/material.dart';
import 'package:scroll/models/activite.dart';

class GridViewPage extends StatefulWidget {
  const GridViewPage({super.key});

  @override
  State<GridViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<GridViewPage> {
  List<Activite> activites = [
    Activite(nom: "Vélo", icone: Icons.directions_bike),
    Activite(nom: "Peinture", icone: Icons.palette),
    Activite(nom: "Golf", icone: Icons.golf_course),
    Activite(nom: "Arcade", icone: Icons.gamepad),
    Activite(nom: "Bricolage", icone: Icons.build),
    Activite(nom: "Vélo", icone: Icons.directions_bike),
    Activite(nom: "Peinture", icone: Icons.palette),
    Activite(nom: "Golf", icone: Icons.golf_course),
    Activite(nom: "Arcade", icone: Icons.gamepad),
    Activite(nom: "Bricolage", icone: Icons.build),
    Activite(nom: "Vélo", icone: Icons.directions_bike),
    Activite(nom: "Peinture", icone: Icons.palette),
    Activite(nom: "Golf", icone: Icons.golf_course),
    Activite(nom: "Arcade", icone: Icons.gamepad),
    Activite(nom: "Bricolage", icone: Icons.build),
    Activite(nom: "Vélo", icone: Icons.directions_bike),
    Activite(nom: "Peinture", icone: Icons.palette),
    Activite(nom: "Golf", icone: Icons.golf_course),
    Activite(nom: "Arcade", icone: Icons.gamepad),
    Activite(nom: "Bricolage", icone: Icons.build),
    Activite(nom: "Vélo", icone: Icons.directions_bike),
    Activite(nom: "Peinture", icone: Icons.palette),
    Activite(nom: "Golf", icone: Icons.golf_course),
    Activite(nom: "Arcade", icone: Icons.gamepad),
    Activite(nom: "Bricolage", icone: Icons.build),
    Activite(nom: "Vélo", icone: Icons.directions_bike),
    Activite(nom: "Peinture", icone: Icons.palette),
    Activite(nom: "Golf", icone: Icons.golf_course),
    Activite(nom: "Arcade", icone: Icons.gamepad),
    Activite(nom: "Bricolage", icone: Icons.build),
    Activite(nom: "Vélo", icone: Icons.directions_bike),
    Activite(nom: "Peinture", icone: Icons.palette),
    Activite(nom: "Golf", icone: Icons.golf_course),
    Activite(nom: "Arcade", icone: Icons.gamepad),
    Activite(nom: "Bricolage", icone: Icons.build),
  ];

  ScrollController scrollController = ScrollController();

  initState() {
    super.initState();
    scrollController.addListener(infinityScroll);
  }

  infinityScroll() {
    print("Position = ${scrollController.position.pixels}");
    print("Taille Max = ${scrollController.position.maxScrollExtent}");
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent * 0.95) {
      print("JE suis à 95% du scroll, Appel API de la page x+1");
      print("setState pour refresh la vue");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView"),
      ),
      body: Scrollbar(
        thickness: 10,
        child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            controller: scrollController,
            itemCount: activites.length,
            itemBuilder: (context, index) {
              Activite activite = activites[index];
              return Dismissible(
                background: Container(
                    color: Colors.red,
                    child: Text(
                      "Supprimer",
                    )),
                secondaryBackground: Container(
                    color: Colors.green,
                    child: Text(
                      "Archiver",
                      textAlign: TextAlign.right,
                    )),
                onDismissed: (direction) {
                  setState(() {
                    if (direction == DismissDirection.endToStart) {
                      activites.removeAt(index);
                      // Archiver le mail
                    } else {
                      activites.removeAt(index);
                      // supprimer le mail
                    }
                  });
                },
                key: Key(activite.nom),
                child: GridTile(
                  header: Text("Activité", textAlign: TextAlign.center,),
                  footer: Text(activite.nom,textAlign: TextAlign.center),
                  child: Icon(activite.icone, size: 40,),
                ),
              );
            }),
      ),
    );
  }
}
