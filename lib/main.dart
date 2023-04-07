import 'package:bmi/homepage.dart';
import 'package:flutter/material.dart';
void main() => runApp(
    MaterialApp(
      theme: ThemeData(
          primaryColor:Color(0xfff17c91)
      ),
      home: homepage(),
      debugShowCheckedModeBanner: false,
    )
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _height=170.0;
  double _weight=55.0;
  int _bmi=0;
  String _condition='Select Data';
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: size.height*0.40,
              width: double.infinity,
              decoration: new BoxDecoration(color: Color(0xfff17c91)),
              padding: EdgeInsets.symmetric(vertical: 30.0,horizontal: 10.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(" BMI Calculator",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 60.0),),
                    Text("  คำนวณหาค่าดัชนีมวลกาย",style: TextStyle(color: Colors.white,fontSize: 30.0),),
                    SizedBox(
                      width: double.infinity,
                      child: Container(
                        child:Text("$_bmi",
                          style:TextStyle(
                              color: Colors.yellow,
                              fontWeight: FontWeight.bold,
                              fontSize: 55.0
                          ),textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                          text: "   เกณท์ : ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: "$_condition",
                              style: TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold
                              ),)
                          ]
                      ),

                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  SizedBox(height: size.height*0.03,),
                  Text("เลือกข้อมูล",style: TextStyle(color: Color(0xfff17c91),fontSize: 30.0,fontWeight: FontWeight.bold),),
                  SizedBox(height: size.height*0.03,),
                  RichText(
                    text: TextSpan(
                        text: "ส่วนสูง : ",
                        style: TextStyle(
                            color: Color(0xFF403f3d),
                            fontSize: 25.0
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "$_height เซนติเมตร",
                            style: TextStyle(
                                color: Color(0xFF403f3d),
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold
                            ),)
                        ]
                    ),

                  ),
                  SizedBox(height: size.height*0.03,),
                  Slider(
                    value: _height,
                    min:0,
                    max: 250,
                    onChanged: (height){
                      setState(() {
                        _height=height;
                      });
                    },
                    divisions: 250,
                    label: "$_height",
                    activeColor:Color(0xFF403f3d),
                    inactiveColor: Colors.grey,
                  ),
                  SizedBox(height: size.height*0.03,),
                  RichText(
                    text: TextSpan(
                        text: "น้ำหนัก : ",
                        style: TextStyle(
                            color: Color(0xFF403f3d),
                            fontSize: 25.0
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "$_weight กิโลกรัม",
                            style: TextStyle(
                                color: Color(0xFF403f3d),
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold
                            ),)
                        ]
                    ),

                  ),
                  SizedBox(height: size.height*0.03,),
                  Slider(
                    value: _weight,
                    min:0,
                    max: 250,
                    onChanged: (weight){
                      setState(() {
                        _weight=weight;
                      });
                    },
                    divisions: 250,
                    label: "$_weight",
                    activeColor:Color(0xFF403f3d),
                    inactiveColor: Colors.grey,
                  ),
                  SizedBox(height: size.height*0.05,),
                  Container(
                    color: Color(0xfff17c91),
                    padding: EdgeInsets.symmetric(vertical: 15,horizontal: 40),
                    width: size.width*0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: TextButton(
                        onPressed: (){
                          setState(() {
                            //18.5 - 25 Healthy 25-30 Overweight >30 Obesity
                            _bmi=(_weight/((_height/100)*(_height/100))).round().toInt();
                            if(_bmi>=18.5 && _bmi<=22.9) {_condition=" สมส่วน ";}
                            else if(_bmi>=23.0 && _bmi<=24.9) {_condition=" น้ำหนักเกินเกณฑ์";}
                            else if(_bmi>=25 && _bmi<=29.9) {_condition=" โรคอ้วน ";}
                            else if(_bmi>=30) {_condition=" อ้วนมาก เสี่ยงโรคร้ายแรง ";}
                            else  {_condition=" น้ำหนักน้อยกว่าเกณฑ์";}
                          });
                        },
                        child: Text("คำนวณ",style: TextStyle(color: Colors.white,fontSize: 20.0),),

                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

