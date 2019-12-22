import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import '../item/state.dart';

///contact list item view
Widget buildView(ContactItemState state, Dispatch dispatch, ViewService viewService) {
  return InkWell(
    child: _buildTitle(state),
  );
}


///Item的标题部分
Widget _buildTitle(ContactItemState state){
  //如果是TIle
  return Container(
    alignment: Alignment.centerLeft,
    height: 30.0,
    padding: EdgeInsets.only(left: 15.0),
    decoration: BoxDecoration(
      color: Colors.black12,
      border: Border(
        top: BorderSide(color: Colors.black12,width: 0.5),
        bottom: BorderSide(color: Colors.black12,width: 0.5)
      )
    ),
    child:Text(state.itemModel.label,style: TextStyle(
      color: Colors.black26,fontSize: 12.0
    )),
  );
}