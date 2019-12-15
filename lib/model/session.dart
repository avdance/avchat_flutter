///聊天条目信息
class MessageSession {
  String sessionId;
  String from_avatar;
  String from_uid;
  String from_nick;

  int unread;
  int last_time;

  String last_chat;

  MessageSession(sessionId,
      {this.from_uid,
      this.from_avatar,
      this.from_nick,
      this.unread,
      this.last_time,
      this.last_chat});

  MessageSession.fromJson(Map<String, dynamic> json) {
    sessionId = json['sessionId'];
    from_uid = json['from_uid'];
    from_avatar = json['from_avatar'];
    from_nick = json['from_nick'];
    unread = json['unread'];
    last_time = json['last_time'];
    last_chat = json['last_chat'];
  }
}
