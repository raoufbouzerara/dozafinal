class Medecament {
  int _id;
  String _name;
  double _presentation;
  String _laboratoire;
  double _ci;
  double _cmin;
  double _cmax;
  double _vflacon;
  double _prix;

  Medecament(
      this._name,
      this._presentation,
      this._laboratoire,
      this._ci,
      this._cmin,
      this._cmax,
      this._vflacon,
      this._prix,
      );

  Medecament.map(dynamic obj) {
    this._name = obj['name'];
    this._presentation = obj['presentation'];
    this._laboratoire = obj['laboratoire'];
    this._ci = obj['ci'];
    this._cmin = obj['cmin'];
    this._cmax = obj['cmax'];
    this._vflacon = obj['vflacon'];
    this._prix = obj['prix'];
    this._id = obj[' id'];
  }
  int get id => _id;
  String get name => _name;
  double get presentation => _presentation;
  String get laboratoire => _laboratoire;
  double get ci => _ci;
  double get cmin => _cmin;
  double get cmax => _cmax;
  double get vflacon => _vflacon;
  double get prix => _prix;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['name'] = _name;
    map['presentation'] = _presentation;
    map['laboratoire'] = _laboratoire;
    map['ci'] = _ci;
    map['cmin'] = _cmin;
    map['cmax'] = _cmax;
    map['vflacon'] = _vflacon;
    map['prix'] = _prix;
    if (id != null) {
      map['id'] = _id;
    }
    return map;
  }

  Medecament.fromMap(Map<String, dynamic> map) {
    this._name = map['name'];
    this._presentation = map['presentation'];
    this._laboratoire = map['laboratoire'];
    this._ci = map['ci'];
    this._cmin = map['cmin'];
    this._cmax = map['cmax'];
    this._vflacon = map['vflacon'];
    this._prix = map['prix'];
    this._id = map['id'];
  }
}