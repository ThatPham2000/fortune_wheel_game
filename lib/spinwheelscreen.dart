import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:fortune_wheel_game/model/data.dart';

// Thuật toán random: https://stackoverflow.com/questions/1761626/weighted-random-numbers

class SpinWheel extends StatefulWidget {
  SpinWheel({Key? key}) : super(key: key);

  @override
  _SpinWheelState createState() => _SpinWheelState();
}

class _SpinWheelState extends State<SpinWheel> {
  StreamController<int> _selected = StreamController<int>();
  var _isBtnDisable = false;
  int _indexSelected = 0;

  @override
  void dispose() {
    _selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _items = GiftList.items.map((e) {
      return FortuneItem(
          child: Container(
        margin: EdgeInsets.only(right: 20),
        child: Align(
          alignment: Alignment.centerRight,
          child: Image.network(
            e.imageUrl,
            width: 80,
            height: 80,
          ),
        ),
      ));
    }).toList();

    AlertDialog dialog(int index) {
      return AlertDialog(
        title: Center(
            child: Text(
          'Kết quả',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        )),
        content: Text('Bạn đã quay trúng ${GiftList.items[index].name}'),
        elevation: 24,
        backgroundColor: Colors.blue,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Fortune Wheel Game'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green, Colors.blue.withOpacity(0.2)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 400,
              child: FortuneWheel(
                animateFirst: false, // No spin when start
                selected: _selected.stream,
                items: _items,
                styleStrategy: UniformStyleStrategy(
                  color: Colors.red,
                  borderColor: Colors.black,
                  borderWidth: 5,
                ),
                onAnimationEnd: () {
                  setState(() {
                    showDialog(
                        context: context,
                        builder: (_) => dialog(_indexSelected),
                        barrierDismissible: true);
                    GiftList.decreaseAmount(_indexSelected);
                    _isBtnDisable = false;
                  });
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                _isBtnDisable
                    ? null
                    : setState(() {
                        do {
                          // _indexSelected =
                          //     Fortune.randomInt(0, GiftList.items.length);
                          _indexSelected = GiftList.generateIndexAlgorithm();
                        } while (GiftList.items[_indexSelected].amount == 0 &&
                            !GiftList.checkOutOfGift());
                        if (!GiftList.checkOutOfGift()) {
                          _selected.add(_indexSelected);
                          _isBtnDisable = true;
                        } else {
                          showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                    title: Text('Đã hết quà!'),
                                    backgroundColor: Colors.blue,
                                  ));
                        }
                      });
              },
              child: Text('Spin'),
            )
          ],
        ),
      ),
    );
  }
}
