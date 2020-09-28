import 'dart:io';
import 'package:dozafinal/Models/medecament.dart';
import 'package:dozafinal/Models/patient.dart';
import 'package:dozafinal/Models/preparation.dart';
import 'package:dozafinal/Models/reliquat.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/foundation.dart';

class DBhelper {
  //cree une instance
  static final DBhelper _instance = new DBhelper.internal();
  factory DBhelper() => _instance;

  static Database _database;
  //********************************************************************

  //la déclaration des attributs du tableau médicament
  final String TABLE_MED = 'tablemed';
  final String ID_MEDICAMENT = 'id';
  final String NAME_MEDICAMENT = 'name';
  final String PRESENTATION = 'presentation';
  final String LABORATOIRE = 'laboratoire';
  final String CIN = 'ci';
  final String CMIN = 'cmin';
  final String CMAX = 'cmax';
  final String VFLACON = 'vflacon';
  final String PRIX = 'prix';

  //la déclaration des attributs du tableau patient
  final String TABLE_PATIENT = 'table_patient';
  final String ID_PATIENT = 'idpatient';
  final String NOM_PATIENT = 'nompatient';
  final String PRENOM_PATIENT = 'prenompatient';
  final String TAILLE_PATIENT = 'taillepatient';
  final String SC_PATIENT = 'scpatient';
  final String POIDS_PATIENT = 'poidspatient';

  //la déclaration des attributs du tableau presentation
  final String TABLE_PREPARATION = 'table_preparation';
  final String ID_PREPARATION = 'idpreparation';
  final String DATEPREPARATION = 'datepreparation';
  final String POSOLOGIE = 'posologie';
  final String REDUCTION = 'reduction';
  final String DAA = 'daa';
  final String VFINAL = 'vfinal';
  final String NBRFLACON = 'nbrflacon';
  final String POCHE = 'poche';

  //la déclaration des attributs du tableau reliquat
  final String TABLE_RELIQUAT = 'table_reliquat';
  final String ID_RELIQUAT = 'idreliquat';
  final String DATERELIQUAT = 'datereliquat';
  final String VRELIQUAT = 'vreliquat';
  final String PRIXRELIQUAT = 'prixreliquat';
  //********************************************************************

  //fonction qui cree une db
  Future<Database> get db async {
    if (_database != null) {
      return _database;
    }
    _database = await initDb();
    return _database;
  }

