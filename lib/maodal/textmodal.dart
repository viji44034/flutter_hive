import 'package:hive/hive.dart';
part 'textmodal.g.dart';

@HiveType(typeId: 1)
class TextModal {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String? name;

  TextModal({this.id, required this.name});
}
