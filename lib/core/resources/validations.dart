
import 'app_constants.dart';

class Validations {
  static String? validateEmail(String? value){
    if(value == null || value.isEmpty){
      return "email is required";
    }

    if(!RegExp(AppConstants.emailRegex).hasMatch(value)){
      return "Please enter a valid email address";
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'password is required';
    }

    // Check for minimum length
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    // Check for at least one uppercase letter
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Must contain at least one uppercase letter';
    }

    // Check for at least one number
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Must contain at least one number';
    }

    // Check for at least one special character
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Must contain at least one special character';
    }

    return null;
  }

  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }

    // استخدام trim هنا لضمان أن المسافات لا تُحسب ضمن الحد الأدنى للحروف إذا أردت ذلك
    if (value.trim().length < 3) {
      return 'Username must be at least 3 characters';
    }

    // التعبير النمطي الجديد
    final usernameRegex = RegExp(r'^[a-zA-Z0-9_]+(?: [a-zA-Z0-9_]+)*$');

    if (!usernameRegex.hasMatch(value)) {
      return 'Only letters, numbers, underscore (_), and single spaces are allowed';
    }

    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    // بنشيل المسافات لو المستخدم كتبها بالغلط
    if (!RegExp(AppConstants.phoneRegex).hasMatch(value.trim())) {
      return 'Please enter a valid 11-digit phone number';
    }

    return null;
  }
}