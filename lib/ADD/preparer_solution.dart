import 'package:dozafinal/Helpers/databasehelper.dart';
import 'package:dozafinal/Models/medecament.dart';
import 'package:dozafinal/Models/patient.dart';
import 'package:dozafinal/Models/preparation.dart';
import 'package:dozafinal/Models/reliquat.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Preparer_Solution extends StatefulWidget {
  @override
  _Preparer_SolutionState createState() => _Preparer_SolutionState();
}

class _Preparer_SolutionState extends State<Preparer_Solution> {

  //declaration des variables
  double ciselected, cmaxselected, cminselected, vflaconselected, priceselected,scpatientselected;
  Medecament medselected;
  Patient patientselected;
  String selected_item;
  String selected_item_patient;
  String dureeflacon;
  // double dose,vfinal,vreliquat,preliquat;
  // int nmbrflacon,
   int pocheselected = null;
   String dreliquat = '';

  //declaration des controlers
  final _posologiecontroller = TextEditingController();
  final _reductionController = TextEditingController();

  // declaration du formkey
  final _formkey = new GlobalKey<FormState>();

  //DataBase
  final DBhelper dbmanager = new DBhelper();
  List<Map<String, dynamic>> medlist;
  List<Map<String, dynamic>> patientlist;

  //les listes du Patient (dropdown)
  List<DropdownMenuItem> getDropDownItemPatient() {
    List<DropdownMenuItem<String>> dropdownitems = [];
    if (patientlist.length != null) {
      for (int i = 0; i < patientlist.length; i++) {
        String patient = Patient.fromMap(patientlist[i]).nompatient;
        var newItem = DropdownMenuItem(
          child: Text(patient),
          value: patient,
        );
        dropdownitems.add(newItem);
      }
      return dropdownitems;
    }
  }

