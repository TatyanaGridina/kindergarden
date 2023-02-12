class ChefboardResponse {
  final String result;
  final String description;
  final Map<String, dynamic>? data;

  ChefboardResponse({required this.result, required this.description, this.data});

  factory ChefboardResponse.fromJson(Map<String, dynamic> json) {
    return ChefboardResponse(result: json['result'], description: json['description'], data: json['data']);
  }
}
