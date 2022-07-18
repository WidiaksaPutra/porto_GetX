import 'dart:convert';

class MasHps {
  MasHps({
    this.status,
    this.message,
    required this.data,
  });

  final bool? status;
  final String? message;
  final List<Datum> data;

  factory MasHps.fromRawJson(String str) => MasHps.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MasHps.fromJson(Map<String, dynamic> json) => MasHps(
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
    this.idItem,
    this.kodeItem,
    this.namaItem,
    this.grupBuaso,
    this.satuanPakai,
    this.hpsPakai,
    this.satuanBeli,
    this.hpsBeli,
    this.tglHps,
  });

  final String? idItem;
  final String? kodeItem;
  final String? namaItem;
  final String? grupBuaso;
  final String? satuanPakai;
  final String? hpsPakai;
  final String? satuanBeli;
  final String? hpsBeli;
  final DateTime? tglHps;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idItem: json["id_item"],
    kodeItem: json["kode_item"],
    namaItem: json["nama_item"],
    grupBuaso: json["grup_buaso"],
    satuanPakai: json["satuan_pakai"],
    hpsPakai: json["hps_pakai"],
    satuanBeli: json["satuan_beli"],
    hpsBeli: json["hps_beli"],
    tglHps: json["tgl_hps"] == null ? null : DateTime.parse(json["tgl_hps"]),
  );

  Map<String, dynamic> toJson() => {
    "id_item": idItem,
    "kode_item": kodeItem,
    "nama_item": namaItem,
    "grup_buaso": grupBuaso,
    "satuan_pakai": satuanPakai,
    "hps_pakai": hpsPakai,
    "satuan_beli": satuanBeli,
    "hps_beli": hpsBeli,
    "tgl_hps": tglHps == null ? null : "${tglHps!.year.toString().padLeft(4, '0')}-${tglHps!.month.toString().padLeft(2, '0')}-${tglHps!.day.toString().padLeft(2, '0')}",
  };
}
