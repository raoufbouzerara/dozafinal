
import 'package:dozafinal/Helpers/databasehelper.dart';
import 'package:dozafinal/Models/patient.dart';
import 'package:flutter/material.dart';

class AddPatient extends StatefulWidget {
  @override
  _AddPatientState createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  // declaration du formkey
  final _formkeypatient = new GlobalKey<FormState>();
  final DBhelper dbmanager = new DBhelper();

  //declaration des controlers
  final _nompatientController = TextEditingController();
  final _prenompatientController = TextEditingController();
  final _taillepatientController = TextEditingController();
  final _scpatientController = TextEditingController();
  final _poidspatientcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    final appBar = AppBar(
      title: Text(
        'Ajouter Patient',
      ),
      centerTitle: true,
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0.0,
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Form(
          key: _formkeypatient,
          child: Container(
            padding: EdgeInsets.all(12),
            width: double.infinity,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(bottom: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("Patien",
                              textAlign: TextAlign.right,
                              style: Theme.of(context).textTheme.title),
                        ],
                      )),
                  Container(
                    padding: EdgeInsets.only(bottom: 12),
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      onSaved: (val) => _nompatientController.text = val,
                      controller: _nompatientController,
                      validator: (val) =>
                      val.isNotEmpty ? null : 'should not be empty!',
                      decoration: InputDecoration(
                        labelText: "Nom",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 12),
                    child: TextFormField(
                      onSaved: (val) => _prenompatientController.text = val,
                      controller: _prenompatientController,
                      validator: (val) =>
                      val.isNotEmpty ? null : 'should not be empty!',
                      textAlignVertical: TextAlignVertical.center,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      decoration: InputDecoration(
                        labelText: "Prenom",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        fit:FlexFit.tight,
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.only(right: 6,bottom: 12),
                          child: TextFormField(
                            onSaved: (val) => _poidspatientcontroller.text = val,
                            controller: _poidspatientcontroller,
                            validator: (val) =>
                            val.isNotEmpty ? null : 'should not be empty!',
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            decoration: InputDecoration(
                              labelText: "Poids",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        fit:FlexFit.tight,
                        child: Container(
                          padding: EdgeInsets.only(left: 6,bottom: 12),
                          child: TextFormField(
                            onSaved: (val) => _taillepatientController.text = val,
                            controller: _taillepatientController,
                            validator: (val) =>
                            val.isNotEmpty ? null : 'should not be empty!',
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            decoration: InputDecoration(
                              labelText: "Taille",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 12),
                    child: TextFormField(
                      onSaved: (val) => _scpatientController.text = val,
                      controller: _scpatientController,
                      validator: (val) =>
                      val.isNotEmpty ? null : 'should not be empty!',
                      textAlignVertical: TextAlignVertical.center,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      decoration: InputDecoration(
                        labelText: "Surface Corporelle",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 12),
                    child: SizedBox(
                      height: 50.0,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: BorderSide(
                                color: Theme.of(context).primaryColor)),
                        onPressed: () async {
                          if (_formkeypatient.currentState.validate()) {
                            int respatient = await dbmanager.insertPatient(
                                new Patient(
                                    _nompatientController.text,
                                    _prenompatientController.text,
                                    double.parse(_taillepatientController.text),
                                    double.parse(_scpatientController.text),
                                    double.parse(_poidspatientcontroller.text
                                    )));
                            print("id patient $respatient");
                            Navigator.of(context).pop();
                          }
                        },
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        child: Text("Ajouter Patient".toUpperCase(),
                            style: TextStyle(fontSize: 14)),
                      ),
                    ),
                  ),
                ],
            ),
        ),
      ),
      ),
    );
  }
}
