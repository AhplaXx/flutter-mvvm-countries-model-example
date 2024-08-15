class Success{
  int code;
  Object response;

  Success({required this.response, required this.code});
}
class Failure{
  int code;
  Object errorResponse;

  Failure({required this.errorResponse, required this.code});
}