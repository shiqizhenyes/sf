import 'dart:async';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

var sf = Sf();

///屏幕适配
class Sf {

  Sf._internal();

  static Sf _sf = Sf._internal();

  factory Sf() => _sf;

  static const MethodChannel _channel =
      const MethodChannel('sf');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static const DEFAULT_PR = 2.0;
  static const DEFAULT_SF = 1.0;

  double _w;
  double _h;
  BuildContext _context;
  double _wPx;
  double _hPx;

  double _devicePixelRatio = DEFAULT_PR;
  double _textScaleFactor = DEFAULT_SF;

  double _fitPixelRatio;

  ///初始化
  Sf init(BuildContext context) {
    _context = context;
    _devicePixelRatio = window.devicePixelRatio;
    _textScaleFactor = window.textScaleFactor;
    _wPx = window.physicalSize.width;
    _hPx = window.physicalSize.height;
    return this;
  }

  /// 设计稿尺寸
  void fit(double width, double height) {
    _w = width;
    _h = height;
  }

  /// 按照设计稿尺寸适配
  double dp(double dpValue) {
    _fitPixelRatio = dpValue / _w;
    var fDp = _wPx * _fitPixelRatio / _devicePixelRatio;
//    print("dpValue $dpValue fDp $fDp  _w $_w");
    return fDp;
  }

  double sp(double spValue) {

  }


}
