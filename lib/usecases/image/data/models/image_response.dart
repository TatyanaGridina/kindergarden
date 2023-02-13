class ImageResponse {
  final String result;
  final String description;
  final Map<String, dynamic>? data;

  ImageResponse({required this.result, required this.description, this.data});

  factory ImageResponse.fromJson(Map<String, dynamic> json) {
    return ImageResponse(result: json['result'], description: json['description'], data: json['data']);
  }
}
