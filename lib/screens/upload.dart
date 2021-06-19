/*
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';


 class Upload extends StatefulWidget {


   @override
   _UploadState createState() => _UploadState();
 }

 class _UploadState extends State<Upload> {

   File _imagem;
   String _statusUpload = "Upload não iniciado";
   String _urlImagemRecuperada = null;

   Future _recuperarImagem(bool daCamera) async {

     File imagemSelecionada;
     if (daCamera) {
       imagemSelecionada = await ImagePicker.pickImage(source: ImageSource.camera);
     }else{
       imagemSelecionada = await ImagePicker.pickImage(source: ImageSource.gallery);
     }
     setState(() {
       _imagem = imagemSelecionada;
     });


   }
    Future _uploadImagem() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference pastaRaiz = storage.ref();
    Reference arquivo = pastaRaiz.child("Chamados").child("Chamado001");

    UploadTask task = arquivo.putFile(_imagem);

    task.snapshotEvents.listen((TaskSnapshot taskSnapshot){
      if ( taskSnapshot.state == TaskState.running) {
        setState(() {
          _statusUpload= "Em progresso";
        });
      } else if(taskSnapshot.state == TaskState.success){
        _recuperarUrlImagem(taskSnapshot);
        setState(() {
          _statusUpload = "Upload realizado com sucesso!";
        });
      }
    });

  }

  Future _recuperarUrlImagem( TaskSnapshot tasksnapshot) async {
     String url = await tasksnapshot.ref.getDownloadURL();

     setState(() {
       _urlImagemRecuperada = url;
     });
  }


   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text("Anexar imagem"),
       ),
       body: SingleChildScrollView(
         child: Column(
           children: [
             Text(_statusUpload),
             RaisedButton(
               child: Text("Câmera"),
               onPressed: (){
                 _recuperarImagem(true);
               },
               color: Colors.blue,


             ),
             RaisedButton(
               child: Text("Galeria"),
               onPressed: (){
                 _recuperarImagem(false);
               },
               color: Colors.green,
             ),
             _imagem == null
             ? Container() : Image.file(_imagem),
             _imagem == null
                 ? Container()
                 :RaisedButton(
               child: Text("Upload"),
               onPressed: (){
                 _uploadImagem();
               },
               color: Colors.green,
             ),
             _urlImagemRecuperada == null
             ? Container()
                 : Image.network(_urlImagemRecuperada)
           ],
         ),
       ),
     );
   }
 }

*/

