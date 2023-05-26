class ServerException implements Exception {
  final String message;

  ServerException(this.message);
}

class ClientException implements Exception {
  final String message;

  ClientException(this.message);
}

class SaveException implements Exception {}
