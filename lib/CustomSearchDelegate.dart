import 'package:admin/screens/dashboard/components/chamados.dart';
import 'package:admin/screens/dashboard/components/chamados_tile.dart';
import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String>{
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: (){
          query = "";
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {

    return  IconButton(
      onPressed: (){
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    final mylist = query.isEmpty?  loadChamadosItem()
        : loadChamadosItem().where((p)=>p.nome.toLowerCase().startsWith(query.toLowerCase())).toList();


    return mylist.isEmpty? Center(child: Text('Nenhum chamado encontrado!')): ListView.builder(
        itemCount: mylist.length,
        itemBuilder:(context, index){
          final Chamados listItem = mylist[index];
          return ListTile(title:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(listItem.nome),
              Text(listItem.descricao),
              Divider()
            ],
          ),);
        });
  }
 
}
