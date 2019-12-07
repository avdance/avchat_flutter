import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    RegisterState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    body: PageView(
      scrollDirection: Axis.horizontal,
      controller: state.controller,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        //create widgets.
        generateUserPwd(state, dispatch),
        generateUserInfo(state, dispatch),
        //generateVerify(state, dispatch)
        //create widgets.
      ],
    ),
  );
}

///生成用户名/密码
generateUserPwd(RegisterState state, Dispatch dispatch) {
  return Container(
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
                    "注册\n请设置您的账号与密码",
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
                          child: Text("请输入用户名",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.black38, fontSize: 12.0)),
                        ),
                        TextField(
                            keyboardType: TextInputType.text,
                            inputFormatters: <TextInputFormatter>[
                              LengthLimitingTextInputFormatter(12)
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
                            child: Text("请输入昵称",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black38, fontSize: 12.0)),
                          ),
                          TextField(
                              controller: state.nickEditController,
                              focusNode: state.focusNodeNick,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16.0),
                              cursorColor: Colors.blue),
                        ]),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
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
                            controller: state.phoneEditController,
                            focusNode: state.focusNodePhone,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16.0),
                            cursorColor: Colors.blue)
                      ],
                    )
                  ],
                ),
              ),
            )),
        Expanded(
          flex: 3,
          child: Container(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(left: 40.0, right: 40.0),
              child: GestureDetector(
                onTap: () => dispatch(RegisterActionCreator.onNext()),
                child: Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.0),
                      gradient: const LinearGradient(
                          colors: [Color(0xFF6a60ee), Color(0xFF56edff)])),
                  child: Center(
                    child: Text("继续",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 21.0,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );
}

///生成用户信息
generateUserInfo(RegisterState state, Dispatch dispatch) {
  return Container(
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
                    "欢迎你\n完成个人信息，开始游玩",
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
                          child: Text("请输入密码",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.black38, fontSize: 12.0)),
                        ),
                        TextField(
                            keyboardType: TextInputType.text,
                            onChanged: (text) => {
                              dispatch(RegisterActionCreator.onPwdError())
                            },
                            inputFormatters: <TextInputFormatter>[
                              LengthLimitingTextInputFormatter(20)
                            ],
                            controller: state.pwdEditController,
                            focusNode: state.focusNodePwd,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16.0),
                            cursorColor: Colors.blue),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Text("请确认密码",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.black38, fontSize: 12.0)),
                        ),
                        TextField(
                            onChanged: (text) => {
                                dispatch(RegisterActionCreator.onPwdError())
                            },
                            keyboardType: TextInputType.text,
                            inputFormatters: <TextInputFormatter>[
                              LengthLimitingTextInputFormatter(20)
                            ],
                            controller: state.pwd2EditController,
                            focusNode: state.focusNodePwd2,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16.0),
                            cursorColor: Colors.blue),
                      ],
                    )
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
                    onTap: () => state.isPasswordSuccess
                        ? dispatch(RegisterActionCreator.onRegister())
                        : dispatch(RegisterActionCreator.onPwdError(flag: true)),
                    child: Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.0),
                          gradient: handleBackground(state.isPasswordSuccess)),
                      child: Center(
                        child: Text("开始使用",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 21.0,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

LinearGradient handleBackground(bool enable) {
  if (enable) {
    return const LinearGradient(colors: [Color(0xFF6a60ee), Color(0xFF56edff)]);
  } else {
    return const LinearGradient(colors: [Colors.black38,Colors.black38]);
  }
}

///生成用验证码
generateVerify(RegisterState state, Dispatch dispatch) {}
