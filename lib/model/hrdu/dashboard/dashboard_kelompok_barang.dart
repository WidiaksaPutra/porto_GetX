import 'dart:convert';

class DashInvNilaiKelompokBarang {
  final bool? status;
  final String? message;
  final List<Datum> data;

  DashInvNilaiKelompokBarang({
    this.status,
    this.message,
    required this.data,
  });

  factory DashInvNilaiKelompokBarang.fromRawJson(String str) => DashInvNilaiKelompokBarang.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DashInvNilaiKelompokBarang.fromJson(Map<String, dynamic> json) => DashInvNilaiKelompokBarang(
    status: json["status"],
    message: json["message"] == null ? "-" : json["message"].toString(),
    data: json["data"] == null ? []
    : json["data"] == List.empty() ? []
    : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message == null ? "-" : message.toString(),
    // ignore: unnecessary_null_comparison
    "data": data == null ? []
    : data == List.empty() ? []
    : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  final String? idKelompok;
  final String? namaKelompok;
  final DateTime? tglPosting;
  final String? saldoAwal;
  final String? masuk;
  final String? keluar;
  final String? saldoAkhir;
  final String? hpsPakai;
  final String? summary;

  Datum({
    this.idKelompok,
    this.namaKelompok,
    this.tglPosting,
    this.saldoAwal,
    this.masuk,
    this.keluar,
    this.saldoAkhir,
    this.hpsPakai,
    this.summary,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idKelompok: json["id_kelompok"] == null ? "-" : json["id_kelompok"].toString(),
    namaKelompok: json["nama_kelompok"] == null ? "-" : json["nama_kelompok"].toString(),
    tglPosting: json["tgl_posting"] == null ? null : DateTime.parse(json["tgl_posting"]),
    saldoAwal: json["saldo_awal"] == null ? "-" : json["saldo_awal"].toString(),
    masuk: json["masuk"] == null ? "-" : json["masuk"].toString(),
    keluar: json["keluar"] == null ? "-" : json["keluar"].toString(),
    saldoAkhir: json["saldo_akhir"] == null ? "-" : json["saldo_akhir"].toString(),
    hpsPakai: json["hps_pakai"] == null ? "-" : json["hps_pakai"].toString(),
    summary: json["summary"] == null ? "-" : json["summary"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "id_kelompok": idKelompok == null ? "-" : idKelompok.toString(),
    "nama_kelompok": namaKelompok == null ? "-" : namaKelompok.toString(),
    "tgl_posting": tglPosting == null ? null : tglPosting!.toIso8601String(),
    "saldo_awal": saldoAwal == null ? "-" : saldoAwal.toString(),
    "masuk": masuk == null ? "-" : masuk.toString(),
    "keluar": keluar == null ? "-" : keluar.toString(),
    "saldo_akhir": saldoAkhir == null ? "-" : saldoAkhir.toString(),
    "hps_pakai": hpsPakai == null ? "-" : hpsPakai.toString(),
    "summary": summary == null ? "-" : summary.toString(), 
  };
}
