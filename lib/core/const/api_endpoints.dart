abstract final class ApiEndpoints {
  static const String hostUrlFirst = 'http://46.243.201.240:3077/';
  static const String hostUrlSecond = 'http://46.243.201.240:8000/';
  static const String message = 'user/onmessage';
  static const String controlOrganAll = 'data/org/list';
  static const String maxPages = 'user/maxpages';
  static const String getMessageHistory = 'user/page';
  static const String signIn = 'api/token/';
  static const String signUp = 'api/user/create/';
  static const String verif = 'api/verify_code/';

  static String controlOrganHead(String lowName) {
    return 'data/org/head?lowName=$lowName';
  }

  static String controlSupervisoryOrgan(String lowName) {
    return 'data/org/typec/list?lowName=$lowName';
  }

  static String requirements(String lowName, int idControl) {
    return 'data/org/requires/list?lowName=$lowName&idControl=$idControl';
  }

  static String npas(String lowName) {
    return 'data/org/npas?lowName=$lowName';
  }

  static String requirementsBody(
          String lowName, int idControl, int idRequire) =>
      'data/org/requires/body?lowName=$lowName&idControl=$idControl&idRequire=$idRequire';
}
