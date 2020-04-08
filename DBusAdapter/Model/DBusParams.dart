class DBusParams
{
  static const _DIVIDER = ':';
  static const STRING_TYPE = 'string';

  final String _type;
  final String _value;

  DBusParams(this._type, this._value);

  @override
  String toString() {
    return _type + _DIVIDER + _value;
  }
}
