import 'package:admin/provider/chamados_provider.dart';
import 'package:admin/routes/app_routes.dart';
import 'package:admin/screens/dashboard/components/chamados.dart';
import 'package:admin/screens/upload.dart';
import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'chamados_formulario.dart';
//import 'package:image_picker/image_picker.dart';
//import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';


class ChamadosTile extends StatelessWidget {

  final Chamados chamados;

  const ChamadosTile(this.chamados);

  


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(chamados.status, style: TextStyle(backgroundColor: Colors.black),),
      //CircleAvatar(child: Icon(Icons.person),),
      title: Text(chamados.nome),
      subtitle: Text(chamados.descricao, style: TextStyle(color: Colors.white),),
      trailing: Container(
        width: 150,
        child: Row(
          children: [
            IconButton(
              onPressed: (){
               /* Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Upload()
                )
                );*/
              },
              color: Colors.yellow,
              icon: Icon(Icons.file_upload),
            ),
            IconButton(
                onPressed: (){
                  Navigator.of(context).pushNamed(
                      AppRoutes.USER_FORM,
                    arguments: chamados,
                  );
                },
              color: Colors.orange,
                icon: Icon(Icons.edit),
            ),
            IconButton(
                onPressed: (){
                  showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text('Excluir Chamado'),
                        content: Text('Tem certeza?'),
                        actions: [
                          FlatButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: Text('Não'),
                          ),
                          FlatButton(
                              onPressed: (){
                                Provider.of<ChamadosProviders>(context, listen: false).remove(chamados);
                                Navigator.of(context).pop();
                              },
                              child: Text('Sim'),
                          ),
                        ],
                      ),
                  );

                },
              color: Colors.red,
                icon: Icon(Icons.delete),
            )
          ],
        ),
      ),
    );
  }
}
