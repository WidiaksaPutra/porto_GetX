import 'dart:convert';

class DetailRegrap {
  DetailRegrap({
    this.status,
    this.message,
    this.data,
  });

  final bool? status;
  final String? message;
  final Data? data;

  factory DetailRegrap.fromRawJson(String str) => DetailRegrap.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DetailRegrap.fromJson(Map<String, dynamic> json) => DetailRegrap(
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
    this.detail,
    this.behavior,
    this.approval,
  });

  final Detail? detail;
  final String? behavior;
  final List<Approval?>? approval;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    detail: Detail.fromJson(json["detail"]),
    behavior: json["behavior"],
    approval: List<Approval>.from(json["approval"].map((x) => Approval.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "detail": detail!.toJson(),
    "behavior": behavior,
    "approval": List<dynamic>.from(approval!.map((x) => x!.toJson())),
  };
}

class Approval {
  Approval({
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
    this.approvalBaseline,
  });

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
  final String? approvalBaseline;

  factory Approval.fromRawJson(String str) => Approval.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Approval.fromJson(Map<String, dynamic> json) => Approval(
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
    approvalBaseline: json["approval_baseline"],
  );

  Map<String, dynamic> toJson() => {
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
    "approval_baseline": approvalBaseline,
  };
}

class Detail {
  Detail({
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
    this.idSpk,
    this.tglSpk,
    this.noSpk,
    this.detailBarangJadi,
    this.detailSpk,
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
  final String? idSpk;
  final DateTime? tglSpk;
  final String? noSpk;
  final List<DetailBarangJadi?>? detailBarangJadi;
  final List<DetailSpk?>? detailSpk;

  factory Detail.fromRawJson(String str) => Detail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
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
    idSpk: json["id_spk"],
    tglSpk: json["tgl_spk"] == null ? null : DateTime.parse(json["tgl_spk"]),
    noSpk: json["no_spk"],
    detailBarangJadi: List<DetailBarangJadi>.from(json["detail_barang_jadi"].map((x) => DetailBarangJadi.fromJson(x))),
    detailSpk: List<DetailSpk>.from(json["detail_spk"].map((x) => DetailSpk.fromJson(x))),
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
    "id_spk": idSpk,
    "tgl_spk": "${tglSpk!.year.toString().padLeft(4, '0')}-${tglSpk!.month.toString().padLeft(2, '0')}-${tglSpk!.day.toString().padLeft(2, '0')}",
    "no_spk": noSpk,
    "detail_barang_jadi": List<dynamic>.from(detailBarangJadi!.map((x) => x!.toJson())),
    "detail_spk": List<dynamic>.from(detailSpk!.map((x) => x!.toJson())),
  };
}

class DetailBarangJadi {
  DetailBarangJadi({
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

  factory DetailBarangJadi.fromRawJson(String str) => DetailBarangJadi.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DetailBarangJadi.fromJson(Map<String, dynamic> json) => DetailBarangJadi(
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

class DetailSpk {
  DetailSpk({
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

  factory DetailSpk.fromRawJson(String str) => DetailSpk.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DetailSpk.fromJson(Map<String, dynamic> json) => DetailSpk(
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
