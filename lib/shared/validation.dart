class Validation {
  static String validatePassword(String text){
    if(text.length < 6){
      return 'Password minimal 6 karakter';
    }
    return null;
  }

  static String validateEmail(String text){
    if (!text.contains('@')){
      return 'Format email tidak valid';
    }
    return null;
  }

  String validateName(String text){
    if(text.isEmpty){
      return 'Nama harus diisi';
    }
    return null;
  }
}