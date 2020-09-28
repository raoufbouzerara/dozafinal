import 'package:dozafinal/Helpers/databasehelper.dart';
import 'package:dozafinal/Models/reliquat.dart';
import 'package:flutter/material.dart';



class ScreenReliquat extends StatefulWidget {

  @override
  _ScreenReliquatState createState() => _ScreenReliquatState();
}

class _ScreenReliquatState extends State<ScreenReliquat> {

  final DBhelper db = new DBhelper();
  List<Map<String, dynamic>> reliquatlist;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final appBar = AppBar(title: Text('Reliquat',),
      centerTitle: true,
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0.0,
    );
    return Scaffold(
      appBar: appBar,
      body:
      FutureBuilder(
        future: db.getReliquats(),
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
                          'il n y a pas encore de reliquat!',
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
            reliquatlist =snapshot.data;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: reliquatlist == null ?0 : reliquatlist.length,
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
                          child: Text('${Reliquat.fromMap(reliquatlist[index]).idreliquat}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),

                        ),
                      ),
                    ),
                    title: Text('${Reliquat.fromMap(reliquatlist[index]).posologie}',
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text('Date dexpiration ${Reliquat.fromMap(reliquatlist[index]).datereliquat}'),
                    trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.pink[400],
                        ),
                        onPressed: (){
                          db.supprimerReliquats(Reliquat.fromMap(reliquatlist[index]).idreliquat);
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
    );
  }
}