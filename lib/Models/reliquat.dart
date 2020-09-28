class Reliquat {
  int _idreliquat;
  String _datereliquat;
  double _vreliquat;
  double _prixreliquat;

  int get idreliquat => _idreliquat;
  String get datereliquat => _datereliquat;
  double get  posologie =>  _vreliquat;
  double get reduction => _prixreliquat;

  Reliquat.map(dynamic obj) {
    this._idreliquat = obj[' idreliquat'];
    this._datereliquat = obj['datereliquat'];
    this._vreliquat = obj['vreliquat'];
    this._prixreliquat = obj['prixreliquat'];

  }
  Reliquat(
      this._datereliquat ,
      this._vreliquat,
      this._prixreliquat,
      );
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['datereliquat'] = _datereliquat ;
    map['vreliquat'] = _vreliquat;
    map['prixreliquat'] = _prixreliquat;
    if (idreliquat != null) {
      map['idreliquat'] = _idreliquat;
    }
    return map;
  }

  Reliquat.fromMap(Map<String, dynamic> map) {
    this._idreliquat = map['idreliquat'];
    this._datereliquat = map['datereliquat'];
    this._vreliquat = map ['vreliquat'];
    this._prixreliquat = map['prixreliquat'];
  }
}