import 'package:intl/intl.dart';

///关于时间的工具类
class DateUtils {
  static final DateFormat _hourMinFormat = new DateFormat("H:Hm");
  static final DateFormat _monDayFormat = new DateFormat("M月d日");
  static final DateFormat _yearMouFormat = new DateFormat("y年M月d日");
  static final int _ONE_MINUTE_MILLIONS = 60 * 1000;
  static final int _ONE_HOUR_MILLIONS = 60 * _ONE_MINUTE_MILLIONS;
  static final int _ONE_DAY_MILLIONS = 24 * _ONE_HOUR_MILLIONS;

  ///聊天中的时间格式化
  static String formatChat(int time){
    DateTime _now = DateTime.now();
    DateTime _updateTime = DateTime.fromMillisecondsSinceEpoch(time);
    String _timeString;
    //判断时间间隔
    int duration = _now.millisecondsSinceEpoch - time;
    Duration dayDuration = _now.difference(_updateTime);

    if (duration < 10 * _ONE_MINUTE_MILLIONS){
      _timeString = "刚刚";
    }else if(dayDuration.inDays == 0){
      _timeString = _hourMinFormat.format(_updateTime);
    }else if(dayDuration.inDays == 1){
      _timeString = "昨天";
    }else if(dayDuration.inDays > 1 && _now.year == _updateTime.year){
      _timeString = _monDayFormat.format(_updateTime);
    }else{
      _timeString = _yearMouFormat.format(_updateTime);
    }

    return _timeString;
  }
}
