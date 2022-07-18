import 'dart:convert';

class ReportPeluang {
  ReportPeluang({
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

  factory ReportPeluang.fromRawJson(String str) => ReportPeluang.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReportPeluang.fromJson(Map<String, dynamic> json) => ReportPeluang(
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
    this.idPeluang,
    this.noPeluang,
    this.tglPeluang,
    this.idCustomer,
    this.namaCustomer,
    this.idPeringkatPeluang,
    this.namaPeringkatPeluang,
    this.keteranganPengiriman,
    this.lokasiPengiriman,
    this.tglSelesai,
    this.att,
    this.instalasi,
    this.lainLain,
    this.isHidden,
    this.baseline,
    this.idProyek,
    this.namaProyek,
    this.kodeProyek,
    this.realisasiPenawaran,
    this.scheduleKebutuhanProyek,
    this.linkReferensi,
    this.kelompokProyek,
    this.namaItem,
    this.qty,
  });

  final String? idPeluang;
  final String? noPeluang;
  final DateTime? tglPeluang;
  final String? idCustomer;
  final String? namaCustomer;
  final String? idPeringkatPeluang;
  final String? namaPeringkatPeluang;
  final String? keteranganPengiriman;
  final String? lokasiPengiriman;
  final DateTime? tglSelesai;
  final String? att;
  final bool? instalasi;
  final String? lainLain;
  final bool? isHidden;
  final String? baseline;
  final String? idProyek;
  final String? namaProyek;
  final String? kodeProyek;
  final DateTime? realisasiPenawaran;
  final String? scheduleKebutuhanProyek;
  final String? linkReferensi;
  final String? kelompokProyek;
  final String? namaItem;
  final String? qty;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idPeluang: json["id_peluang"],
    noPeluang: json["no_peluang"],
    tglPeluang: json["tgl_peluang"] == null ? null : DateTime.parse(json["tgl_peluang"]),
    idCustomer: json["id_customer"],
    namaCustomer: json["nama_customer"],
    idPeringkatPeluang: json["id_peringkat_peluang"],
    namaPeringkatPeluang: json["nama_peringkat_peluang"],
    keteranganPengiriman: json["keterangan_pengiriman"],
    lokasiPengiriman: json["lokasi_pengiriman"],
    tglSelesai: json["tgl_selesai"] == null ? null : DateTime.parse(json["tgl_selesai"]),
    att: json["att"],
    instalasi: json["instalasi"],
    lainLain: json["lain_lain"],
    isHidden: json["is_hidden"],
    baseline: json["baseline"],
    idProyek: json["id_proyek"],
    namaProyek: json["nama_proyek"],
    kodeProyek: json["kode_proyek"],
    realisasiPenawaran: json["realisasi_penawaran"] == null ? null : DateTime.parse(json["realisasi_penawaran"]),
    scheduleKebutuhanProyek: json["schedule_kebutuhan_proyek"],
    linkReferensi: json["link_referensi"],
    kelompokProyek: json["kelompok_proyek"],
    namaItem: json["nama_item"],
    qty: json["qty"],
  );

  Map<String, dynamic> toJson() => {
    "id_peluang": idPeluang,
    "no_peluang": noPeluang,
    "tgl_peluang": tglPeluang == null ? null : "${tglPeluang!.year.toString().padLeft(4, '0')}-${tglPeluang!.month.toString().padLeft(2, '0')}-${tglPeluang!.day.toString().padLeft(2, '0')}",
    "id_customer": idCustomer,
    "nama_customer": namaCustomer,
    "id_peringkat_peluang": idPeringkatPeluang,
    "nama_peringkat_peluang": namaPeringkatPeluang,
    "keterangan_pengiriman": keteranganPengiriman,
    "lokasi_pengiriman": lokasiPengiriman,
    "tgl_selesai": tglSelesai == null ? null : "${tglSelesai!.year.toString().padLeft(4, '0')}-${tglSelesai!.month.toString().padLeft(2, '0')}-${tglSelesai!.day.toString().padLeft(2, '0')}",
    "att": att,
    "instalasi": instalasi,
    "lain_lain": lainLain,
    "is_hidden": isHidden,
    "baseline": baseline,
    "id_proyek": idProyek,
    "nama_proyek": namaProyek,
    "kode_proyek": kodeProyek,
    "realisasi_penawaran": realisasiPenawaran == null ? null : "${realisasiPenawaran!.year.toString().padLeft(4, '0')}-${realisasiPenawaran!.month.toString().padLeft(2, '0')}-${realisasiPenawaran!.day.toString().padLeft(2, '0')}",
    "schedule_kebutuhan_proyek": scheduleKebutuhanProyek,
    "link_referensi": linkReferensi,
    "kelompok_proyek": kelompokProyek,
    "nama_item": namaItem,
    "qty": qty,
  };
}
