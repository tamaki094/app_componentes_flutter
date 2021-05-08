import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://www.cinepremiere.com.mx/wp-content/uploads/2018/07/stanleeanimado.jpg"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage(
              "https://cdn.cienradios.com/wp-content/uploads/sites/3/2019/07/Stan-Lee.jpg"),
          placeholder: AssetImage('assets/img/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}
