class HttpException implements Exception {
  // we are implementing all function which this class has
  final String? message;
  HttpException(this.message);

  @override
  String toString() {
    // TODO: implement toString
    return message.toString();
    // return super.toString(); // Instanse of HttpException
  }
}
