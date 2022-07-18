import 'dart:convert';

class Regspk {
  Regspk({
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

  factory Regspk.fromRawJson(String str) => Regspk.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Regspk.fromJson(Map<String, dynamic> json) => Regspk(
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
    this.idSpk,
    this.noSpk,
    this.tglSpk,
    this.tglSelesaiSpk,
    this.idPenawaran,
    this.catatan,
    this.ppn,
    this.baseline,
    this.tglPenawaran,
    this.noPenawaran,
    this.namaCustomer,
    this.att,
    this.tglSelesai,
    this.idApprovalTransaksi,
    this.noTransaksi,
    this.kodeTransaksi,
    this.idKaryawanApproval,
    this.idJabatanApproval,
    this.statusApproval,
    this.catatanApproval,
    this.createdAt,
    this.tglApproval,
    this.approvalLevel,
    this.namaKaryawanApproval,
    this.namaJabatanApproval,
    this.idKaryawanPengaju,
    this.idJabatanPengaju,
    this.namaKaryawanPengaju,
    this.namaJabatanPengaju,
    this.idRae,
    this.idRab,
    this.idPeluang,
    this.noRab,
    this.barangJadi,
  });

  final String? idSpk;
  final String? noSpk;
  final DateTime? tglSpk;
  final DateTime? tglSelesaiSpk;
  final String? idPenawaran;
  final String? catatan;
  final String? ppn;
  final String? baseline;
  final DateTime? tglPenawaran;
  final String? noPenawaran;
  final String? namaCustomer;
  final String? att;
  final DateTime? tglSelesai;
  final String? idApprovalTransaksi;
  final String? noTransaksi;
  final String? kodeTransaksi;
  final String? idKaryawanApproval;
  final String? idJabatanApproval;
  final String? statusApproval;
  final String? catatanApproval;
  final String? createdAt;
  final DateTime? tglApproval;
  final String? approvalLevel;
  final String? namaKaryawanApproval;
  final String? namaJabatanApproval;
  final String? idKaryawanPengaju;
  final String? idJabatanPengaju;
  final String? namaKaryawanPengaju;
  final String? namaJabatanPengaju;
  final String? idRae;
  final String? idRab;
  final String? idPeluang;
  final String? noRab;
  final List<BarangJadi?>? barangJadi;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idSpk: json["id_spk"],
    noSpk: json["no_spk"],
    tglSpk: json["tgl_spk"] == null ? null : DateTime.parse(json["tgl_spk"]),
    tglSelesaiSpk: json["tgl_selesai_spk"] == null ? null : DateTime.parse(json["tgl_selesai_spk"]),
    idPenawaran: json["id_penawaran"],
    catatan: json["catatan"],
    ppn: json["ppn"],
    baseline: json["baseline"],
    tglPenawaran: json["tgl_penawaran"] == null ? null : DateTime.parse(json["tgl_penawaran"]),
    noPenawaran: json["no_penawaran"],
    namaCustomer: json["nama_customer"],
    att: json["att"],
    tglSelesai: json["tgl_selesai"] == null ? null : DateTime.parse(json["tgl_selesai"]),
    idApprovalTransaksi: json["id_approval_transaksi"],
    noTransaksi: json["no_transaksi"],
    kodeTransaksi: json["kode_transaksi"],
    idKaryawanApproval: json["id_karyawan_approval"],
    idJabatanApproval: json["id_jabatan_approval"],
    statusApproval: json["status_approval"],
    catatanApproval: json["catatan_approval"],
    createdAt: json["created_at"],
    tglApproval: json["tgl_approval"] == null ? null : DateTime.parse(json["tgl_approval"]),
    approvalLevel: json["approval_level"],
    namaKaryawanApproval: json["nama_karyawan_approval"],
    namaJabatanApproval: json["nama_jabatan_approval"],
    idKaryawanPengaju: json["id_karyawan_pengaju"],
    idJabatanPengaju: json["id_jabatan_pengaju"],
    namaKaryawanPengaju: json["nama_karyawan_pengaju"],
    namaJabatanPengaju: json["nama_jabatan_pengaju"],
    idRae: json["id_rae"],
    idRab: json["id_rab"],
    idPeluang: json["id_peluang"],
    noRab: json["no_rab"],
    barangJadi: json["barang_jadi"] == null ? null : List<BarangJadi>.from(json["barang_jadi"].map((x) => BarangJadi.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id_spk": idSpk,
    "no_spk": noSpk,
    "tgl_spk": "${tglSpk!.year.toString().padLeft(4, '0')}-${tglSpk!.month.toString().padLeft(2, '0')}-${tglSpk!.day.toString().padLeft(2, '0')}",
    "tgl_selesai_spk": "${tglSelesaiSpk!.year.toString().padLeft(4, '0')}-${tglSelesaiSpk!.month.toString().padLeft(2, '0')}-${tglSelesaiSpk!.day.toString().padLeft(2, '0')}",
    "id_penawaran": idPenawaran,
    "catatan": catatan,
    "ppn": ppn,
    "baseline": baseline,
    "tgl_penawaran": "${tglPenawaran!.year.toString().padLeft(4, '0')}-${tglPenawaran!.month.toString().padLeft(2, '0')}-${tglPenawaran!.day.toString().padLeft(2, '0')}",
    "no_penawaran": noPenawaran,
    "nama_customer": namaCustomer,
    "att": att,
    "tgl_selesai": "${tglSelesai!.year.toString().padLeft(4, '0')}-${tglSelesai!.month.toString().padLeft(2, '0')}-${tglSelesai!.day.toString().padLeft(2, '0')}",
    "id_approval_transaksi": idApprovalTransaksi,
    "no_transaksi": noTransaksi,
    "kode_transaksi": kodeTransaksi,
    "id_karyawan_approval": idKaryawanApproval,
    "id_jabatan_approval": idJabatanApproval,
    "status_approval": statusApproval,
    "catatan_approval": catatanApproval,
    "created_at": createdAt,
    "tgl_approval": "${tglApproval!.year.toString().padLeft(4, '0')}-${tglApproval!.month.toString().padLeft(2, '0')}-${tglApproval!.day.toString().padLeft(2, '0')}",
    "approval_level": approvalLevel,
    "nama_karyawan_approval": namaKaryawanApproval,
    "nama_jabatan_approval": namaJabatanApproval,
    "id_karyawan_pengaju": idKaryawanPengaju,
    "id_jabatan_pengaju": idJabatanPengaju,
    "nama_karyawan_pengaju": namaKaryawanPengaju,
    "nama_jabatan_pengaju": namaJabatanPengaju,
    "id_rae": idRae,
    "id_rab": idRab,
    "id_peluang": idPeluang,
    "no_rab": noRab,
    "barang_jadi": List<dynamic>.from(barangJadi!.map((x) => x!.toJson())),
  };
}

class BarangJadi {
  BarangJadi({
    this.idSpkDetail,
    this.idSpk,
    this.idBarangJadi,
    this.uraian,
    this.qtySpk,
    this.hargaRate,
    this.idItemBuaso,
    this.kodeItem,
    this.namaItem,
    this.idJenis,
    this.idSatuanJual,
    this.namaSatuan,
    this.namaJenis,
    this.kodeSatuan,
    this.linkReferensi,
    this.uraianBarangJadi,
  });

  final String? idSpkDetail;
  final String? idSpk;
  final String? idBarangJadi;
  final String? uraian;
  final String? qtySpk;
  final String? hargaRate;
  final String? idItemBuaso;
  final String? kodeItem;
  final String? namaItem;
  final String? idJenis;
  final String? idSatuanJual;
  final String? namaSatuan;
  final String? namaJenis;
  final String? kodeSatuan;
  final String? linkReferensi;
  final String? uraianBarangJadi;

  factory BarangJadi.fromRawJson(String str) => BarangJadi.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BarangJadi.fromJson(Map<String, dynamic> json) => BarangJadi(
    idSpkDetail: json["id_spk_detail"],
    idSpk: json["id_spk"],
    idBarangJadi: json["id_barang_jadi"],
    uraian: json["uraian"],
    qtySpk: json["qty_spk"],
    hargaRate: json["harga_rate"],
    idItemBuaso: json["id_item_buaso"],
    kodeItem: json["kode_item"],
    namaItem: json["nama_item"],
    idJenis: json["id_jenis"],
    idSatuanJual: json["id_satuan_jual"],
    namaSatuan: json["nama_satuan"],
    namaJenis: json["nama_jenis"],
    kodeSatuan: json["kode_satuan"],
    linkReferensi: json["link_referensi"],
    uraianBarangJadi: json["uraian_barang_jadi"],
  );

  Map<String, dynamic> toJson() => {
    "id_spk_detail": idSpkDetail,
    "id_spk": idSpk,
    "id_barang_jadi": idBarangJadi,
    "uraian": uraian,
    "qty_spk": qtySpk,
    "harga_rate": hargaRate,
    "id_item_buaso": idItemBuaso,
    "kode_item": kodeItem,
    "nama_item": namaItem,
    "id_jenis": idJenis,
    "id_satuan_jual": idSatuanJual,
    "nama_satuan": namaSatuan,
    "nama_jenis": namaJenis,
    "kode_satuan": kodeSatuan,
    "link_referensi": linkReferensi,
    "uraian_barang_jadi": uraianBarangJadi,
  };
}
