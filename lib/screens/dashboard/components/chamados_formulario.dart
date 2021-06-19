import 'package:admin/provider/chamados_provider.dart';
import 'package:admin/screens/dashboard/components/chamados.dart';
import 'package:admin/screens/dashboard/components/chamados_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChamadosFormulario extends StatelessWidget {

  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(Chamados chamados){
    if (chamados != null) {
      _formData['nome'] = chamados.nome;
      _formData['descricao'] = chamados.descricao;
      _formData['status'] = chamados.status;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Chamados chamados = ModalRoute.of(context).settings.arguments;

    _loadFormData(chamados);

    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Chamados'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
              onPressed: (){
               final isValid = _form.currentState.validate();

                if(isValid){
                  _form.currentState.save();
                  Provider.of<ChamadosProviders>(context, listen: false).put(
                      Chamados(
                      nome: _formData['nome'],
                      status: _formData['status'],
                      descricao: _formData['descricao'],
                  ),
                  );

                  Navigator.pop(context);
                }
                },

          ),
        ],
      ),
      body: Padding(padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                initialValue: _formData['nome'],
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Nome inválido';
                  }
                },
                onSaved: (value) => _formData['nome'] = value,
              ),
              TextFormField(
                initialValue: _formData['descricao'],
                decoration: InputDecoration(labelText: 'Descrição'),
                onSaved: (value) => _formData['descricao'] = value,
              ),
              TextFormField(
                initialValue: _formData['status'],
                decoration: InputDecoration(labelText: 'status'),
                onSaved: (value) => _formData['status'] = value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
