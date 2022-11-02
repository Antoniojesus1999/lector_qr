import 'package:flutter/cupertino.dart';

import '../models/bici_model.dart';

class ProductFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Bici bici;

  ProductFormProvider(this.bici);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
