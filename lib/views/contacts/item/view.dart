import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

///contact list item view
Widget buildView(ContactItemState state, Dispatch dispatch, ViewService viewService) {
  return InkWell(
    child:_buildItemView(state),
  );
}


Widget _buildItemView(ContactItemState state){
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      CircleAvatar(state),
      ContactContext(state)
    ],
  );
}


///头像区域
Widget CircleAvatar(ContactItemState state) {
  return Container(
    alignment: Alignment.center,
    height: 65.0,
    margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.network(
        state.itemModel.headerImage,
        width: 45.0,
        height: 45.0,
      ),
    ),
  );
}

///头像区域
Widget ContactContext(ContactItemState state) {
  return Expanded(
    child: Column(
      children: <Widget>[
        Expanded(
          child: Text(state.itemModel.niceName,style: TextStyle(
              color: Colors.black,fontSize: 14.0
          )),
        ),
        Container(
          height: 1.0,
          decoration: BoxDecoration(
            color: Colors.black26
          ),
        )
      ],
    ),
  );
}