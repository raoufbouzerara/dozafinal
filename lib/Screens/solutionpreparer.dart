
import 'package:dozafinal/ADD/preparer_solution.dart';
import 'package:dozafinal/Helpers/databasehelper.dart';
import 'package:dozafinal/Models/preparation.dart';
import 'package:flutter/material.dart';



class SolutionPreparer extends StatefulWidget {

  @override
  _SolutionPreparerState createState() => _SolutionPreparerState();
}

class _SolutionPreparerState extends State<SolutionPreparer> {

  final DBhelper db = new DBhelper();
  List<Map<String, dynamic>> preparlist;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final appBar = AppBar(title: Text('Solution Preparer',),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon:
          Icon(Icons.add),
          onPressed: () => Navigator.push(context,new MaterialPageRoute( builder: (context) => Preparer_Solution())),
        ),
      ],
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0.0,
    );
    return Scaffold(
      appBar: appBar,
      body:
      FutureBuilder(
        future: db.getPreparations(),
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
                          'il n y a pas encore de préparation!',
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
                          child: Text('${Preparation.fromMap(preparlist[index]).daa}\n mg',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),

                        ),
                      ),
                    ),
                    title: Text('Vol Finale: ${Preparation.fromMap(preparlist[index]).vfinal.toStringAsFixed(2)} ml',
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date Preparation: ${Preparation.fromMap(preparlist[index]).datepreparation}'),
                        Text('Nbr Flacon: ${Preparation.fromMap(preparlist[index]).nbrflacon}'),
                        Text('Poche: ${Preparation.fromMap(preparlist[index]).poche}'),
                      ],
                    ),
                    isThreeLine: true,
                    trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.pink[400],
                        ),
                        onPressed: (){
                          db.supprimerPreparations(Preparation.fromMap(preparlist[index]).idpreparation);
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
        onPressed: () => Navigator.push(context,new MaterialPageRoute( builder: (context) => Preparer_Solution())),
      ),
    );
  }
}