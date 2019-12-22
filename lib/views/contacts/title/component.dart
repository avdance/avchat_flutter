import 'package:fish_redux/fish_redux.dart';

import '../item/state.dart';
import 'view.dart';


class ContactTitleComponent extends Component<ContactItemState> {
  ContactTitleComponent()
      : super(view: buildView);
}
