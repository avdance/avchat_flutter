import 'package:fish_redux/fish_redux.dart';
import '../state.dart';
import '../reducer.dart';
import '../item/component.dart';


class ContactItemAdapter extends SourceFlowAdapter<ContactsState>{
  ContactItemAdapter() : super(
    pool:<String,Component<Object>>{
      'contact': ContactItemComponent()
    },
    reducer: buildReducer()
  );
}