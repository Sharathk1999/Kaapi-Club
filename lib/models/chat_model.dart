class ChatModel {
  String? id;
  String? message;
  String? senderName;
  String? senderId;
  String? receiverId;
  String? timestamp;
  String? seenStatus;
  String? imgUrl;
  String? videoUrl;
  String? audioUrl;
  String? docUrl;
  List<String>? reactions;
  List<dynamic>? replies;

  ChatModel({
    this.id,
    this.message,
    this.senderName,
    this.senderId,
    this.receiverId,
    this.timestamp,
    this.seenStatus,
    this.imgUrl,
    this.videoUrl,
    this.audioUrl,
    this.docUrl,
    this.reactions,
    this.replies,
   });

  ChatModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    message = json["message"];
    senderName = json["senderName"];
    senderId = json["senderId"];
    receiverId = json["receiverId"];
    timestamp = json["timestamp"];
    seenStatus = json["seenStatus"];
    imgUrl = json["imgUrl"];
    videoUrl = json["videoUrl"];
    audioUrl = json["audioUrl"];
    docUrl = json["docUrl"];
    reactions =
        json["reactions"] == null ? null : List<String>.from(json["reactions"]);
    replies = json["replies"] ?? [];
  }

  Map<String, dynamic> toJson() {
    // ignore: no_leading_underscores_for_local_identifiers
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["message"] = message;
    _data["senderName"] = senderName;
    _data["senderId"] = senderId;
    _data["receiverId"] = receiverId;
    _data["timestamp"] = timestamp;
    _data["seenStatus"] = seenStatus;
    _data["imgUrl"] = imgUrl;
    _data["videoUrl"] = videoUrl;
    _data["audioUrl"] = audioUrl;
    _data["docUrl"] = docUrl;
    if (reactions != null) {
      _data["reactions"] = reactions;
    }
    if (replies != null) {
      _data["replies"] = replies;
    }
    return _data;
  }
}
