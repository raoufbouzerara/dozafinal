import 'package:dozafinal/Helpers/databasehelper.dart';
import 'package:dozafinal/Helpers/databasehelper.dart';
import 'package:dozafinal/Models/medecament.dart';
import 'package:flutter/material.dart';

class NewMedecament extends StatefulWidget {
  @override
  _NewMedecamentState createState() => _NewMedecamentState();
}

class _NewMedecamentState extends State<NewMedecament> {
  final _medecamentController = TextEditingController();
  final _laboratoireController = TextEditingController();
  final _presentationController = TextEditingController();
  final _ciController = TextEditingController();
  final _cmaxController = TextEditingController();
  final _cminController = TextEditingController();
  final _vflaconcontroller = TextEditingController();
  final _prixcontroller = TextEditingController();
  final _formkey = new GlobalKey<FormState>();
  final DBhelper dbmanager = new DBhelper();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return SingleChildScrollView(
      child: Form(
        key: _formkey,
        child: Card(
          elevation: 3,
          child: Container(
            padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: mediaQuery.viewInsets.bottom + 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextFormField(
                  onSaved: (val) => _medecamentController.text = val,
                  controller: _medecamentController,
                  validator: (val) =>
                      val.isNotEmpty ? null : 'should not be empty!',
                  decoration: const InputDecoration(
                    labelText: 'Medecament',
                  ),
                ),
                TextFormField(
                  onSaved: (val) => _laboratoireController.text = val,
                  validator: (val) =>
                      val.isNotEmpty ? null : 'should not be empty!',
                  controller: _laboratoireController,
                  decoration: const InputDecoration(
                    labelText: 'Laboratoire',
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      flex:2,
                      fit: FlexFit.tight,
                      child: TextFormField(
                        onSaved: (val) => _presentationController.text = val,
                        validator: (val) =>
                            val.isNotEmpty ? null : 'should not be empty!',
                        controller: _presentationController,
                        decoration: const InputDecoration(
                          labelText: 'Presentation',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Flexible(
                      flex:3,
                      fit: FlexFit.tight,
                      child: TextFormField(
                        onSaved: (val) => _vflaconcontroller.text = val,
                        validator: (val) =>
                        val.isNotEmpty ? null : 'should not be empty!',
                        controller: _vflaconcontroller,
                        decoration: const InputDecoration(
                          labelText: 'Volume de Flacon',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Flexible(
                      flex:2,
                      fit: FlexFit.tight,
                      child: TextFormField(
                        onSaved: (val) => _prixcontroller.text = val,
                        validator: (val) =>
                        val.isNotEmpty ? null : 'should not be empty!',
                        controller: _prixcontroller,
                        decoration: const InputDecoration(
                          labelText: 'Prix de MG',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: TextFormField(
                        onSaved: (val) => _ciController.text = val,
                        validator: (val) =>
                            val.isNotEmpty ? null : 'should not be empty!',
                        decoration: const InputDecoration(
                          labelText: 'CI',
                        ),
                        controller: _ciController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: TextFormField(
                        onSaved: (val) => _cmaxController.text =val,
                        validator: (val) =>
                            val.isNotEmpty ? null : 'should not be empty!',
                        decoration: const InputDecoration(
                          labelText: 'C Max',
                        ),
                        controller: _cmaxController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: TextFormField(
                        onSaved: (val) => _cminController.text = val,
                        validator: (val) =>
                            val.isNotEmpty ? null : 'should not be empty!',
                        decoration: const InputDecoration(
                          labelText: 'C Min',
                        ),
                        controller: _cminController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(color: Theme.of(context).accentColor),
                    ),
                    color: Theme.of(context).primaryColor,
                    child: const Text('Ajouter Medecament'),
                    textColor: Theme.of(context).textTheme.button.color,
                    onPressed: () async {
                      if (_formkey.currentState.validate()) {
                        int res = await dbmanager.insertMedicament(new Medecament(
                          _medecamentController.text,
                          double.parse(_presentationController.text),
                          _laboratoireController.text,
                          double.parse(_ciController.text),
                          double.parse(_cminController.text),
                          double.parse(_cmaxController.text),
                          double.parse(_vflaconcontroller.text),
                          double.parse(_prixcontroller.text),
                        )
                        );
                        print("id medicament $res");
                        Navigator.of(context).pop();
                      }

                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
