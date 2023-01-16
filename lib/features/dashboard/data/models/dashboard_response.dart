class DashboardResponse {
  final String result;
  final String description;
  final Map<String, dynamic>? data;

  DashboardResponse({required this.result, required this.description, this.data});

  factory DashboardResponse.fromJson(Map<String, dynamic> json) {
    return DashboardResponse(result: json['result'], description: json['description'], data: json['data']);
  }
}
