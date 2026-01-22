import 'dart:math';

class HeartRateModel {
  int generateHeartRate() {
    final random = Random();
    return 60 + random.nextInt(41);
  }
}
