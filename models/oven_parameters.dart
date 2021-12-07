// models/oven_parameters.dart

class OvenParameters {
  final String _function;
  final int _temp;
  final int _time_remaining;

  OvenParameters(this._function, this._temp, this._time_remaining);

  // Implement any encoding/decoding for JSON, will need additional constructor
}
