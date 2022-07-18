import 'dart:convert';

class DropdownCustomer {
  DropdownCustomer({
    this.status,
    this.message,
    required this.data,
  });

  final bool? status;
  final String? message;
  final List<Datum> data;

  factory DropdownCustomer.fromRawJson(String str) => DropdownCustomer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DropdownCustomer.fromJson(Map<String, dynamic> json) => DropdownCustomer(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
      "status": status,
      "message": message,
      "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.idCustomer,
    this.namaCustomer,
  });

  final String? idCustomer;
  final String? namaCustomer;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idCustomer: json["id_customer"],
    namaCustomer: json["nama_customer"],
  );

  Map<String, dynamic> toJson() => {
    "id_customer": idCustomer,
    "nama_customer": namaCustomer,
  };
}
