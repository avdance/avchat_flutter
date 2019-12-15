import 'package:avchat_flutter/views/message/item/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'state.dart';

Widget buildView(
    SessionItemState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    decoration: BoxDecoration(color: Color(0xf9fafc)),
    child: Padding(
      padding:
          EdgeInsets.only(top: 16.0, bottom: 16.0, right: 20.0, left: 20.0),
      child: Row(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(33.0),
                child: Image.network(
                  state.session.from_avatar,
                  width: 66.0,
                  height: 66.0,
                ),
              ),
              Offstage(
                offstage: state.session.unread == 0,
                child: Container(
                  alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(state.session.from_nick,
                  style: TextStyle(
                      color: Color(0xcc161f3d),
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold)),
              Text(state.session.from_nick,
                  style: TextStyle(color: Color(0x161f3d), fontSize: 13.0))
            ],
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[
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
            Text(state.session.last_time.toString(),
                style: TextStyle(color: Color(0x161f3d), fontSize: 11.0))
          ])
        ],
      ),
    ),
  );
}
