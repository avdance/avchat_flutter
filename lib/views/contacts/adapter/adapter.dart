import 'package:fish_redux/fish_redux.dart';
import '../state.dart';
import '../reducer.dart';
import '../item/component.dart';
import '../title/component.dart';


class ContactItemAdapter extends SourceFlowAdapter<ContactsState>{
  ContactItemAdapter() : super(
    pool:<String,Component<Object>>{
      'item': ContactItemComponent(),
      'title': ContactTitleComponent()
    },
    reducer: buildReducer()
  );
}