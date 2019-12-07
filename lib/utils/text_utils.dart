///TextUtils
class TextUtils{
  static bool isEmpty(String text){
    if(text == null || text.isEmpty){
      return true;
    }
    return false;
  }

  static bool equals(String text,String compare){
    if (text == compare){
      return true;
    }
    if(text == null || compare == null){
      return false;
    }
    return text.compareTo(compare) == 0;
  }
}