import 'dart:convert';

class ListNotification {
  ListNotification({
    this.status,
    required this.data,
    this.dataCount,
    this.totalPage,
  });

  final bool? status;
  final List<Datum> data;
  final int? dataCount;
  final int? totalPage;

  factory ListNotification.fromRawJson(String str) => ListNotification.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListNotification.fromJson(Map<String, dynamic> json) => ListNotification(
    status: json["status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    dataCount: json["data_count"],
    totalPage: json["total_page"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "data_count": dataCount,
    "total_page": totalPage,
  };
}

class Datum {
  Datum({
    this.noTransaksi,
    this.levelApproval,
    this.behavior,
    this.jenisTransaksi,
    this.baseline,
    this.idKaryawan,
    this.idJabatan,
    this.createdAt,
    this.namaPengaju,
    this.title,
    this.body,
  });

  final String? noTransaksi;
  final String? levelApproval;
  final String? behavior;
  final String? jenisTransaksi;
  final String? baseline;
  final String? idKaryawan;
  final String? idJabatan;
  final String? createdAt;
  final String? namaPengaju;
  final String? title;
  final String? body;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    noTransaksi: json["no_transaksi"],
    levelApproval: json["level_approval"],
    behavior: json["behavior"],
    jenisTransaksi: json["jenis_transaksi"],
    baseline: json["baseline"],
    idKaryawan: json["id_karyawan"],
    idJabatan: json["id_jabatan"],
    createdAt: json["created_at"],
    namaPengaju: json["nama_pengaju"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "no_transaksi": noTransaksi,
    "level_approval": levelApproval,
    "behavior": behavior,
    "jenis_transaksi": jenisTransaksi,
    "baseline": baseline,
    "id_karyawan": idKaryawan,
    "id_jabatan": idJabatan,
    "created_at": createdAt,
    "nama_pengaju": namaPengaju,
    "title": title,
    "body": body,
  };
}
