import 'package:hive/hive.dart';

class MessageListAdapter extends TypeAdapter<List<String>> {
  @override
  final typeId = 0; 

  @override
  List<String> read(BinaryReader reader) {
    final length = reader.readByte();
    return List.generate(length, (_) => reader.readString());
  }

  @override
  void write(BinaryWriter writer, List<String> obj) {
    writer.writeByte(obj.length);
    for (final message in obj) {
      writer.writeString(message);
    }
  }
}