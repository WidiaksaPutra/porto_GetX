import 'dart:convert';

class DetailPeluangRegrae {
  DetailPeluangRegrae({
    this.status,
    this.message,
    this.data,
  });

  final bool? status;
  final String? message;
  final Data? data;

  factory DetailPeluangRegrae.fromRawJson(String str) => DetailPeluangRegrae.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DetailPeluangRegrae.fromJson(Map<String, dynamic> json) => DetailPeluangRegrae(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
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
    this.idProyek,
    this.kodeProyek,
    this.namaProyek,
    this.realisasiPenawaran,
    this.scheduleKebutuhanProyek,
    this.detail,
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
  final String? idProyek;
  final String? kodeProyek;
  final String? namaProyek;
  final DateTime? realisasiPenawaran;
  final String? scheduleKebutuhanProyek;
  final List<Detail?>? detail;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
    idProyek: json["id_proyek"],
    kodeProyek: json["kode_proyek"],
    namaProyek: json["nama_proyek"],
    realisasiPenawaran: json["realisasi_penawaran"] == null ? null : DateTime.parse(json["realisasi_penawaran"]),
    scheduleKebutuhanProyek: json["schedule_kebutuhan_proyek"],
    detail: List<Detail>.from(json["detail"].map((x) => Detail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id_peluang": idPeluang,
    "no_peluang": noPeluang,
    "tgl_peluang": "${tglPeluang!.year.toString().padLeft(4, '0')}-${tglPeluang!.month.toString().padLeft(2, '0')}-${tglPeluang!.day.toString().padLeft(2, '0')}",
    "id_customer": idCustomer,
    "nama_customer": namaCustomer,
    "id_peringkat_peluang": idPeringkatPeluang,
    "nama_peringkat_peluang": namaPeringkatPeluang,
    "keterangan_pengiriman": keteranganPengiriman,
    "lokasi_pengiriman": lokasiPengiriman,
    "tgl_selesai": "${tglSelesai!.year.toString().padLeft(4, '0')}-${tglSelesai!.month.toString().padLeft(2, '0')}-${tglSelesai!.day.toString().padLeft(2, '0')}",
    "att": att,
    "instalasi": instalasi,
    "lain_lain": lainLain,
    "is_hidden": isHidden,
    "id_proyek": idProyek,
    "kode_proyek": kodeProyek,
    "nama_proyek": namaProyek,
    "realisasi_penawaran": "${realisasiPenawaran!.year.toString().padLeft(4, '0')}-${realisasiPenawaran!.month.toString().padLeft(2, '0')}-${realisasiPenawaran!.day.toString().padLeft(2, '0')}",
    "schedule_kebutuhan_proyek": scheduleKebutuhanProyek,
    "detail": List<dynamic>.from(detail!.map((x) => x!.toJson())),
  };
}

class Detail {
  Detail({
    this.idPeluangDetail,
    this.idPeluang,
    this.idItemBuaso,
    this.kodeItem,
    this.namaItem,
    this.qty,
    this.idJenis,
    this.namaJenis,
    this.idSatuanJual,
    this.namaSatuanJual,
  });

  final String? idPeluangDetail;
  final String? idPeluang;
  final String? idItemBuaso;
  final String? kodeItem;
  final String? namaItem;
  final String? qty;
  final String? idJenis;
  final String? namaJenis;
  final String? idSatuanJual;
  final String? namaSatuanJual;

  factory Detail.fromRawJson(String str) => Detail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    idPeluangDetail: json["id_peluang_detail"],
    idPeluang: json["id_peluang"],
    idItemBuaso: json["id_item_buaso"],
    kodeItem: json["kode_item"],
    namaItem: json["nama_item"],
    qty: json["qty"],
    idJenis: json["id_jenis"],
    namaJenis: json["nama_jenis"],
    idSatuanJual: json["id_satuan_jual"],
    namaSatuanJual: json["nama_satuan_jual"],
  );

  Map<String, dynamic> toJson() => {
    "id_peluang_detail": idPeluangDetail,
    "id_peluang": idPeluang,
    "id_item_buaso": idItemBuaso,
    "kode_item": kodeItem,
    "nama_item": namaItem,
    "qty": qty,
    "id_jenis": idJenis,
    "nama_jenis": namaJenis,
    "id_satuan_jual": idSatuanJual,
    "nama_satuan_jual": namaSatuanJual,
  };
}
