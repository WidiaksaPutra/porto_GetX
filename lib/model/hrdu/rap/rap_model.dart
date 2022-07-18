import 'dart:convert';

class Regrap {
  Regrap({
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

  factory Regrap.fromRawJson(String str) => Regrap.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Regrap.fromJson(Map<String, dynamic> json) => Regrap(
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
    this.idRap,
    this.tglRap,
    this.noRap,
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
    this.idApprovalTransaksi,
    this.noTransaksi,
    this.kodeTransaksi,
    this.idKaryawan,
    this.idJabatan,
    this.statusApproval,
    this.catatan,
    this.createdAt,
    this.tglApproval,
    this.approvalLevel,
    this.namaKaryawan,
    this.namaJabatan,
    this.idKaryawanPengaju,
    this.idJabatanPengaju,
    this.namaKaryawanPengaju,
    this.namaJabatanPengaju,
    this.idSpk,
    this.barangJadi,
  });

  final String? idRap;
  final DateTime? tglRap;
  final String? noRap;
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
  final String? idApprovalTransaksi;
  final String? noTransaksi;
  final String? kodeTransaksi;
  final String? idKaryawan;
  final String? idJabatan;
  final String? statusApproval;
  final String? catatan;
  final String? createdAt;
  final DateTime? tglApproval;
  final String? approvalLevel;
  final String? namaKaryawan;
  final String? namaJabatan;
  final String? idKaryawanPengaju;
  final String? idJabatanPengaju;
  final String? namaKaryawanPengaju;
  final String? namaJabatanPengaju;
  final String? idSpk;
  final List<BarangJadi?>? barangJadi;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idRap: json["id_rap"],
    tglRap: json["tgl_rap"] == null ? null : DateTime.parse(json["tgl_rap"]),
    noRap: json["no_rap"],
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
    idApprovalTransaksi: json["id_approval_transaksi"],
    noTransaksi: json["no_transaksi"],
    kodeTransaksi: json["kode_transaksi"],
    idKaryawan: json["id_karyawan"],
    idJabatan: json["id_jabatan"],
    statusApproval: json["status_approval"],
    catatan: json["catatan"],
    createdAt: json["created_at"],
    tglApproval: json["tgl_approval"] == null ? null : DateTime.parse(json["tgl_approval"]),
    approvalLevel: json["approval_level"],
    namaKaryawan: json["nama_karyawan"],
    namaJabatan: json["nama_jabatan"],
    idKaryawanPengaju: json["id_karyawan_pengaju"],
    idJabatanPengaju: json["id_jabatan_pengaju"],
    namaKaryawanPengaju: json["nama_karyawan_pengaju"],
    namaJabatanPengaju: json["nama_jabatan_pengaju"],
    idSpk: json["id_spk"],
    barangJadi: json["barang_jadi"] == null ? null : List<BarangJadi>.from(json["barang_jadi"].map((x) => BarangJadi.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id_rap": idRap,
    "tgl_rap": "${tglRap!.year.toString().padLeft(4, '0')}-${tglRap!.month.toString().padLeft(2, '0')}-${tglRap!.day.toString().padLeft(2, '0')}",
    "no_rap": noRap,
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
    "baseline": baseline,
    "id_approval_transaksi": idApprovalTransaksi,
    "no_transaksi": noTransaksi,
    "kode_transaksi": kodeTransaksi,
    "id_karyawan": idKaryawan,
    "id_jabatan": idJabatan,
    "status_approval": statusApproval,
    "catatan": catatan,
    "created_at": createdAt,
    "tgl_approval": "${tglApproval!.year.toString().padLeft(4, '0')}-${tglApproval!.month.toString().padLeft(2, '0')}-${tglApproval!.day.toString().padLeft(2, '0')}",
    "approval_level": approvalLevel,
    "nama_karyawan": namaKaryawan,
    "nama_jabatan": namaJabatan,
    "id_karyawan_pengaju": idKaryawanPengaju,
    "id_jabatan_pengaju": idJabatanPengaju,
    "nama_karyawan_pengaju": namaKaryawanPengaju,
    "nama_jabatan_pengaju": namaJabatanPengaju,
    "id_spk": idSpk,
    "barang_jadi": List<dynamic>.from(barangJadi!.map((x) => x!.toJson())),
  };
}

class BarangJadi {
  BarangJadi({
    this.idRapDetail,
    this.idRap,
    this.idBarangJadi,
    this.qtyRap,
    this.hargaSatuanRap,
    this.refUid,
    this.kodeItem,
    this.namaItem,
    this.namaSatuan,
  });

  final String? idRapDetail;
  final String? idRap;
  final String? idBarangJadi;
  final String? qtyRap;
  final String? hargaSatuanRap;
  final String? refUid;
  final String? kodeItem;
  final String? namaItem;
  final String? namaSatuan;

  factory BarangJadi.fromRawJson(String str) => BarangJadi.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BarangJadi.fromJson(Map<String, dynamic> json) => BarangJadi(
    idRapDetail: json["id_rap_detail"],
    idRap: json["id_rap"],
    idBarangJadi: json["id_barang_jadi"],
    qtyRap: json["qty_rap"],
    hargaSatuanRap: json["harga_satuan_rap"],
    refUid: json["ref_uid"],
    kodeItem: json["kode_item"],
    namaItem: json["nama_item"],
    namaSatuan: json["nama_satuan"],
  );

  Map<String, dynamic> toJson() => {
    "id_rap_detail": idRapDetail,
    "id_rap": idRap,
    "id_barang_jadi": idBarangJadi,
    "qty_rap": qtyRap,
    "harga_satuan_rap": hargaSatuanRap,
    "ref_uid": refUid,
    "kode_item": kodeItem,
    "nama_item": namaItem,
    "nama_satuan": namaSatuan,
  };
}
