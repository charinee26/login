import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  final String title;
  const Login({Key key, this.title}) : super(key: key);

  @override
  _appState createState() => _appState();
}

class _appState extends State<Login> {
  String user; //ประกาศตัวแปร
  String pass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.blue[100],
              ),
            ),
            Container(
              width: 250, //ความกว้างของกล่องข้อความ
              padding: EdgeInsets.all(8), //ความห่างของกล่องข้อความ
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    user = value;
                  });
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_box),
                    labelText: 'Username',
                    hintText: 'Enter Username',
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.blue,
                    ))),
              ),
            ),
            Container(
              width: 250,
              padding: EdgeInsets.all(8),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    pass = value;
                  });
                },
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Password',
                    hintText: 'Enter Password',
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.blue,
                    ))),
              ),
            ),
            RaisedButton(
              onPressed: () {
                validteTextFiedld(context);
              },
              child: Text('submit'),
              color: Colors.black45,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  void validteTextFiedld(BuildContext context) {
    //การแจ้งเตือน
    print(user + "---" + pass);
    if (user == null ||
        user.trim().isEmpty ||
        pass == null ||
        user.trim().isEmpty) {
      AlertDialog alert = AlertDialog(
        title: Text('เติือน'),
        content: Container(child: Text('แหกตาดูใหม่น่ะค่ะ ตอนเรียนไม่ตั้งใจ')),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          )
        ],
      );
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
  }
}
