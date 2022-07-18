import 'dart:convert';

class ExportPeluang {
  ExportPeluang({
    this.status,
    this.message,
    this.data,
  });

  final bool? status;
  final String? message;
  final String? data;

  factory ExportPeluang.fromRawJson(String str) => ExportPeluang.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ExportPeluang.fromJson(Map<String, dynamic> json) => ExportPeluang(
    status: json["status"],
    message: json["message"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data,
  };
}
