import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  // bem importante essas etapas para o inicio--------
  runApp(MaterialApp(
      title: "Contador de Pessoas",
      home: Home()));
  //--------------------------------------------------
}

class Home extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Home> {
  int _people = 0;
  String _infoText = "Pode entrar";
  void _ChangePeople(int delta){
    setState(() {
      _people+= delta;

      if(_people < 0 ){
        _infoText = "eita mano";
      }

      if(_people> 15){
        _infoText = "Não pode entrar";
      } else if (_people > 0){
        _infoText = "Pode entrar";
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas : $_people",
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text("+1",
                        style:
                        TextStyle(fontSize: 40.0, color: Colors.white)),
                    onPressed: () {
                      _ChangePeople(1);
                      debugPrint("+1");
                      },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text("-1",
                        style:
                        TextStyle(fontSize: 40.0, color: Colors.white)),
                    onPressed: () {
                      _ChangePeople(-1);
                      debugPrint("-1")
                    ;},
                  ),
                ),
              ],
            ),
            Text(
              "$_infoText",
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            )
          ],
        )
      ],
    );
  }
}
