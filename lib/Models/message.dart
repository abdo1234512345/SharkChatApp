class Message {
  final String message;
  final String id;
  Message(this.message, this.id);
  factory Message.fromJson(jasondata) {
    return Message(jasondata['message'], jasondata['id']);
  }
}
