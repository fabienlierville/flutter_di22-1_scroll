import 'package:flutter/material.dart';
import 'package:scroll/models/activite.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
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

  initState(){
    super.initState();
    scrollController.addListener(infinityScroll);
  }

  infinityScroll(){
    print("Position = ${scrollController.position.pixels}");
    print("Taille Max = ${scrollController.position.maxScrollExtent}");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
      body: Scrollbar(
        thickness: 10,
        child: ListView.separated(
          controller: scrollController,
            itemCount: activites.length,
            separatorBuilder: (context, index) {
              if (index % 10 == 0 && index != 0) {
                return Container(height: 100, color: Colors.red);
              } else {
                return Divider();
              }
            },
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
                child: ListTile(
                  title: Text("Activité"),
                  subtitle: Text(activite.nom),
                  trailing: Icon(Icons.arrow_forward_ios),
                  leading: Icon(activite.icone),
                  onTap: () {
                    print(activite.nom);
                    //Une navigation vers une nouvelle page
                  },
                ),
              );
            }),
      ),
    );
  }
}
