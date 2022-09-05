// To parse this JSON data, do
//
//     final listNotification = listNotificationFromJson(jsonString);

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
        data: json["data"] == List.empty() ? [] : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        dataCount: json["data_count"] == null ? 0 : json["data_count"].toInt(),
        totalPage: json["total_page"] == null ? 0 : json["total_page"].toInt(),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == List.empty() ? [] : List<dynamic>.from(data.map((x) => x.toJson())),
        "data_count": dataCount == null ? 0 : dataCount?.toInt(),
        "total_page": totalPage == null ? 0 : totalPage?.toInt(),
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
    final DateTime? createdAt;
    final String? namaPengaju;
    final String? title;
    final String? body;

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        noTransaksi: json["no_transaksi"] == null ? "-" : json["no_transaksi"].toString(),
        levelApproval: json["level_approval"] == null ? "-" : json["level_approval"].toString(),
        behavior: json["behavior"] == null ? "-" : json["behavior"].toString(),
        jenisTransaksi: json["jenis_transaksi"] == null ? "-" : json["jenis_transaksi"].toString(),
        baseline: json["baseline"] == null ? "-" : json["baseline"].toString(),
        idKaryawan: json["id_karyawan"] == null ? "-" : json["id_karyawan"].toString(),
        idJabatan: json["id_jabatan"] == null ? "-" : json["id_jabatan"].toString(),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        namaPengaju: json["nama_pengaju"] == null ? "-" : json["nama_pengaju"].toString(),
        title: json["title"] == null ? "-" : json["title"].toString(),
        body: json["body"] == null ? "-" : json["body"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "no_transaksi": noTransaksi == null ? "-" : noTransaksi.toString(),
        "level_approval": levelApproval == null ? "-" : levelApproval.toString(),
        "behavior": behavior == null ? "-" : behavior.toString(),
        "jenis_transaksi": jenisTransaksi == null ? "-" : jenisTransaksi.toString(),
        "baseline": baseline == null ? "-" : baseline.toString(),
        "id_karyawan": idKaryawan == null ? "-" : idKaryawan.toString(),
        "id_jabatan": idJabatan == null ? "-" : idJabatan.toString(),
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "nama_pengaju": namaPengaju == null ? "-" : namaPengaju.toString(),
        "title": title == null ? "-" : title.toString(),
        "body": body == null ? "-" : body.toString(),
    };
}