import 'package:flutter/material.dart';
import 'package:search_cep/models/result_cep.dart';
import 'package:search_cep/services/via_cep_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultar CEP'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[_buildSearcCepTextField()],
        ),
      ),
    );
  }

  var _searchCepController = TextEditingController();

  Widget _buildSearcCepTextField() {
    return TextField(
      decoration: InputDecoration(labelText: 'Cep'),
      controller: _searchCepController,
    );
  }

  Widget _buildSearchCepButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: RaisedButton(
          onPressed: () {
            _searchCep();
          },
          child: Text('Consultar'),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
      ),
    );
  }

  bool _loading = false;  
  bool _enableField = false;

  void _searching(bool enable) {
    setState(() {
      _loading = enable;
      _enableField = !enable;
    });
  }

Widget _circularLoading() {
  return Container(
    height: 15.0,
    width: 15.0,
    child:  CircularProgressIndicator(),
  );
}

Future _searchCep() async {
  final String cep = _searchCepController.text;
  final ResultCep = await ViaCepService.fetchCep(cep : cep);
  print(ResultCep.toJson());
}

}
