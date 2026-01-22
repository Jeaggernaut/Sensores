import '../models/heart_rate_model.dart';

class HealthController {
  final HeartRateModel _heartRateModel = HeartRateModel();
  int? _heartRate;

  int? get heartRate => _heartRate;

  void detectFingerprint() {
    _heartRate = _heartRateModel.generateHeartRate();
  }

  void reset() {
    _heartRate = null;
  }
}
