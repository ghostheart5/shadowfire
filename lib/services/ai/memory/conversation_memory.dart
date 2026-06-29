class ConversationMemory {
  final List<String> _messages = <String>[];

  void append(String value) {
    _messages.add(value);
  }

  List<String> snapshot() {
    return List<String>.unmodifiable(_messages);
  }
}