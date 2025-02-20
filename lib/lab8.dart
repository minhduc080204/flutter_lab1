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
        home: BMICaculateScreen(),
    );
  }
}

class ResultBMI{
  static double BMI = 0;

  static const List<List<double>> bMI = [
    [40, 40],
    [35,35],
    [28, 28],
    [25, 24],
    [18.5, 17.5],
  ];
  static const List<String> classify = [
    'Béo phì cấp độ 3 (nguy hiểm)',
    'Béo phì cấp độ 2',
    'Béo phì cấp độ 1',
    'Hơi thừa cân	',
    'Bình thường	',
    'Gầy (Thiếu cân)'
  ];

  static const List<String> advice = [
    'Nguy cơ mắc bệnh cao, cần kế hoạch giảm cân nghiêm túc và theo dõi y tế.',
    'Cần điều chỉnh chế độ ăn và vận động nhiều hơn, có thể cần tư vấn bác sĩ.',
    'Nên giảm lượng tinh bột, đường, tăng cường tập luyện.',
    'Cần kiểm soát chế độ ăn uống và tập thể dục đều đặn.',
    'Cân nặng lý tưởng, nên duy trì chế độ ăn uống và tập luyện.',
    'Nên bổ sung dinh dưỡng đầy đủ, ăn nhiều hơn để đạt cân nặng hợp lý.',
  ];

  static const List<Color> colors = [
    Colors.purple,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.lightGreenAccent,
    Colors.red,
  ];

  int caculateBMI(int weight, double height, bool isMale){
    BMI = weight/(height*height/10000);
    int index = isMale?0:1;
    for(int i=0; i<bMI.length;i++){
      if(BMI>=bMI[i][index]){
        return i;
      }
    }
    return 5;
  }
}

class BMICaculateScreen extends StatefulWidget{
  @override
  _BMICaculateState createState() => _BMICaculateState();
}

class _BMICaculateState extends State<BMICaculateScreen>{
  bool isMale = true;
  bool isCalute = false;
  int age = 20;
  int weight = 50;
  double height=170;
  int indexResult =0;

  void caculate(){
    setState(() {
      isCalute = true;
    });
  }

  void setSex(bool male){
    setState(() {
      isMale = male;
    });
  }

  void agePlus(){
    setState(() {
      age++;
    });
  }

  void ageMinus(){
    setState(() {
      age--;
    });
  }

  void weightPlus(){
    setState(() {
      weight++;
    });
  }

  void weightMinus(){
    setState(() {
      weight--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('BMI CACULATOR', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40)),
        backgroundColor: Colors.deepPurple,
        leading: isCalute?IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: Colors.white,),
          onPressed: () {
            setState(() {
              isCalute=false;
            });
          }):null,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          spacing: 20,
          children: [
            isCalute?
              Text('YOUR RESULT', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40)):
              Row(
              spacing: 20,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: isMale?Colors.indigoAccent:Colors.indigo,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: TextButton(
                        onPressed: (){setSex(true);},
                        child: Column(
                          children: [
                            Image.asset('icons/maleIcon.png',scale: 6,),
                            Text('Male', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30))
                          ],
                        )
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: !isMale?Colors.indigoAccent:Colors.indigo,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: TextButton(
                        onPressed: (){setSex(false);},
                        child: Column(
                          children: [
                            Image.asset('icons/femaleIcon.png',scale: 6,),
                            Text('Female', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30))
                          ],
                        )
                    ),
                  ),
                ),
              ],
            ),
            isCalute?
              Expanded(
                child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.indigoAccent,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      spacing: 20,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(ResultBMI.classify[indexResult], style: TextStyle(color: ResultBMI.colors[indexResult], fontWeight: FontWeight.bold, fontSize: 40)),
                        Text(ResultBMI.BMI.toStringAsFixed(1), style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold, fontSize: 60)),
                        Text(ResultBMI.advice[indexResult], style: TextStyle(color: Colors.orangeAccent, fontWeight: FontWeight.bold, fontSize: 25)),
                      ]
                    )
                )
              ):
              Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.indigoAccent,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  children: [
                    Text('HEIGHT', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 15)),
                    Text('$height', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40)),
                    Slider(
                        value: height,
                        max: 250,
                        min: 50,
                        divisions: 200,
                        onChanged: (value){
                          setState(() {
                            height=value;
                          });
                        }
                    )
                  ],
                ),
              ),
            ),
            isCalute?Container():Row(
              spacing: 20,
              children: [
                Expanded(
                  child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.indigoAccent,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        children: [
                          Text('WEIGHT', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 20)),
                          Text('$weight', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 45)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(onPressed: weightMinus, child: Image.asset('icons/minusIcon.png',scale: 10,)),
                              TextButton(onPressed: weightPlus, child: Image.asset('icons/plusIcon.png',scale: 10,)),
                            ],
                          )
                        ],
                      )
                  ),
                ),
                Expanded(
                  child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.indigoAccent,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        children: [
                          Text('AGE', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 20)),
                          Text('$age', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 45)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(onPressed: ageMinus, child: Image.asset('icons/minusIcon.png',scale: 10,)),
                              TextButton(onPressed: agePlus, child: Image.asset('icons/plusIcon.png',scale: 10,)),
                            ],
                          )
                        ],
                      )
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: !isCalute?Colors.green:Colors.red,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: TextButton(
                  onPressed: (){
                    setState(() {
                      isCalute=!isCalute;
                      indexResult = ResultBMI().caculateBMI(weight, height, isMale);
                    });
                  },
                  child: Text(
                    !isCalute?'Calulate':'Recalulate',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30
                    )
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
