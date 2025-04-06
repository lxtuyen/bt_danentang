import 'package:flutter/material.dart';
import 'package:lab6/question.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final tickIcon = Icon(Icons.check, color: Colors.green);
  final crossIcon = Icon(Icons.clear, color: Colors.red);
  int count = 0;
  List<Icon> iconsList = [];

  final List<Question> questionsList = [
    Question('Môn Lập trình đa nền tảng học vào sáng thứ 5?', true),
    Question('Môn Lập trình đa nền tảng gồm 3 tín chỉ?', false),
    Question('Giảng viên dạy Môn Lập trình đa nền tảng là thầy ThS Ngô Lê Quân', true),
    Question('1 + 1 = 2 ?', true),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF333333),
        body: _body(),
      ),
    );
  }

  _body() {
    ///
    /// Column1
    ///
    return Column(
      // Divide the the vertical space between the children
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      // Stretch the children horizontally to the screen size
      // as we need to stretch the buttons
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: <Widget>[
        Center(

          ///
          /// Text Widget with some padding
          ///
            child: Padding(
              padding: const EdgeInsets.only(top: 110, left: 20, right: 20),
              child: Text(
                questionsList[count].question,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            )),

        ///
        /// Column2
        ///
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ///
            /// True Button
            ///
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'True',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              onPressed: () {
                _checkAnswer(true);
              },
            ),

            ///
            /// To give some space between buttons
            ///
            SizedBox(height: 8),

            ///
            /// False Button
            ///
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'False',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              onPressed: () {
                _checkAnswer(false);
              },
            ),

            ///
            /// Row for Tick-Cross Icons to align them horizontally.
            ///
            Row(children: iconsList)
          ],
        ),
      ],
    );
  }

  _checkAnswer(selectedAnswer) {
    if (selectedAnswer == questionsList[count].correctAnswer) {

      setState(() {
        iconsList.add(tickIcon);

        if (count < questionsList.length - 1) count++;
      });
    } else {
      //Incorrect answer
      setState(() {
        iconsList.add(crossIcon);
        if (count < questionsList.length - 1) count++;
      });
    }
  }
}