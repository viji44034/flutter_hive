import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:hive_text_project/maodal/textmodal.dart';

ValueNotifier<List<TextModal>> textModalListner = ValueNotifier([]);
void addText(TextModal model) async {
  final textTable = await Hive.openBox<TextModal>('usertable');
  model.id = await textTable.add(model);
  textModalListner.value.add(model);
  textModalListner.notifyListeners();
}

Future<String> getText() async {
  final textTable = await Hive.openBox<TextModal>('usertable');
  final d = textTable.values;
  return d.last.name!;
}

deleteText(int id) async {
  final textTable = await Hive.openBox<TextModal>('usertable');
  textTable.delete(id);
  getText();
}
