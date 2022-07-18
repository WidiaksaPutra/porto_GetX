import 'dart:convert';

class HistoryNotification {
  HistoryNotification({
    this.status,
    this.message,
    required this.data,
    this.dataCount,
    this.totalPage,
  });

  final bool? status;
  final String? message;
  final List<Datum> data;
  final int? dataCount;
  final int? totalPage;

  factory HistoryNotification.fromRawJson(String str) => HistoryNotification.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HistoryNotification.fromJson(Map<String, dynamic> json) => HistoryNotification(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    dataCount: json["data_count"],
    totalPage: json["total_page"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "data_count": dataCount,
    "total_page": totalPage,
  };
}

class Datum {
  Datum({
    this.idHistoriNotifikasi,
    this.levelApproval,
    this.behavior,
    this.jenisTransaksi,
    this.noTransaksi,
    this.title,
    this.body,
    this.baseline,
    this.idKaryawan,
    this.idJabatan,
    this.createdAt,
    this.namaPengaju,
    this.approvalLevel,
    this.modifyAvailable,
  });

  final String? idHistoriNotifikasi;
  final String? levelApproval;
  final String? behavior;
  final String? jenisTransaksi;
  final String? noTransaksi;
  final String? title;
  final String? body;
  final String? baseline;
  final String? idKaryawan;
  final String? idJabatan;
  final DateTime? createdAt;
  final String? namaPengaju;
  final String? approvalLevel;
  final bool? modifyAvailable;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idHistoriNotifikasi: json["id_histori_notifikasi"],
    levelApproval: json["level_approval"],
    behavior: json["behavior"],
    jenisTransaksi: json["jenis_transaksi"],
    noTransaksi: json["no_transaksi"],
    title: json["title"],
    body: json["body"],
    baseline: json["baseline"],
    idKaryawan: json["id_karyawan"],
    idJabatan: json["id_jabatan"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    namaPengaju: json["nama_pengaju"],
    approvalLevel: json["approval_level"],
    modifyAvailable: json["modify_available"],
  );

  Map<String, dynamic> toJson() => {
    "id_histori_notifikasi": idHistoriNotifikasi,
    "level_approval": levelApproval,
    "behavior": behavior,
    "jenis_transaksi": jenisTransaksi,
    "no_transaksi": noTransaksi,
    "title": title,
    "body": body,
    "baseline": baseline,
    "id_karyawan": idKaryawan,
    "id_jabatan": idJabatan,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "nama_pengaju": namaPengaju,
    "approval_level": approvalLevel,
    "modify_available": modifyAvailable,
  };
}
