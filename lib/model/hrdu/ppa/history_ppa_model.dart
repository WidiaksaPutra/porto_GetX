import 'dart:convert';

class HistoryRegppa {
  HistoryRegppa({
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

  factory HistoryRegppa.fromRawJson(String str) => HistoryRegppa.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HistoryRegppa.fromJson(Map<String, dynamic> json) => HistoryRegppa(
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
    this.idPpa,
    this.tglPpa,
    this.noPpa,
    this.qty,
    this.satuan,
    this.hargaSatuan,
    this.idKegiatanSumberDaya,
    this.baseline,
    this.bukti,
    this.idApprovalTransaksi,
    this.noTransaksi,
    this.kodeTransaksi,
    this.idKaryawanApproval,
    this.idJabatanApproval,
    this.statusApproval,
    this.catatan,
    this.tglApproval,
    this.approvalLevel,
    this.namaKaryawanApproval,
    this.namaJabatanApproval,
    this.idKaryawanPengaju,
    this.idJabatanPengaju,
    this.namaKaryawanPengaju,
    this.namaJabatanPengaju,
    this.itemSumberDaya,
    this.namaKegiatan,
    this.namaProgram,
    this.statusPpa,
    this.namaUnitOrganisasi,
  });

  final String? idPpa;
  final DateTime? tglPpa;
  final String? noPpa;
  final String? qty;
  final String? satuan;
  final String? hargaSatuan;
  final String? idKegiatanSumberDaya;
  final String? baseline;
  final String? bukti;
  final String? idApprovalTransaksi;
  final String? noTransaksi;
  final String? kodeTransaksi;
  final String? idKaryawanApproval;
  final String? idJabatanApproval;
  final String? statusApproval;
  final String? catatan;
  final DateTime? tglApproval;
  final String? approvalLevel;
  final String? namaKaryawanApproval;
  final String? namaJabatanApproval;
  final String? idKaryawanPengaju;
  final String? idJabatanPengaju;
  final String? namaKaryawanPengaju;
  final String? namaJabatanPengaju;
  final String? itemSumberDaya;
  final String? namaKegiatan;
  final String? namaProgram;
  final String? statusPpa;
  final String? namaUnitOrganisasi;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idPpa: json["id_ppa"],
    tglPpa: json["tgl_ppa"] == null ? null : DateTime.parse(json["tgl_ppa"]),
    noPpa: json["no_ppa"],
    qty: json["qty"],
    satuan: json["satuan"],
    hargaSatuan: json["harga_satuan"],
    idKegiatanSumberDaya: json["id_kegiatan_sumber_daya"],
    baseline: json["baseline"],
    bukti: json["bukti"],
    idApprovalTransaksi: json["id_approval_transaksi"],
    noTransaksi: json["no_transaksi"],
    kodeTransaksi: json["kode_transaksi"],
    idKaryawanApproval: json["id_karyawan_approval"],
    idJabatanApproval: json["id_jabatan_approval"],
    statusApproval: json["status_approval"],
    catatan: json["catatan"],
    tglApproval: json["tgl_approval"] == null ? null : DateTime.parse(json["tgl_approval"]),
    approvalLevel: json["approval_level"],
    namaKaryawanApproval: json["nama_karyawan_approval"],
    namaJabatanApproval: json["nama_jabatan_approval"],
    idKaryawanPengaju: json["id_karyawan_pengaju"],
    idJabatanPengaju: json["id_jabatan_pengaju"],
    namaKaryawanPengaju: json["nama_karyawan_pengaju"],
    namaJabatanPengaju: json["nama_jabatan_pengaju"],
    itemSumberDaya: json["item_sumber_daya"],
    namaKegiatan: json["nama_kegiatan"],
    namaProgram: json["nama_program"],
    statusPpa: json["status_ppa"],
    namaUnitOrganisasi: json["nama_unit_organisasi"],
  );

  Map<String, dynamic> toJson() => {
    "id_ppa": idPpa,
    "tgl_ppa": tglPpa == null ? null : "${tglPpa?.year.toString().padLeft(4, '0')}-${tglPpa?.month.toString().padLeft(2, '0')}-${tglPpa?.day.toString().padLeft(2, '0')}",
    "no_ppa": noPpa,
    "qty": qty,
    "satuan": satuan,
    "harga_satuan": hargaSatuan,
    "id_kegiatan_sumber_daya": idKegiatanSumberDaya,
    "baseline": baseline,
    "bukti": bukti,
    "id_approval_transaksi": idApprovalTransaksi,
    "no_transaksi": noTransaksi,
    "kode_transaksi": kodeTransaksi,
    "id_karyawan_approval": idKaryawanApproval,
    "id_jabatan_approval": idJabatanApproval,
    "status_approval": statusApproval,
    "catatan": catatan,
    "tgl_approval": tglApproval == null ? null : "${tglApproval?.year.toString().padLeft(4, '0')}-${tglApproval?.month.toString().padLeft(2, '0')}-${tglApproval?.day.toString().padLeft(2, '0')}",
    "approval_level": approvalLevel,
    "nama_karyawan_approval": namaKaryawanApproval,
    "nama_jabatan_approval": namaJabatanApproval,
    "id_karyawan_pengaju": idKaryawanPengaju,
    "id_jabatan_pengaju": idJabatanPengaju,
    "nama_karyawan_pengaju": namaKaryawanPengaju,
    "nama_jabatan_pengaju": namaJabatanPengaju,
    "item_sumber_daya": itemSumberDaya,
    "nama_kegiatan": namaKegiatan,
    "nama_program": namaProgram,
    "status_ppa": statusPpa,
    "nama_unit_organisasi": namaUnitOrganisasi,
  };
}
