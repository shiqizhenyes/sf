import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sf/dp.dart';
import 'package:sf/sf.dart';

void main() {
  const MethodChannel channel = MethodChannel('sf');

  TestWidgetsFlutterBinding.ensureInitialized();


  File file = File("lib/dp.dart");

  var classStr;
  var star =  "class Dp {\n";
  classStr = star;
  for (double i = 0; i <= 375; i++) {
    classStr += "  static double \$${i.toString().substring(0, i.toString().indexOf("."))} = $i;\n";
  }
//  classStr += "}";
  print(classStr);
  file.writeAsStringSync(classStr);
//  List<String> lines = file.readAsLinesSync();

//  lines.forEach((element) {
//    print("zack ${element.trim()}");
//  });
//  Dp.$1;

//  setUp(() {
//    channel.setMockMethodCallHandler((MethodCall methodCall) async {
//      return '42';
//    });
//  });
//
//  tearDown(() {
//    channel.setMockMethodCallHandler(null);
//  });
//
//  test('getPlatformVersion', () async {
//    expect(await Sf.platformVersion, '42');
//  });
}
