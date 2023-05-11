import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PriceController extends GetxController {
  var _itcPrice = 0.obs;

  int get itcPrice => _itcPrice.value;

  void generateItcPrice(int minRange, int maxRange) {
    FirebaseFirestore.instance
        .collection('prices')
        .doc('itc')
        .update({'price': _itcPrice.value});

    _itcPrice.value = Random().nextInt(maxRange - minRange) + minRange;
    Timer.periodic(Duration(seconds: 3), (timer) {
      _itcPrice.value = Random().nextInt(maxRange - minRange) + minRange;
      FirebaseFirestore.instance
          .collection('prices')
          .doc('itc')
          .update({'price': _itcPrice.value});
    });
  }
}

class HDFCOController extends GetxController {
  var _hdfcoPrice = 0.obs;

  int get hdfcoPrice => _hdfcoPrice.value;

  void generatehdfcoPrice(int minRange, int maxRange) {
    FirebaseFirestore.instance
        .collection('prices')
        .doc('hdfc')
        .update({'price': _hdfcoPrice});

    _hdfcoPrice.value = Random().nextInt(maxRange - minRange) + minRange;
    Timer.periodic(Duration(seconds: 3), (timer) {
      _hdfcoPrice.value = Random().nextInt(maxRange - minRange) + minRange;
      FirebaseFirestore.instance
          .collection('prices')
          .doc('hdfc')
          .update({'price': _hdfcoPrice.value});
    });
  }
}

class HDFCController extends GetxController {
  var _hdfcPrice = 0.obs;

  int get hdfcPrice => _hdfcPrice.value;

  void generatehdfcPrice(int minRange, int maxRange) {
    FirebaseFirestore.instance
        .collection('prices')
        .doc('hdfcbank')
        .update({'price': _hdfcPrice});
    _hdfcPrice.value = Random().nextInt(maxRange - minRange) + minRange;
    Timer.periodic(Duration(seconds: 1), (timer) {
      _hdfcPrice.value = Random().nextInt(maxRange - minRange) + minRange;
      FirebaseFirestore.instance
          .collection('prices')
          .doc('hdfcbank')
          .update({'price': _hdfcPrice.value});
    });
  }
}

class ICICIController extends GetxController {
  var _iciciPrice = 0.obs;
  int get iciciPrice => _iciciPrice.value;
  void generateiciciPrice(int minRange, int maxRange) {
    FirebaseFirestore.instance
        .collection('prices')
        .doc('icicibank')
        .update({'price': _iciciPrice});

    _iciciPrice.value = Random().nextInt(maxRange - minRange) + minRange;
    Timer.periodic(Duration(seconds: 3), (timer) {
      _iciciPrice.value = Random().nextInt(maxRange - minRange) + minRange;
      FirebaseFirestore.instance
          .collection('prices')
          .doc('icicibank')
          .update({'price': _iciciPrice.value});
    });
  }
}

class RELController extends GetxController {
  var _relPrice = 0.obs;
  int get relPrice => _relPrice.value;
  void generaterelPrice(int minRange, int maxRange) {
    FirebaseFirestore.instance
        .collection('prices')
        .doc('reliance')
        .update({'price': _relPrice});

    _relPrice.value = Random().nextInt(maxRange - minRange) + minRange;
    Timer.periodic(Duration(seconds: 3), (timer) {
      _relPrice.value = Random().nextInt(maxRange - minRange) + minRange;
      FirebaseFirestore.instance
          .collection('prices')
          .doc('reliance')
          .update({'price': _relPrice.value});
    });
  }
}

class INFOController extends GetxController {
  var _infoPrice = 0.obs;
  int get infoPrice => _infoPrice.value;

  void generateinfoPrice(int minRange, int maxRange) {
    FirebaseFirestore.instance
        .collection('prices')
        .doc('infosys')
        .update({'price': _infoPrice});

    _infoPrice.value = Random().nextInt(maxRange - minRange) + minRange;
    Timer.periodic(Duration(seconds: 3), (timer) {
      _infoPrice.value = Random().nextInt(maxRange - minRange) + minRange;
      FirebaseFirestore.instance
          .collection('prices')
          .doc('infosys')
          .update({'price': _infoPrice.value});
    });
  }
}

class AXISController extends GetxController {
  var _axisPrice = 0.obs;
  int get axisPrice => _axisPrice.value;

  void generateaxisPrice(int minRange, int maxRange) {
    FirebaseFirestore.instance
        .collection('prices')
        .doc('axisbank')
        .update({'price': _axisPrice});

    _axisPrice.value = Random().nextInt(maxRange - minRange) + minRange;
    Timer.periodic(Duration(seconds: 3), (timer) {
      _axisPrice.value = Random().nextInt(maxRange - minRange) + minRange;
      FirebaseFirestore.instance
          .collection('prices')
          .doc('axisbank')
          .update({'price': _axisPrice.value});
    });
  }
}

class KTKController extends GetxController {
  var _ktkPrice = 0.obs;
  int get ktkPrice => _ktkPrice.value;

