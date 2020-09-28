class Preparation {
  int _idpreparation;
  String _datepreparation;
  double _posologie;
  double _reduction;
  double _daa;
  double _vfinal;
  int _nbrflacon;
  int _poche;
  int get idpreparation => _idpreparation;
  String get datepreparation => _datepreparation;
  double get  posologie =>  _posologie;
  double get reduction => _reduction;
  double get daa => _daa;
  double get  vfinal =>  _vfinal;
  int get  nbrflacon =>  _nbrflacon;
  int get  poche =>  _poche;

  Preparation.map(dynamic obj) {
    this._idpreparation = obj[' idpreparation'];
    this._datepreparation = obj['datepreparation'];
    this._posologie = obj['posologie'];
    this._reduction = obj['reduction'];
    this._daa = obj['daa'];
    this._vfinal = obj['vfinal'];
    this._nbrflacon = obj['nbrflacon'];
    this._nbrflacon = obj['poche'];
  }
  Preparation(
      this._datepreparation ,
      this._posologie,
      this._reduction,
      this._daa,
      this._vfinal,
      this._nbrflacon,
      this._poche,
      );
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['datepreparation'] = _datepreparation ;
    map['posologie'] = _posologie;
    map['reduction'] = _reduction;
    map['daa'] = _daa;
    map['vfinal'] = _vfinal;
    map['nbrflacon'] = _nbrflacon;
    map['poche'] = _poche;
    if (idpreparation != null) {
      map['idpreparation'] = _idpreparation;
    }
    return map;
  }

  Preparation.fromMap(Map<String, dynamic> map) {
    this._idpreparation = map['idpreparation'];
    this._datepreparation = map['datepreparation'];
    this._posologie = map ['posologie'];
    this._reduction = map['reduction'];
    this._daa = map ['daa'];
    this._vfinal = map['vfinal'];
    this._nbrflacon = map['nbrflacon'];
    this._poche = map['poche'];
  }
}