  DBhelper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "mydb.db");
    var ourdb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourdb;
  }

  void _onCreate(Database db, int version) async {
    debugPrint('Database OnCreate');
    //table medicament
    await db.execute(
      " CREATE TABLE $TABLE_MED ( $ID_MEDICAMENT INTEGER PRIMARY KEY , $NAME_MEDICAMENT TEXT ,  $PRESENTATION REAL , $LABORATOIRE TEXT , $CIN REAL , $CMIN REAL, $CMAX REAL, $VFLACON REAL, $PRIX REAL ) ",
    );
    await db.execute(
      " CREATE TABLE $TABLE_PATIENT ( $ID_PATIENT INTEGER PRIMARY KEY , $NOM_PATIENT TEXT ,  $PRENOM_PATIENT TEXT , $TAILLE_PATIENT REAL , $SC_PATIENT REAL , $POIDS_PATIENT REAL )",
    );
    await db.execute(
      " CREATE TABLE $TABLE_PREPARATION ( $ID_PREPARATION INTEGER PRIMARY KEY , $DATEPREPARATION TEXT ,  $POSOLOGIE REAL , $REDUCTION REAL , $DAA REAL , $VFINAL REAL, $NBRFLACON INTEGER, $POCHE INTEGER) ",
    );
    await db.execute(
      " CREATE TABLE $TABLE_RELIQUAT ( $ID_RELIQUAT INTEGER PRIMARY KEY , $DATERELIQUAT TEXT ,  $VRELIQUAT REAL , $PRIXRELIQUAT REAL) ",
    );
  }

  //********************************************************************

  //insirer medecament
  Future<int> insertMedicament(Medecament med) async {
    var dbMedicament = await db;
    int res = await dbMedicament.insert(" $TABLE_MED ", med.toMap());
    return res;
  }

  //aficher tout les medicaments
  Future<List> getAllMed() async {
    var dbMedicament = await db;
    var result = await dbMedicament.rawQuery(" SELECT * FROM $TABLE_MED ");
    return result.toList();
  }

  //afficher un medicament
  Future<Medecament> getMed(int id) async {
    var dbMedicament = await db;
    var result = await dbMedicament
        .rawQuery("SELECT * FROM $TABLE_MED WHERE $ID_MEDICAMENT =$id");
    if (result.length == 0) return null;
    return new Medecament.fromMap(result.first);
  }

  //chercher un medicament par nom
  Future<Medecament> chercherMed(String nom) async {
    var dbMedicament = await db;
    var result = await dbMedicament.rawQuery(
        "SELECT * FROM $TABLE_MED WHERE $NAME_MEDICAMENT LIKE '$nom%' ");
    if (result.length == 0) return null;
    return new Medecament.fromMap(result.first);
  }

  //supprimer un medicament
  Future<int> supprimerMed(int id) async {
    var dbMedicament = await db;
    return await dbMedicament
        .delete(TABLE_MED, where: "$ID_MEDICAMENT = ?", whereArgs: [id]);
  }

  //modifier medicament
  Future<int> modifierMed(Medecament med) async {
    var dbMedicament = await db;
    return await dbMedicament.update(TABLE_MED, med.toMap(),
        where: "$ID_MEDICAMENT = ?", whereArgs: [med.id]);
  }

  //********************************************************************

  //insirer patient
  Future<int> insertPatient(Patient patient) async {
    var dbPatient = await db;
    int res = await dbPatient.insert("$TABLE_PATIENT", patient.toMap());
    return res;
  }

  //aficher tout les patients
  Future<List> getAllPatients() async {
    var dbPatient = await db;
    var result = await dbPatient.rawQuery("SELECT * FROM $TABLE_PATIENT");
    return result.toList();
  }
  //afficher un patient
  Future<Patient> getpatient(int id) async {
    var dbPatient = await db;
    var result = await dbPatient
        .rawQuery("SELECT * FROM $TABLE_PATIENT WHERE $ID_PATIENT =$id");
    if (result.length == 0) return null;
    return new Patient.fromMap(result.first);
  }

  //chercher un medicament par nom
  Future<Patient> chercherpatient(String nom) async {
    var dbPatient = await db;
    var result = await dbPatient.rawQuery(
        "SELECT * FROM $TABLE_PATIENT WHERE $NOM_PATIENT LIKE '$nom%' ");
    if (result.length == 0) return null;
    return new Patient.fromMap(result.first);
  }


  //supprimer un patient
  Future<int> supprimerPatient(int id) async {
    var dbPatient = await db;
    return await dbPatient
        .delete(TABLE_PATIENT, where: "$ID_PATIENT = ?", whereArgs: [id]);
  }

  //modifier patient
  Future<int> modifierPatient(Patient patient) async {
    var dbPatient = await db;
    return await dbPatient.update(TABLE_PATIENT, patient.toMap(),
        where: "$ID_PATIENT = ?", whereArgs: [patient.idpatient]);
  }

  //********************************************************************

  //insirer preparation
  Future<int> insertPreparation(Preparation preparation) async {
    var dbPreparation = await db;
    int res =
        await dbPreparation.insert("$TABLE_PREPARATION", preparation.toMap());
    return res;
  }

  //aficher preparation
  Future<List> getPreparations() async {
    var dbPreparation = await db;
    var result =
        await dbPreparation.rawQuery("SELECT * FROM $TABLE_PREPARATION");
    return result.toList();
  }

  //supprimer un patient
  Future<int> supprimerPreparations(int id) async {
    var dbPreparation = await db;
    return await dbPreparation.delete(TABLE_PREPARATION,
        where: "$ID_PREPARATION = ?", whereArgs: [id]);
  }

  //********************************************************************

  //insirer reliqyat
  Future<int> insertReliquat(Reliquat reliquat) async {
    var dbReliquat = await db;
    int res =
    await dbReliquat.insert("$TABLE_RELIQUAT", reliquat.toMap());
    return res;
  }

  //aficher reliquat
  Future<List> getReliquats() async {
    var dbReliquat = await db;
    var result =
    await dbReliquat.rawQuery("SELECT * FROM $TABLE_RELIQUAT");
    return result.toList();
  }

  //supprimer un reliquat
  Future<int> supprimerReliquats(int id) async {
    var dbReliquat = await db;
    return await dbReliquat.delete(TABLE_RELIQUAT,
        where: "$ID_RELIQUAT = ?", whereArgs: [id]);
  }

  //********************************************************************

  //fermer la bese des donnee
  Future fermer() async {
    var dbMedicament = await db;
    return dbMedicament.close();
  }
}
