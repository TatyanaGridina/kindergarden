class BackendResponse {
  final String result;
  final String description;
  final Map<String, dynamic>? data;

  BackendResponse({required this.result, required this.description, this.data});

  factory BackendResponse.fromJson(Map<String, dynamic> json) {
    return BackendResponse(result: json['result'], description: json['description'], data: json['data']);
  }
}
