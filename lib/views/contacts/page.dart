import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ContactsPage extends Page<ContactsState, Map<String, dynamic>> {
  ContactsPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ContactsState>(
                adapter: null,
                slots: <String, Dependent<ContactsState>>{
                }),
            middleware: <Middleware<ContactsState>>[
            ],);

}
