import 'dart:math';

import 'package:admin/data/dummy_cadastro.dart';
import 'package:admin/screens/dashboard/components/chamados.dart';
import 'package:flutter/cupertino.dart';

class ChamadosProviders with ChangeNotifier{
 final Map<String, Chamados> _items = {...DUMMY_CADASTRO};

 List<Chamados> get all{
   return [..._items.values];
 }
 int get count {
   return _items.length;
 }

 Chamados byIndex(int i){
   return _items.values.elementAt(i);
 }

 void put(Chamados chamados){
   if (Chamados == null) {
     return;
   }
   
   if (chamados.id !=null &&
       chamados.id.trim().isNotEmpty &&
       _items.containsKey(chamados.id)) {
     _items.update(
       chamados.id,
           (_) => Chamados(
             id: chamados.id,
             nome: chamados.nome,
             descricao: chamados.descricao,
             status: chamados.status,
           ),
     );
   }  else{
     final id= Random().nextDouble().toString();
     _items.putIfAbsent(
       id,
           () => Chamados(
             id: id,
             nome: chamados.nome,
             descricao: chamados.descricao,
             status: chamados.status,
           ),
     );
   }
   notifyListeners();
 }

void remove(Chamados chamados){
   if (chamados!= null && chamados.id != null) {
     _items.remove(chamados.id);
     notifyListeners();
   }  
 }
}