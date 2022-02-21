import 'package:DungxApp/themes/app_constant.dart';
import 'package:flutter/material.dart';

class BottomIcon extends StatefulWidget {
  const BottomIcon({Key? key, required this.isLogin}) : super(key: key);
  final bool isLogin;
  @override
  _BottomIconState createState() => _BottomIconState();
}

class Emotion {
  String name;
  String image;
  Emotion(this.name, this.image);
}

class _BottomIconState extends State<BottomIcon> {
  final List<Emotion> _emotions = [
    Emotion('Terible', 'icTerible'),
    Emotion('Bad', 'icBad'),
    Emotion('Medium', 'icMedium'),
    Emotion('Good', 'icGood'),
    Emotion('Awesome', 'icAwesome'),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 200,
      child: Column(
        children: [
          const SizedBox(height: 20),
          widget.isLogin
              ? Container(
                  height: 140,
                  child: Column(
                    children: [
                      const Text('How do you feel "SMARTOS"?',
                          style: TextStyle(
                            fontSize: 16,
                          )),
                      const SizedBox(height: 20),
                      Expanded(
                        child: ListView.builder(
                            itemCount: _emotions.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Container(
                                width: (Constants(context).width - 40) / 5,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 4),
                                          height: 44,
                                          width: 44,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(44 / 2),
                                          ),
                                          child: Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/${_emotions[index].image}.png'),
                                                    fit: BoxFit.contain),
                                              ))),
                                        ),
                                        Text(
                                          _emotions[index].name,
                                          style: const TextStyle(fontSize: 12),
                                        )
                                      ],
                                    )
                                  ],
                                ))),
                      ),
                    ],
                  ))
              : SizedBox.shrink(),
          Container(
              color: Colors.white,
              padding: const EdgeInsets.only(bottom: 20),
              child: const Center(
                child: Text(
                  'Version 0.0.1',
                ),
              ))
        ],
      ),
    );
  }
}
