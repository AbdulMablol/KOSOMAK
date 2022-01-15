import 'package:flutter/material.dart';
import 'package:raspberry_pi_stream_camera_to_flutter_live_example/model/slide.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 220,
          height:70,
          decoration: ShapeDecoration(
              color: Colors.deepPurple,
              shape:
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80)
              )
          ),
          margin: EdgeInsets.fromLTRB(120, 100, 120, 20),
          padding: EdgeInsets.all(10),
          child: Text('IVS', style: TextStyle(
              decoration: TextDecoration.none, color:Colors.white, fontFamily: 'Consolas'
          ),
            textAlign:TextAlign.center,
          ),
        ),
        Text(slideList[index].title, style: TextStyle(fontSize:18,
            decoration: TextDecoration.none, fontFamily: 'Constantia', color:Color(0xFFB2BCCC)
        ),
        ),
        Column(
          children:<Widget>[
            Container(
              alignment: AlignmentDirectional.center,
              margin: EdgeInsets.only(top: 120),
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                    image: AssetImage(slideList[index].imageUrl)
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}