import 'dart:convert';

class DetailPenpo {
  DetailPenpo({
    this.status,
    this.message,
    this.data,
  });

  final bool? status;
  final String? message;
  final Data? data;

  factory DetailPenpo.fromRawJson(String str) => DetailPenpo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DetailPenpo.fromJson(Map<String, dynamic> json) => DetailPenpo(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? null : data!.toJson(),
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
    detail: json["detail"] == null ? null : Detail.fromJson(json["detail"]),
    behavior: json["behavior"],
    approval: json["approval"] == null ? null : List<Approval>.from(json["approval"].map((x) => Approval.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "detail": detail == null ? null : detail!.toJson(),
    "behavior": behavior,
    "approval": approval == null ? null : List<dynamic>.from(approval!.map((x) => x!.toJson())),
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
    "tgl_approval": tglApproval == null ? null : "${tglApproval!.year.toString().padLeft(4, '0')}-${tglApproval!.month.toString().padLeft(2, '0')}-${tglApproval!.day.toString().padLeft(2, '0')}",
    "approval_level": approvalLevel,
    "nama_karyawan": namaKaryawan,
    "nama_jabatan": namaJabatan,
    "approval_baseline": approvalBaseline,
  };
}

class Detail {
  Detail({
    this.idPenerimaanBarang,
    this.tglPenerimaanBarang,
    this.noPenerimaanBarang,
    this.idPurchaseOrderDetail,
    this.tglPurchaseOrder,
    this.noPurchaseOrder,
    this.noSuratJalan,
    this.petugasPenerimaan,
    this.namaKaryawan,
    this.gudangPenerimaan,
    this.namaGudang,
    this.idItemBuaso,
    this.namaItem,
    this.dimensi,
    this.pj,
    this.lb,
    this.tb,
    this.idVendor,
    this.namaVendor,
    this.hargaKesepakatan,
    this.qtyOrder,
    this.idSatuanOrder,
    this.namaSatuanOrder,
    this.qtyBeli,
    this.idSatuanBeli,
    this.namaSatuanBeli,
    this.qtyPakai,
    this.idSatuanPakai,
    this.namaSatuanPakai,
    this.fotoSuratJalan,
  });

  final String? idPenerimaanBarang;
  final DateTime? tglPenerimaanBarang;
  final String? noPenerimaanBarang;
  final String? idPurchaseOrderDetail;
  final DateTime? tglPurchaseOrder;
  final String? noPurchaseOrder;
  final String? noSuratJalan;
  final String? petugasPenerimaan;
  final String? namaKaryawan;
  final String? gudangPenerimaan;
  final String? namaGudang;
  final String? idItemBuaso;
  final String? namaItem;
  final String? dimensi;
  final String? pj;
  final String? lb;
  final String? tb;
  final String? idVendor;
  final String? namaVendor;
  final String? hargaKesepakatan;
  final String? qtyOrder;
  final String? idSatuanOrder;
  final String? namaSatuanOrder;
  final String? qtyBeli;
  final String? idSatuanBeli;
  final String? namaSatuanBeli;
  final String? qtyPakai;
  final String? idSatuanPakai;
  final String? namaSatuanPakai;
  final String? fotoSuratJalan;

  factory Detail.fromRawJson(String str) => Detail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    idPenerimaanBarang: json["id_penerimaan_barang"],
    tglPenerimaanBarang: json["tgl_penerimaan_barang"] == null ? null : DateTime.parse(json["tgl_penerimaan_barang"]),
    noPenerimaanBarang: json["no_penerimaan_barang"],
    idPurchaseOrderDetail: json["id_purchase_order_detail"],
    tglPurchaseOrder: json["tgl_purchase_order"] == null ? null : DateTime.parse(json["tgl_purchase_order"]),
    noPurchaseOrder: json["no_purchase_order"],
    noSuratJalan: json["no_surat_jalan"],
    petugasPenerimaan: json["petugas_penerimaan"],
    namaKaryawan: json["nama_karyawan"],
    gudangPenerimaan: json["gudang_penerimaan"],
    namaGudang: json["nama_gudang"],
    idItemBuaso: json["id_item_buaso"],
    namaItem: json["nama_item"],
    dimensi: json["dimensi"],
    pj: json["pj"],
    lb: json["lb"],
    tb: json["tb"],
    idVendor: json["id_vendor"],
    namaVendor: json["nama_vendor"],
    hargaKesepakatan: json["harga_kesepakatan"],
    qtyOrder: json["qty_order"],
    idSatuanOrder: json["id_satuan_order"],
    namaSatuanOrder: json["nama_satuan_order"],
    qtyBeli: json["qty_beli"],
    idSatuanBeli: json["id_satuan_beli"],
    namaSatuanBeli: json["nama_satuan_beli"],
    qtyPakai: json["qty_pakai"],
    idSatuanPakai: json["id_satuan_pakai"],
    namaSatuanPakai: json["nama_satuan_pakai"],
    fotoSuratJalan: json["foto_surat_jalan"],
  );

  Map<String, dynamic> toJson() => {
    "id_penerimaan_barang": idPenerimaanBarang,
    "tgl_penerimaan_barang": tglPenerimaanBarang == null ? null : "${tglPenerimaanBarang!.year.toString().padLeft(4, '0')}-${tglPenerimaanBarang!.month.toString().padLeft(2, '0')}-${tglPenerimaanBarang!.day.toString().padLeft(2, '0')}",
    "no_penerimaan_barang": noPenerimaanBarang,
    "id_purchase_order_detail": idPurchaseOrderDetail,
    "tgl_purchase_order": tglPurchaseOrder == null ? null : "${tglPurchaseOrder!.year.toString().padLeft(4, '0')}-${tglPurchaseOrder!.month.toString().padLeft(2, '0')}-${tglPurchaseOrder!.day.toString().padLeft(2, '0')}",
    "no_purchase_order": noPurchaseOrder,
    "no_surat_jalan": noSuratJalan,
    "petugas_penerimaan": petugasPenerimaan,
    "nama_karyawan": namaKaryawan,
    "gudang_penerimaan": gudangPenerimaan,
    "nama_gudang": namaGudang,
    "id_item_buaso": idItemBuaso,
    "nama_item": namaItem,
    "dimensi": dimensi,
    "pj": pj,
    "lb": lb,
    "tb": tb,
    "id_vendor": idVendor,
    "nama_vendor": namaVendor,
    "harga_kesepakatan": hargaKesepakatan,
    "qty_order": qtyOrder,
    "id_satuan_order": idSatuanOrder,
    "nama_satuan_order": namaSatuanOrder,
    "qty_beli": qtyBeli,
    "id_satuan_beli": idSatuanBeli,
    "nama_satuan_beli": namaSatuanBeli,
    "qty_pakai": qtyPakai,
    "id_satuan_pakai": idSatuanPakai,
    "nama_satuan_pakai": namaSatuanPakai,
    "foto_surat_jalan": fotoSuratJalan,
  };
}