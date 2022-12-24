import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dx_risk/flutter_dx_risk.dart';

class MockFlutterDxRiskPlatform{

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {


  test('getToken', () async {
    expect(await FlutterDxRisk().getToken(appID: ""), '42');
  });
}