  //les listes du medecament (dropdown)
  List<DropdownMenuItem> getDropDownItem() {
    List<DropdownMenuItem<String>> dropdownitems = [];
    if (medlist.length != null) {
      for (int i = 0; i < medlist.length; i++) {
        String medecament = Medecament.fromMap(medlist[i]).name;
        var newItem = DropdownMenuItem(
          child: Text(medecament),
          value: medecament,
        );
        dropdownitems.add(newItem);
      }
      return dropdownitems;
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final appBar = AppBar(
      title: Text(
        'Preparer Solution',
      ),
      centerTitle: true,
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0.0,
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Container(
            padding: EdgeInsets.all(12),
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
                FutureBuilder(
                    future: dbmanager.getAllPatients(),
                    builder: (context, snapshot) {
                      patientlist = snapshot.data;
                      return Container(
                        padding: EdgeInsets.only(bottom: 12),
                        child: DropdownButtonFormField<String>(
                          validator: (value) =>
                          value == null ? 'shoud not be empty!' : null,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),
                          elevation: 2,
                          icon: Icon(Icons.arrow_downward),
                          hint: Text(
                            "sélectionner un patient",
                            textAlign: TextAlign.center,
                          ),
                          style: TextStyle(color: Colors.blue,
                            fontSize: 16,),
                          isDense: true,
                          iconSize: 30.0,
                          iconEnabledColor: Colors.white,
                          items: getDropDownItemPatient(),
                          value: selected_item_patient,
                          onChanged: (value) async {
                            setState(() {
                              selected_item_patient = value;
                              print(' patient item $selected_item_patient');
                            }
                            );
                            patientselected = await dbmanager.chercherpatient(selected_item_patient);
                            scpatientselected = patientselected.scpatient;
                          },
                        ),
                      );
                    }),
                Container(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("Médecament",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.title),
                      ],
                    )),
                FutureBuilder(
                    future: dbmanager.getAllMed(),
                    builder: (context, snapshot) {
                      medlist = snapshot.data;
                      return Container(
                        padding: EdgeInsets.only(bottom: 12),
                        child: DropdownButtonFormField<String>(
                          validator: (value) =>
                              value == null ? 'shoud not be empty!' : null,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),
                          elevation: 2,
                          icon: Icon(Icons.arrow_downward),
                          hint: Text(
                            "sélectionner un médicament",
                            textAlign: TextAlign.center,
                          ),
                          style: TextStyle(color: Colors.blue,
                              fontSize: 16,),
                          isDense: true,
                          iconSize: 30.0,
                          iconEnabledColor: Colors.white,
                          items: getDropDownItem(),
                          value: selected_item,
                          onChanged: (value) async {
                            setState(() {
                              selected_item = value;
                              print(' medecament item $selected_item');
                            }
                            );
                            medselected = await dbmanager.chercherMed(selected_item);
                            ciselected = medselected.ci;
                            cminselected = medselected.cmin;
                            cmaxselected = medselected.cmax;
                            vflaconselected = medselected.vflacon;
                            priceselected = medselected.prix;
                            print( "the ci  $ciselected vflacon is $vflaconselected prix $priceselected");
                          },
                        ),
                      );
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.only(right: 6,bottom: 12),
                        child: SizedBox(
                          height: 50,
                          child: TextFormField(
                            onSaved: (val) => _posologiecontroller.text = val,
                            controller: _posologiecontroller,
                            validator: (val) =>
                                val.isNotEmpty ? null : 'should not be empty!',
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            decoration: InputDecoration(
                              labelText: "Posologie",
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
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Container(
                        padding: EdgeInsets.only(right: 6,left: 6,bottom: 12),
                        child: SizedBox(
                          height: 50,
                          child: TextFormField(
                            onSaved: (val) => _reductionController.text = val,
                            controller: _reductionController,
                            validator: (val) =>
                                val.isNotEmpty ? null : 'should not be empty!',
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            decoration: InputDecoration(
                              labelText: "Reduction",
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
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Container(
                        padding: EdgeInsets.only(left: 6,bottom: 12),
                        child: DropdownButtonFormField<String>(
                          validator: (value) =>
                          value == null ? 'shoud not be empty!' : null,
                          value: dureeflacon,
                          icon: Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),
                          style: TextStyle(color: Theme.of(context).primaryColor),
                          onChanged: (String newValue) {
                            setState(() {
                              dureeflacon = newValue;
                              print(dureeflacon);
                            });
                          },
                          items: <String>['Verre4', 'Verre25', 'PVC25']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        )
                      ),
                    ),
                  ],
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
                        if (_formkey.currentState.validate()) {
                          // les calcules
                          double dose = (double.parse(_posologiecontroller.text)-double.parse(_posologiecontroller.text)*double.parse(_reductionController.text)) * scpatientselected;
                          double vfinal = (dose / ciselected);
                          int nmbrflacon = (vfinal/ vflaconselected).toInt();
                          double vreliquat = ((dose / ciselected)/ vflaconselected).toInt() * vflaconselected;
                          String dreliquat;

                          if(dureeflacon == 'Verre4'){
                            setState(() {
                              dreliquat = DateFormat.yMMMd().format(DateTime.now().add(new Duration(hours: 48))).toString();
                            });
                          }
                          else if(dureeflacon == 'Verre25'){
                            setState(() {
                              dreliquat = DateFormat.yMMMd().format(DateTime.now().add(new Duration(hours: 8))).toString();
                            });

                          }
                          else if(dureeflacon == 'PVC25'){
                            setState(() {
                              dreliquat = DateFormat.yMMMd().format(DateTime.now().add(new Duration(hours: 72))).toString();
                            });
                          }
                          double preliquat= priceselected * vreliquat;


                          if(ciselected*250 < dose && dose < cmaxselected*250){
                            pocheselected=250;
                          }
                          else{
                            pocheselected=500;
                          }
                          print("$vfinal");


                          int respreparation = await dbmanager.insertPreparation(new Preparation(
                              new DateFormat.yMMMd().format(new DateTime.now()).toString(),
                              double.parse(_posologiecontroller.text),
                              double.parse(_reductionController.text),
                              dose,
                              vfinal,
                              nmbrflacon,
                              pocheselected.toInt(),
                          )
                          );
                          print("id preparation $respreparation");

                          int result = await dbmanager.insertReliquat(new Reliquat(
                              dreliquat,
                              vreliquat,
                              preliquat
                          ));

                          print("id reliquat $result");
                          Navigator.of(context).pop();
                        }
                      },
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      child: Text("Calculate".toUpperCase(),
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
