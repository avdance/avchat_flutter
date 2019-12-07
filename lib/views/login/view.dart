import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(LoginState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    body: Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(left: 40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/ic_logo.webp",
                      width: 58.0,
                      height: 48.0,
                    ),
                    Text(
                      "欢迎你.\n请登录以继续使用",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              flex: 4,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(right: 40.0, left: 40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(bottom: 4.0),
                            child: Text("请输入手机号",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black38, fontSize: 12.0)),
                          ),
                          TextField(
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                WhitelistingTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(11)
                              ],
                              controller: state.nameEditController,
                              focusNode: state.focusNodeName,
                              autofocus: true,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16.0),
                              cursorColor: Colors.blue)
                        ],
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: Text("请输入验证码",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.black38, fontSize: 12.0)),
                            ),
                            TextField(
                                controller: state.pwdEditController,
                                focusNode: state.focusNodePwd,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                  icon: Icon(Icons.remove_red_eye,
                                      color: state.isShowPwd
                                          ? Colors.black38
                                          : Colors.black),
                                  onPressed: () =>
                                      dispatch(LoginActionCreator.onPassword()),
                                )),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 16.0),
                                obscureText: state.isShowPwd,
                                cursorColor: Colors.blue),
                            Container(
                              width: double.infinity,
                              child: GestureDetector(
                                onTap: () =>
                                    dispatch(LoginActionCreator.onAction()),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Text("忘记密码",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 12.0)),
                                  ),
                                ),
                              ),
                            )
                          ])
                    ],
                  ),
                ),
              )),
          Expanded(
            flex: 3,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 40.0, right: 40.0),
                    child: GestureDetector(
                      onTap: () => dispatch(LoginActionCreator.onLogin()),
                      child: Container(
                        height: 50.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0),
                            gradient: const LinearGradient(colors: [
                              Color(0xFF6a60ee),
                              Color(0xFF56edff)
                            ])),
                        child: Center(
                          child: Text("登录",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 21.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 12.0),
                    child: GestureDetector(
                      //点击事件去注册
                      onTap: () => dispatch(LoginActionCreator.onRegister()),
                      child: Text.rich(TextSpan(children: [
                        TextSpan(
                            text: "还没有注册账号？",
                            style: TextStyle(
                                color: Colors.black45, fontSize: 14.0)),
                        TextSpan(
                            text: "去注册",
                            style: TextStyle(
                                color: Colors.lightBlue, fontSize: 14.0))
                      ])),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
