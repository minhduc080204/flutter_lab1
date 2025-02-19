import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: StoryScreen(),
    );
  }
}

class StoryData {
  static const List<List<String>> stories = [
    [
      "Bạn đi theo ánh sáng và dần tiến đến một khu đền cổ với những dòng chữ bí ẩn khắc trên tường. Một giọng nói vang lên từ bóng tối:"
          "\n'Người tìm kiếm chân lý, hãy chứng minh lòng dũng cảm.'"
          "\nBạn nhìn thấy một cánh cửa đá lớn với hai biểu tượng:",
      "Bạn rơi vào một không gian tĩnh lặng, nơi thời gian ngừng trôi."
    ],
    [
      "Cánh cửa mở ra, dẫn đến một căn phòng rực cháy, thử thách bạn bằng một mê cung nóng bỏng."
          "\nBạn bước vào làn sương dày đặc, cảm giác như có thứ gì đó đang quan sát mình. Tiếng thì thầm vang lên:"
          "\n'Hãy lùi lại, hoặc chấp nhận sự thật.'"
          "\nBạn có hai lựa chọn:",
      "Bạn đụng phải một sinh vật lạ đang ẩn nấp trong bóng tối..."
    ],
    [
      "Bạn thấy một bức tượng đá cổ với đôi mắt phát sáng, báo hiệu một bí ẩn cổ xưa."
          "\nKhám phá được Thư Viện Ánh Sáng và tìm thấy ký ức đã mất",
      "Ohh shittt"
    ],
  ];
  static const List<List<String>> answer = [
    ["Nhấn vào biểu tượng ngọn lửa", "Nhấn vào biểu tượng mặt trăng"],
    ["Tiếp tục tiến vào sâu hơn", "Quay lại và tìm lối khác"],
    ["RESTART","RESTART"]
  ];
  static const String restart = "RESTART";
}

class StoryScreen extends StatefulWidget{
  @override
  _StoryState createState() => _StoryState();
}

class _StoryState extends State<StoryScreen>{
  bool isRestart= false;
  int answerNum = 0;
  int storyNum=0;
  String image ="anhsang";
  void answer(int num) {
    setState(() {
      if(isRestart || storyNum==2){
        image ="anhsang";
        storyNum=0;
        answerNum=0;
        isRestart=false;
        return;
      }
      if(num==0){
        storyNum++;
        image = "conduong";
      }else{
        answerNum=1;
        isRestart=true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*2/3,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/$image.jpg'),
                fit: BoxFit.cover, // Phủ toàn bộ màn hình
              ),
            ),
            child: Center(
              child: Text(
                StoryData.stories[storyNum][answerNum],
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 5.0,
                        color: Colors.red,
                        offset: Offset(2, 2),
                      ),
                    ],
                    // foreground: Paint()
                      // ..style = PaintingStyle.stroke // Viền chữ
                      // ..strokeWidth = 3 // Độ dày viền
                      // ..color = Colors.redAccent,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              spacing: 20,
              children: [
                Expanded(child: ElevatedButton(
                  onPressed: (){answer(0);},
                  child: Text(isRestart?StoryData.restart:StoryData.answer[storyNum][0],
                    style: TextStyle(color: Colors.white, fontSize: 20),),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: Size(double.infinity, 0)
                  ),
                )),
                Expanded(child: ElevatedButton(
                  onPressed: (){answer(1);},
                  child: Text(isRestart?StoryData.restart:StoryData.answer[storyNum][1],
                    style: TextStyle(color: Colors.white, fontSize: 20),),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      minimumSize: Size(double.infinity, 0)
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}