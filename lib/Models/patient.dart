class Patient {
  int _idpatient;
  String _nompatient;
  String _prenompatient;
  double _taillepatient;
  double _scpatient;
  double _poidspatient;

  int get idpatient => _idpatient;
  String get nompatient => _nompatient;
  String get  prenompatient =>  _prenompatient;
  double get taillepatient => _taillepatient;
  double get scpatient => _scpatient;
  double get  poidspatient =>  _poidspatient;

  Patient.map(dynamic obj) {
    this._idpatient = obj[' idpatient'];
    this._nompatient = obj['nompatient'];
    this._prenompatient = obj['prenompatient'];
    this._taillepatient = obj['taillepatient'];
    this._scpatient = obj['scpatient'];
    this._poidspatient = obj['poidspatient'];
  }
  Patient(
      this._nompatient,
      this._prenompatient,
      this._taillepatient,
      this._scpatient,
      this._poidspatient,
      );
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['nompatient'] = _nompatient;
    map['prenompatient'] = _prenompatient;
    map['taillepatient'] = _taillepatient;
    map['scpatient'] = _scpatient;
    map['poidspatient'] = _poidspatient;
    if (idpatient != null) {
      map['idpatient'] = _idpatient;
    }
    return map;
  }

  Patient.fromMap(Map<String, dynamic> map) {
    this._idpatient = map['idpatient'];
    this._nompatient = map['nompatient'];
    this._prenompatient = map ['prenompatient'];
    this._taillepatient = map['taillepatient'];
    this._scpatient = map ['scpatient'];
    this._poidspatient = map['poidspatient'];
  }
}