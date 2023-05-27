abstract final class ApiEndpoints {
  static const String hostUrl = 'http://46.243.201.240:3077/';
  static const String message = 'user/onmessage';
  static const String controlOrganAll = 'data/org/list';

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
}
