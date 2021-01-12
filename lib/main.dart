import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

List<String> textItems = [
  'Dear Basketball,',
  'From the moment ',
  'I started rolling my dad’s tube socks ',
  'And shooting imaginary',
  'Game-winning shots',
  'In the Great Western Forum',
  'I knew one thing was real:',
  'I fell in love with you.',
  'A love so deep I gave you my all–',
  'From my mind & body',
  'To my spirit & soul.',
  'As a six-year-old boy',
  'Deeply in love with you',
  'I never saw the end of the tunnel.',
  'I only saw myself',
  'Running out of one.',
  'And so I ran.',
  'I ran up and down every court',
  'After every loose ball for you.',
  'You asked for my hustle',
  'I gave you my heart',
  'Because it came with so much more.',
  'I played through the sweat and hurt',
  'Not because challenge called me',
  'But because YOU called me.',
  'I did everything for YOU',
  'Because that’s what you do',
  'When someone makes you feel as',
  'Alive as you’ve made me feel.',
  'You gave a six-year-old boy his Laker dream',
  'And I’ll always love you for it.',
  'But I can’t love you obsessively for much longer.',
  'This season is all I have left to give.',
  'My heart can take the pounding',
  'My mind can handle the grind',
  'But my body knows it’s time to say goodbye.',
  'And that’s OK.',
  'I’m ready to let you go.',
  'I want you to know now',
  'So we both can savor every moment we have left together.',
  'The good and the bad.',
  'We have given each other',
  'All that we have.',
  'And we both know, no matter what I do next',
  'I’ll always be that kid',
  'With the rolled up socks',
  'Garbage can in the corner',
  ':05 seconds on the clock',
  'Ball in my hands.',
  '5…4…3…2…1',
];

List<String> endTextItems = [
  'Love you always,',
  'Kobe',
];

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    // 标题行
    Widget titleSection = Container(
      padding: EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Dear Basketball',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Text(
                  'Kobe Bryant',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );

    // 文本区域
    List<Widget> textWidgets = [];
    List<Widget> endTextWidgets = [];
    for (var item in textItems) {
      textWidgets.add(new Text(
        item,
      ));
    }
    for (var item in endTextItems) {
      endTextWidgets.add(new Text(
        item,
      ));
    }
    Widget endTextWidget = Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: endTextWidgets,
          ))
        ],
      ),
    );
    textWidgets.add(endTextWidget);

    Widget textSection = Container(
        child: Column(
      children: textWidgets,
    ));

    // 按钮区域
    Column buildButtonColumn(Color color, IconData icon, String label) {
      return Column(
        children: [
          Icon(icon),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(fontSize: 12, color: color),
            ),
          )
        ],
      );
    }

    Widget buttonSection = Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Colors.pink, Icons.favorite_border, 'LIKE'),
          buildButtonColumn(Colors.red[300], Icons.star_border, 'SUB'),
          buildButtonColumn(Colors.red, Icons.cake_outlined, 'R.I.P'),
        ],
      ),
    );

    return MaterialApp(
      title: 'Flutter Layout Demo',
      home: Scaffold(
        appBar: AppBar(
            title: Text('Flutter Layout Demo'), backgroundColor: Colors.red),
        body: ListView(
          children: [
            Image.asset(
              'images/dearBasketball.jpg',
              fit: BoxFit.cover,
            ),
            titleSection,
            textSection,
            ButtonStatefulWidget()
          ],
        ),
      ),
    );
  }
}

Column buildButtonColumn(Color color, IconData icon, IconData iconPressed,
    String label, bool isPressed, void toggle()) {
  return Column(
    children: [
      IconButton(
        icon: Icon(isPressed ? iconPressed : icon, color: color),
        onPressed: toggle,
      ),
      Container(
        child: Text(
          label,
          style: TextStyle(fontSize: 12, color: color),
        ),
      )
    ],
  );
}

class ButtonStatefulWidget extends StatefulWidget {
  PressWidgetState createState() => PressWidgetState();
}

class PressWidgetState extends State<ButtonStatefulWidget> {
  bool isLiked = false;
  bool isSub = false;
  bool isRip = false;
  Widget build(BuildContext context) {
    void toggleLike() {
      setState(() {
        isLiked = !isLiked;
      });
    }

    void toggleSub() {
      setState(() {
        isSub = !isSub;
      });
    }

    void toggleRip() {
      setState(() {
        isRip = !isRip;
      });
    }

    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      buildButtonColumn(Colors.pink, Icons.favorite_border, Icons.favorite,
          'LIKE', isLiked, toggleLike),
      buildButtonColumn(Colors.red[300], Icons.star_border, Icons.star, 'SUB',
          isSub, toggleSub),
      buildButtonColumn(Colors.red, Icons.cake_outlined, Icons.cake, 'R.I.P',
          isRip, toggleRip),
    ]);
  }
}
