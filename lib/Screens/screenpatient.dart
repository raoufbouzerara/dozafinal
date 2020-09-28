import 'package:dozafinal/ADD/ajouter_patient.dart';
import 'package:dozafinal/Helpers/databasehelper.dart';
import 'package:dozafinal/Models/patient.dart';
import 'package:flutter/material.dart';


class ScreenPatient extends StatefulWidget {

  @override
  _ScreenPatientState createState() => _ScreenPatientState();
}

class _ScreenPatientState extends State<ScreenPatient> {

  final DBhelper db = new DBhelper();
  List<Map<String, dynamic>> preparlist;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final appBar = AppBar(title: Text('Patient',),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon:
          Icon(Icons.add),
          onPressed: () => Navigator.push(context,new MaterialPageRoute( builder: (context) => AddPatient())),
        ),
      ],
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0.0,
    );
    return Scaffold(
      appBar: appBar,
      body:
      FutureBuilder(
        future: db.getAllPatients(),
        builder: (context,snapshot) {
          if (snapshot.data ==null || snapshot.data.length == 0) {
            return new Container(
              width: double.infinity,
              child: LayoutBuilder(
                builder: (ctx,constrains){
                  return
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'il n y a pas encore de patient!',
                          style: Theme.of(context).textTheme.title,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                            height: constrains.maxHeight * 0.6,
                            child: Image.asset('Assets/Images/doctor2.png',fit: BoxFit.cover,))
                      ],
                    );
                },

              ),
            );
          }
          if(snapshot.hasData){
            preparlist =snapshot.data;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: preparlist == null ?0 : preparlist.length,
              itemBuilder: (BuildContext context, int index){
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      radius: 30,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        width: 50,
                        child: FittedBox(
                          child: Text('${Patient.fromMap(preparlist[index]).scpatient}\n m2',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),

                        ),
                      ),
                    ),
                    title: Text('${Patient.fromMap(preparlist[index]).nompatient}',
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text('${Patient.fromMap(preparlist[index]).prenompatient}'),
                    trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.pink[400],
                        ),
                        onPressed: (){
                          db.supprimerPreparations(Patient.fromMap(preparlist[index]).idpatient);
                          setState(() {
                            db.getPreparations();
                          });
                        }
                    ),
                    onLongPress: (){},
                  ),
                );
              },
            );
          }

          return CircularProgressIndicator();

        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat ,
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        onPressed: () => Navigator.push(context,new MaterialPageRoute( builder: (context) => AddPatient())),
      ),
    );
  }
}