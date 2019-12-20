import 'package:avchat_flutter/model/session.dart';
import 'package:avchat_flutter/views/message/item/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'state.dart';

Widget buildView(SessionItemState state, Dispatch dispatch, ViewService viewService) {
  return
    Column(
      children: <Widget>[
        InkWell(
          child: Container(
            height: 85.0,
            width: double.infinity,
            padding: EdgeInsets.only(left: 20.0,right: 20.0),
            child: Row(
              mainAxisAlignment:  MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(state),
                TitleAndMessage(state),
                UnreadAndTime(state)
              ],
            ),
          ),
        ),
        Container(
            height: 0.5,
            margin: EdgeInsets.only(left: 20.0,right: 20.0),
            decoration: BoxDecoration(color: Color(0x1a161f3d))
        )
      ],
    );
}


///头像区域
Widget CircleAvatar(SessionItemState state){
  return Container(
      height: 85.0,
      margin: EdgeInsets.only(top: 15.0,bottom: 15.0),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Image.network(
              state.session.from_avatar,
              width: 55.0,
              height: 55.0,
            ),
          ),
          Offstage(
            offstage: state.session.unread == 0,
            child: Container(
              width: 12.0,
              height: 12.0,
              margin: EdgeInsets.only(right: 2.0,bottom: 2.0),
              decoration: BoxDecoration(
                color: Colors.red,
                border:Border.all(color: Colors.white,width: 1.0),
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
          ),
        ],
      ),
    );
}

///标题,最后一条消息的区域
Widget TitleAndMessage(SessionItemState state){
  return Expanded(
    child: Container(
      margin: EdgeInsets.all(15.0),
      height: 85.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(state.session.from_nick,
              style: TextStyle(
                  color: state.session.unread == 0?Color(0xcc161f3d):Color(0xFFe9446a),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold)),
          Text(state.session.last_chat,
              style: TextStyle(color: Color(0xa6161f3d), fontSize: 13.0))
        ],
      ),
    ),
  );
}

Widget UnreadAndTime(SessionItemState state){
  return Container(
    margin: EdgeInsets.only(top: 15.0,bottom: 15.0),
    height: 85.0,
    child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Offstage(
            offstage: state.session.unread == 0,
            child: Container(
              padding: EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(9.0)),
              child: Text(
                state.session.unread.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Text(state.session.getFormatTime(),
              style: TextStyle(
                  color: Color(0xFF161f3d),
                  fontSize: 11.0))
        ]),
  );
}