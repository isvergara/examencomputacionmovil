//ISMAEL VERGARA VIDELA
//16.936.330-7
//SEM 2 2023 | COMPUTACIÓN MÓVIL | eICFE1119-07

import 'package:examen_final/theme/theme.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  bool isLoading = false;

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
