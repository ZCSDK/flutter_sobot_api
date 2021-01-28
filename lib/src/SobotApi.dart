import 'dart:async';
import 'package:flutter/services.dart';

class SobotApi {
  String startZhichiMethod = 'ZCSobot_Plugin_Start_SDK';
  String openSobotHelpCenterMethod = 'ZCSobot_Plugin_Open_Help_Center';
  String openSobotHelpMallCenterMethod = 'ZCSobot_Plugin_Open_Help_Mall_Center';
  String closeSobotChatMethod = 'ZCSobot_Plugin_Close_Sobot_Chat';
  String getUnReadMessageMethod = 'ZCSobot_Plugin_Get_Unread_Message';
  String sendLocationMethod = 'ZCSobot_Plugin_Send_Location';

  //交互的通道名称，flutter和native是通过这个标识符进行相互间的通信
  static const sobotMethodChannel = MethodChannel('ZCSobot_Plugin_Channel');

  //异步执行调用原生方法，保持页面不卡住，因为调用原生的方法可能没实现会抛出异常，所以trycatch包住
  Future<dynamic> startZhichi(initParams) async {
    try {
      /*
          结果 type: 1 返回按钮点击
          value: 空字符串
          desc: 文本 执行返回操作
          结果 type: 5 发送位置信息
          value: 空字符串
          desc: 文本 发送位置
          */
      final result =
          await sobotMethodChannel.invokeMethod(startZhichiMethod, initParams);
      return result;
    } on PlatformException catch (e) {
      //抛出异常
      print(e);
      return {};
    }
  }

  Future<dynamic> openSobotHelpCenter(initParams) async {
    try {
      /*
          结果 type: 1 返回按钮点击
          value: 空字符串
          desc: 文本 执行返回操作
          结果 type: 5 发送位置信息
          value: 空字符串
          desc: 文本 发送位置
          */
      final result = await sobotMethodChannel.invokeMethod(
          openSobotHelpCenterMethod, initParams);
      return result;
    } on PlatformException catch (e) {
      //抛出异常
      print(e);
      return {};
    }
  }

  Future<dynamic> openSobotHelpMallCenter(initParams) async {
    try {
      /*
          结果 type: 1 返回按钮点击
          value: 空字符串
          desc: 文本 执行返回操作
          结果 type: 5 发送位置信息
          value: 空字符串
          desc: 文本 发送位置
          */
      final result = await sobotMethodChannel.invokeMethod(
          openSobotHelpMallCenterMethod, initParams);
      return result;
    } on PlatformException catch (e) {
      //抛出异常
      return {};
    }
  }

  Future<dynamic> getUnReadMessage() async {
    try {
      /*
          结果 type: 4 未读消息
          value: 未读消息数量
          desc: 文本获取未读消息数
          */
      final result =
          await sobotMethodChannel.invokeMethod(getUnReadMessageMethod);

      return result;
    } on PlatformException catch (e) {
      //抛出异常
      return {};
    }
  }

  Future<void> closeSobotChat() async {
    try {
      await sobotMethodChannel.invokeMethod(closeSobotChatMethod);
    } on PlatformException catch (e) {
      //抛出异常
    }
  }

  Future<void> sendLocation(Map<String, Object> locationInfo) async {
    try {
      await sobotMethodChannel.invokeMethod(sendLocationMethod, locationInfo);
    } on PlatformException catch (e) {
      //抛出异常
    }
  }
}
