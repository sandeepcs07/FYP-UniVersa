import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/app.locator.dart';
import '../../../../services/sharedpref_service.dart';

class ChatingViewModel extends BaseViewModel {
  final sharedpref = locator<SharedprefService>();
  TextEditingController chat = TextEditingController();
}
