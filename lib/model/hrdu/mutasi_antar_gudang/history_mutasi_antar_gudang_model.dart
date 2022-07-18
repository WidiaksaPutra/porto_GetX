import 'dart:convert';

class HistoryMag {
  HistoryMag({
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

  factory HistoryMag.fromRawJson(String str) => HistoryMag.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HistoryMag.fromJson(Map<String, dynamic> json) => HistoryMag(
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
    this.idMutasiAntarGudang,
    this.tglMutasiAntarGudang,
    this.noMutasiAntarGudang,
    this.idItemBuaso,
    this.idGudangAsal,
    this.idGudangTujuan,
    this.qtyMutasi,
    this.catatanMutasi,
    this.baseline,
    this.kodeItem,
    this.namaItem,
    this.idSatuan,
    this.namaSatuan,
    this.namaGudangAsal,
    this.namaGudangTujuan,
    this.idApprovalTransaksi,
    this.noTransaksi,
    this.kodeTransaksi,
    this.idKaryawanApproval,
    this.idJabatanApproval,
    this.statusApproval,
    this.catatanApproval,
    this.approvalCreatedAt,
    this.tglApproval,
    this.approvalLevel,
    this.namaKaryawanApproval,
    this.namaJabatanApproval,
    this.namaKaryawanPengaju,
    this.namaJabatanPengaju,
  });

  final String? idMutasiAntarGudang;
  final DateTime? tglMutasiAntarGudang;
  final String? noMutasiAntarGudang;
  final String? idItemBuaso;
  final String? idGudangAsal;
  final String? idGudangTujuan;
  final String? qtyMutasi;
  final String? catatanMutasi;
  final String? baseline;
  final String? kodeItem;
  final String? namaItem;
  final String? idSatuan;
  final String? namaSatuan;
  final String? namaGudangAsal;
  final String? namaGudangTujuan;
  final String? idApprovalTransaksi;
  final String? noTransaksi;
  final String? kodeTransaksi;
  final String? idKaryawanApproval;
  final String? idJabatanApproval;
  final String? statusApproval;
  final String? catatanApproval;
  final String? approvalCreatedAt;
  final DateTime? tglApproval;
  final String? approvalLevel;
  final String? namaKaryawanApproval;
  final String? namaJabatanApproval;
  final String? namaKaryawanPengaju;
  final String? namaJabatanPengaju;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idMutasiAntarGudang: json["id_mutasi_antar_gudang"],
    tglMutasiAntarGudang: json["tgl_mutasi_antar_gudang"] == null ? null : DateTime.parse(json["tgl_mutasi_antar_gudang"]),
    noMutasiAntarGudang: json["no_mutasi_antar_gudang"],
    idItemBuaso: json["id_item_buaso"],
    idGudangAsal: json["id_gudang_asal"],
    idGudangTujuan: json["id_gudang_tujuan"],
    qtyMutasi: json["qty_mutasi"],
    catatanMutasi: json["catatan_mutasi"],
    baseline: json["baseline"],
    kodeItem: json["kode_item"],
    namaItem: json["nama_item"],
    idSatuan: json["id_satuan"],
    namaSatuan: json["nama_satuan"],
    namaGudangAsal: json["nama_gudang_asal"],
    namaGudangTujuan: json["nama_gudang_tujuan"],
    idApprovalTransaksi: json["id_approval_transaksi"],
    noTransaksi: json["no_transaksi"],
    kodeTransaksi: json["kode_transaksi"],
    idKaryawanApproval: json["id_karyawan_approval"],
    idJabatanApproval: json["id_jabatan_approval"],
    statusApproval: json["status_approval"],
    catatanApproval: json["catatan_approval"],
    approvalCreatedAt: json["approval_created_at"],
    tglApproval: json["tgl_approval"] == null ? null : DateTime.parse(json["tgl_approval"]),
    approvalLevel: json["approval_level"],
    namaKaryawanApproval: json["nama_karyawan_approval"],
    namaJabatanApproval: json["nama_jabatan_approval"],
    namaKaryawanPengaju: json["nama_karyawan_pengaju"],
    namaJabatanPengaju: json["nama_jabatan_pengaju"],
  );

  Map<String, dynamic> toJson() => {
    "id_mutasi_antar_gudang": idMutasiAntarGudang,
    "tgl_mutasi_antar_gudang": tglMutasiAntarGudang == null ? null : "${tglMutasiAntarGudang!.year.toString().padLeft(4, '0')}-${tglMutasiAntarGudang!.month.toString().padLeft(2, '0')}-${tglMutasiAntarGudang!.day.toString().padLeft(2, '0')}",
    "no_mutasi_antar_gudang": noMutasiAntarGudang,
    "id_item_buaso": idItemBuaso,
    "id_gudang_asal": idGudangAsal,
    "id_gudang_tujuan": idGudangTujuan,
    "qty_mutasi": qtyMutasi,
    "catatan_mutasi": catatanMutasi,
    "baseline": baseline,
    "kode_item": kodeItem,
    "nama_item": namaItem,
    "id_satuan": idSatuan,
    "nama_satuan": namaSatuan,
    "nama_gudang_asal": namaGudangAsal,
    "nama_gudang_tujuan": namaGudangTujuan,
    "id_approval_transaksi": idApprovalTransaksi,
    "no_transaksi": noTransaksi,
    "kode_transaksi": kodeTransaksi,
    "id_karyawan_approval": idKaryawanApproval,
    "id_jabatan_approval": idJabatanApproval,
    "status_approval": statusApproval,
    "catatan_approval": catatanApproval,
    "approval_created_at": approvalCreatedAt,
    "tgl_approval": tglApproval == null ? null : "${tglApproval!.year.toString().padLeft(4, '0')}-${tglApproval!.month.toString().padLeft(2, '0')}-${tglApproval!.day.toString().padLeft(2, '0')}",
    "approval_level": approvalLevel,
    "nama_karyawan_approval": namaKaryawanApproval,
    "nama_jabatan_approval": namaJabatanApproval,
    "nama_karyawan_pengaju": namaKaryawanPengaju,
    "nama_jabatan_pengaju": namaJabatanPengaju,
  };
}
