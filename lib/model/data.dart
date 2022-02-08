import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:fortune_wheel_game/model/gift.dart';

// Thuật toán https://softwareengineering.stackexchange.com/questions/150616/get-weighted-random-item

class GiftList {
  static final List<Gift> items = [
    Gift(
      id: 'id1',
      imageUrl:
          'https://raw.githubusercontent.com/baothg/flutter-fortune-wheel/master/asset/image/apple.png',
      name: 'Apple',
      amount: 10,
      rate: 10,
    ),
    Gift(
      id: 'id2',
      imageUrl:
          'https://raw.githubusercontent.com/baothg/flutter-fortune-wheel/master/asset/image/carrot.png',
      name: 'Carrot',
      amount: 7,
      rate: 0,
    ),
    Gift(
      id: 'id3',
      imageUrl:
          'https://raw.githubusercontent.com/baothg/flutter-fortune-wheel/master/asset/image/cheese.png',
      name: 'Cheese',
      amount: 5,
      rate: 0,
    ),
    Gift(
      id: 'id4',
      imageUrl:
          'https://raw.githubusercontent.com/baothg/flutter-fortune-wheel/master/asset/image/fruit.png',
      name: 'Fruit',
      amount: 4,
      rate: 0,
    ),
    Gift(
      id: 'id5',
      imageUrl:
          'https://raw.githubusercontent.com/baothg/flutter-fortune-wheel/master/asset/image/grapes.png',
      name: 'Grapes',
      amount: 6,
      rate: 0,
    ),
    Gift(
      id: 'id6',
      imageUrl:
          'https://raw.githubusercontent.com/baothg/flutter-fortune-wheel/master/asset/image/milk.png',
      name: 'Milk',
      amount: 1,
      rate: 50,
    ),
    Gift(
      id: 'id7',
      imageUrl:
          'https://raw.githubusercontent.com/baothg/flutter-fortune-wheel/master/asset/image/raspberry.png',
      name: 'Raspberry',
      amount: 5,
      rate: 0,
    ),
    Gift(
      id: 'id8',
      imageUrl:
          'https://raw.githubusercontent.com/baothg/flutter-fortune-wheel/master/asset/image/salad.png',
      name: 'Salad',
      amount: 1,
      rate: 0,
    ),
    Gift(
      id: 'id9',
      imageUrl:
          'https://raw.githubusercontent.com/ThatPham2000/flexible_expanded_38_chapter4/master/luck.png',
      name: 'Chúc bạn may mắn lần sau',
      amount: 9999,
      rate: 80,
    )
  ];

  static List<double> get cumulativeSumOfWeight {
    List<double> cumulativeSum = [];
    if (items.length > 0) {
      cumulativeSum.add(items[0].rate);
      for (int i = 1; i < items.length; i++) {
        cumulativeSum.add(cumulativeSum[i - 1] + items[i].rate);
      }
    }

    return cumulativeSum;
  }

  static void decreaseAmount(int index) {
    items[index].amount--;
  }

  static bool checkOutOfGift() {
    for (var i in items) {
      if (i.amount > 0) {
        return false;
      }
    }
    return true;
  }

  static double get sumOfRate {
    double rs = 0;
    for (var item in items) {
      rs += item.rate;
    }
    return rs;
  }

  static int generateIndexAlgorithm() {
    int rng = Random().nextInt(sumOfRate.floor());
    for (int i = 0; i < cumulativeSumOfWeight.length; i++) {
      if (rng < cumulativeSumOfWeight[i]) {
        return i;
      }
    }
    return cumulativeSumOfWeight.length - 1;
  }
}
