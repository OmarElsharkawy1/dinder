class ConstantApi {
  static const String baseUrl = 'http://128.140.69.196/Dogs/api/';

  static const String login = '${baseUrl}Auth/Login';
  static const String googleRegister = '${baseUrl}api/Auth/register';
  static const String email = "email";
  static const String signUp = "sign-up";
  static const String password = "password";
  static const String getDogs = "${baseUrl}Dogs/GetAllDogsInfo";
  static const String getMyProfile = "${baseUrl}GetMyProfile";
}
