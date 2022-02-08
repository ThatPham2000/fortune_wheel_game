import 'package:flutter/foundation.dart';
import 'package:fortune_wheel_game/model/gift.dart';

class GiftList {
  static final List<Gift> items = [
    Gift(
      id: 'id1',
      imageUrl:
          'https://raw.githubusercontent.com/baothg/flutter-fortune-wheel/master/asset/image/apple.png',
      name: 'Apple',
      amount: 10,
    ),
    Gift(
      id: 'id2',
      imageUrl:
          'https://raw.githubusercontent.com/baothg/flutter-fortune-wheel/master/asset/image/carrot.png',
      name: 'Carrot',
      amount: 7,
    ),
    Gift(
      id: 'id3',
      imageUrl:
          'https://raw.githubusercontent.com/baothg/flutter-fortune-wheel/master/asset/image/cheese.png',
      name: 'Cheese',
      amount: 5,
    ),
    Gift(
      id: 'id4',
      imageUrl:
          'https://raw.githubusercontent.com/baothg/flutter-fortune-wheel/master/asset/image/fruit.png',
      name: 'Fruit',
      amount: 4,
    ),
    Gift(
      id: 'id5',
      imageUrl:
          'https://raw.githubusercontent.com/baothg/flutter-fortune-wheel/master/asset/image/grapes.png',
      name: 'Grapes',
      amount: 6,
    ),
    Gift(
      id: 'id6',
      imageUrl:
          'https://raw.githubusercontent.com/baothg/flutter-fortune-wheel/master/asset/image/milk.png',
      name: 'Milk',
      amount: 1,
    ),
    Gift(
      id: 'id7',
      imageUrl:
          'https://raw.githubusercontent.com/baothg/flutter-fortune-wheel/master/asset/image/raspberry.png',
      name: 'Raspberry',
      amount: 5,
    ),
    Gift(
      id: 'id8',
      imageUrl:
          'https://raw.githubusercontent.com/baothg/flutter-fortune-wheel/master/asset/image/salad.png',
      name: 'Salad',
      amount: 1,
    ),
    Gift(
      id: 'id9',
      imageUrl:
          'https://raw.githubusercontent.com/ThatPham2000/flexible_expanded_38_chapter4/master/luck.png',
      name: 'Chúc bạn may mắn lần sau',
      amount: 9999,
    )
  ];

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
}
