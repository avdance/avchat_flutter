import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

///contact list item view
Widget buildView(ContactItemState state, Dispatch dispatch, ViewService viewService) {
  return InkWell(
    child:_buildItemView(state),
  );
}


Widget _buildItemView(ContactItemState state){
  return Container(
    height: 55.0,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(state),
        Expanded(
          child: ContactContext(state),
        )
      ],
    ),
  );
}


///头像区域
Widget CircleAvatar(ContactItemState state) {
  return Container(
    alignment: Alignment.center,
    height: 55.0,
    margin: EdgeInsets.only(left: 15.0,top: 10.0, bottom: 10.0,right: 15.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: Image.network(
        state.itemModel.headerImage,
        width: 35.0,
        height: 35.0,
        fit: BoxFit.fill,
      ),
    ),
  );
}

///头像区域
Widget ContactContext(ContactItemState state) {
  return Container(
    alignment: Alignment.centerLeft,
    decoration: state.itemModel.isDiv? BoxDecoration(
      border: Border(
        top: BorderSide(
          color: Colors.black26,
          width: 1.0
        )
      )
    ):null,
    child: Text(state.itemModel.niceName,style: TextStyle(
        color: Colors.black,fontSize: 16.0
    )),
  );
}