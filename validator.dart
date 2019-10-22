class FieldValidator {

  static String validateEmail(String email){
    if(email.isEmpty){
      return 'Please enter your email!';
    }
    if(!email.contains('@')){
      return 'Please enter a valid email!';
    }
    return null;
  }

  static String validatePassword(String password){
    if(password.isEmpty){
      return 'Please enter password!';
    }
    if(password.length < 8){
      return 'Password must be aleast 8 characters';
    }
    return null;
  }

}