  void generatektkPrice(int minRange, int maxRange) {
    FirebaseFirestore.instance
        .collection('prices')
        .doc('kotak')
        .update({'price': _ktkPrice});

    _ktkPrice.value = Random().nextInt(maxRange - minRange) + minRange;
    Timer.periodic(Duration(seconds: 3), (timer) {
      _ktkPrice.value = Random().nextInt(maxRange - minRange) + minRange;
      FirebaseFirestore.instance
          .collection('prices')
          .doc('kotak')
          .update({'price': _ktkPrice.value});
    });
  }
}

class SBIController extends GetxController {
  var _sbiPrice = 0.obs;
  int get sbiPrice => _sbiPrice.value;

  void generatesbiPrice(int minRange, int maxRange) {
    FirebaseFirestore.instance
        .collection('prices')
        .doc('sbi')
        .update({'price': _sbiPrice});

    _sbiPrice.value = Random().nextInt(maxRange - minRange) + minRange;
    Timer.periodic(Duration(seconds: 3), (timer) {
      _sbiPrice.value = Random().nextInt(maxRange - minRange) + minRange;
      FirebaseFirestore.instance
          .collection('prices')
          .doc('sbi')
          .update({'price': _sbiPrice.value});
    });
  }
}

class MRTIController extends GetxController {
  var _mrtiPrice = 0.obs;
  int get mrtiPrice => _mrtiPrice.value;

  void generatemrtiPrice(int minRange, int maxRange) {
    FirebaseFirestore.instance
        .collection('prices')
        .doc('maruti')
        .update({'price': _mrtiPrice});

    _mrtiPrice.value = Random().nextInt(maxRange - minRange) + minRange;
    Timer.periodic(Duration(seconds: 3), (timer) {
      _mrtiPrice.value = Random().nextInt(maxRange - minRange) + minRange;
      FirebaseFirestore.instance
          .collection('prices')
          .doc('maruti')
          .update({'price': _mrtiPrice.value});
    });
  }
}

class TCSController extends GetxController {
  var _tcsPrice = 0.obs;
  int get tcsPrice => _tcsPrice.value;

  void generatetcsPrice(int minRange, int maxRange) {
    FirebaseFirestore.instance
        .collection('prices')
        .doc('tcs')
        .update({'price': _tcsPrice});

    _tcsPrice.value = Random().nextInt(maxRange - minRange) + minRange;
    Timer.periodic(Duration(seconds: 3), (timer) {
      _tcsPrice.value = Random().nextInt(maxRange - minRange) + minRange;
      FirebaseFirestore.instance
          .collection('prices')
          .doc('tcs')
          .update({'price': _tcsPrice.value});
    });
  }
}

class ADANIController extends GetxController {
  var _adaniPrice = 0.obs;
  int get adaniPrice => _adaniPrice.value;

  void generateadaniPrice(int minRange, int maxRange) {
    FirebaseFirestore.instance
        .collection('prices')
        .doc('adani')
        .update({'price': _adaniPrice});

    _adaniPrice.value = Random().nextInt(maxRange - minRange) + minRange;
    Timer.periodic(Duration(seconds: 3), (timer) {
      _adaniPrice.value = Random().nextInt(maxRange - minRange) + minRange;
      FirebaseFirestore.instance
          .collection('prices')
          .doc('adani')
          .update({'price': _adaniPrice.value});
    });
  }
}

class TSController extends GetxController {
  var _tsPrice = 0.obs;
  int get tsPrice => _tsPrice.value;

  void generatetsPrice(int minRange, int maxRange) {
    FirebaseFirestore.instance
        .collection('prices')
        .doc('tatasteel')
        .update({'price': _tsPrice});

    _tsPrice.value = Random().nextInt(maxRange - minRange) + minRange;
    Timer.periodic(Duration(seconds: 3), (timer) {
      _tsPrice.value = Random().nextInt(maxRange - minRange) + minRange;
      FirebaseFirestore.instance
          .collection('prices')
          .doc('tatasteel')
          .update({'price': _tsPrice.value});
    });
  }
}

class TECMController extends GetxController {
  var _tecmPrice = 0.obs;
  int get tecmPrice => _tecmPrice.value;

  void generatetecmPrice(int minRange, int maxRange) {
    FirebaseFirestore.instance
        .collection('prices')
        .doc('techmahindra')
        .update({'price': _tecmPrice});

    _tecmPrice.value = Random().nextInt(maxRange - minRange) + minRange;
    Timer.periodic(Duration(seconds: 3), (timer) {
      _tecmPrice.value = Random().nextInt(maxRange - minRange) + minRange;
      FirebaseFirestore.instance
          .collection('prices')
          .doc('techmahindra')
          .update({'price': _tecmPrice.value});
    });
  }
}

class TTMController extends GetxController {
  var _ttmPrice = 0.obs;
  int get ttmPrice => _ttmPrice.value;

  void generatettmPrice(int minRange, int maxRange) {
    FirebaseFirestore.instance
        .collection('prices')
        .doc('tatamotors')
        .update({'price': _ttmPrice});

    _ttmPrice.value = Random().nextInt(maxRange - minRange) + minRange;
    Timer.periodic(Duration(seconds: 3), (timer) {
      _ttmPrice.value = Random().nextInt(maxRange - minRange) + minRange;
      FirebaseFirestore.instance
          .collection('prices')
          .doc('tatamotors')
          .update({'price': _ttmPrice.value});
    });
  }
}

class WalletController extends GetxController {
  var _wallet = 20000.obs;
  int get wallet => _wallet.value;
}
