import 'package:flutter/material.dart';

class Chamados {
  final String id;
  final String nome;
  final String descricao;
  final String status;


  const Chamados({
   this.id,
    @required this.nome,
    @required this.descricao,
    this.status,
  });

}

List<Chamados> loadChamadosItem(){
  var fi = <Chamados>[
    Chamados(
      id: '1',
      nome: 'jonathan',
      descricao: 'Computador com defeito',
    ),
    Chamados(
      id: '2',
      nome: 'Diego',
      descricao: 'Computador com defeito',
    ),
    Chamados(
      id: '3',
      nome: 'Lucas',
      descricao: 'Solicitação de backup',
    ),
    Chamados(
      id: '4',
      nome: 'Pedro',
      descricao: 'Perda do banco de dados',
    ),
    Chamados(
      id: '5',
      nome: 'Yan',
      descricao: 'Telefone mudo',
    ),
    Chamados(
      id: '6',
      nome: 'Calebe',
      descricao: 'Ponto sem rede',
    ),
  ];
  return fi;
}