import 'package:flutter/material.dart';


class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeState();
  }

}

class HomeState extends State<Home> {
  final TextEditingController _weightController = new TextEditingController();

  int radioValue = 0;
  double _finalResult = 0.0;
  String _formattedText = "";
  void radioChange(int value ){
    setState(() {
      radioValue = value;
      switch(radioValue){
        case 0:
          _finalResult = calcualte(_weightController.text,0.38);
          _formattedText = "Your weight on Venus is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 1:
          _finalResult = calcualte(_weightController.text, 2.34);
          _formattedText = "Your weight on Jupiter is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 2:
          _finalResult = calcualte(_weightController.text,1.06);
          _formattedText = "Your weight on Saturn is ${_finalResult.toStringAsFixed(1)}";
          break;

      }
      print(radioValue);

    });
  }

//  Mercury: 0.38
//  Venus: 0.91
//  Earth: 1.00
//  Mars: 0.38
//  Jupiter: 2.34
//  Saturn: 1.06
//  Uranus: 0.92
//  Neptune: 1.19
//  Pluto: 0.06

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("weight on platent"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      backgroundColor: Colors.white,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            new  Image.asset('Images/hello.jpg',
            height: 133.0,
            width: 200.0,),
            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
                child: new Column(
                  children: <Widget>[
                    new TextField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        labelText:'Your Weight on earth',
                        hintText: 'In Pounds',
                        icon: new Icon(Icons.person_outline)
                      ),
                    ),
                 new Padding(padding: new EdgeInsets.all(5.0)),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio<int>(
                        activeColor: Colors.amber,
                          value: 0, groupValue: radioValue, onChanged: radioChange),
                      new Text("Mars",
                      style: new TextStyle(color: Colors.indigo),),
                      new Radio<int>(
                          activeColor: Colors.amber,
                          value: 1, groupValue: radioValue, onChanged: radioChange),
                      new Text("Jupiter",
                        style: new TextStyle(color: Colors.blue),),

                      new Radio<int>(
                          activeColor: Colors.amber,
                          value: 2, groupValue: radioValue, onChanged: radioChange),
                      new Text("Saturn",
                        style: new TextStyle(color: Colors.blue),),
                    ],
                  ),
                    new Padding(padding: new EdgeInsets.all(15.0),),
                    new Text(
                      _weightController.text.isEmpty ? "Please enter tne number" :"$_formattedText lbs",
                    style: new TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: 19.4,
                      fontWeight:FontWeight.w800,
                    ),)
                  ],
                )
            )
          ],
        ),
      ),
    );
  }

  double calcualte(String weight, double d) {
    if(int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0){
      return int.parse(weight) * d;
    }else{
      print("Worng");
      return int.parse("180") * 0.38;
    }
  }
}