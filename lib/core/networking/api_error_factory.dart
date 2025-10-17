import 'package:pet_finder_app/core/networking/api_error_model.dart';

class ApiErrorFactory {
  static ApiErrorModel get defaultError =>
      ApiErrorModel(message: "Something went wrong");
}
