import 'package:flutterredux/redux/action/action_type_model.dart';

enum EFindType {
  search,delete
}

final searchAction = (String context) => ActionType<String>(type: EFindType.search,data: context);

final deleteAction = (String data) => ActionType<String>(type: EFindType.delete,data: data);