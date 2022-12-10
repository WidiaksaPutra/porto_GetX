// To parse this JSON data, do
//
//     final regrae = regraeFromJson(jsonString);

import 'dart:convert';

class Regrae {
    Regrae({
        this.status,
        this.message,
        this.xqry,
        required this.data,
        this.dataCount,
        this.totalPage,
    });

    final bool? status;
    final String? message;
    final Xqry? xqry;
    final List<Datum> data;
    final int? dataCount;
    final int? totalPage;

    factory Regrae.fromRawJson(String str) => Regrae.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Regrae.fromJson(Map<String, dynamic> json) => Regrae(
        status: json["status"],
        message: json["message"] == null ? "-" : json["message"].toString(),
        xqry: json["xqry"] == null ? null : Xqry.fromJson(json["xqry"]),
        data: json["data"] == null ? [] : 
              json["data"] == List.empty() ? [] :
              List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        dataCount: json["data_count"] == null ? 0 : json["data_count"].toInt(),
        totalPage: json["total_page"] == null ? 0 : json["total_page"].toInt(),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message == null ? "-" : message.toString(),
        "xqry": xqry == null ? null : xqry!.toJson(),
        "data": data == null ? [] :
              data == List.empty() ? [] : 
              List<dynamic>.from(data.map((x) => x.toJson())),
        "data_count": dataCount == null ? 0 : dataCount!.toInt(),
        "total_page": totalPage == null ? 0 : totalPage!.toInt(),
    };
}

class Datum {
    Datum({
        this.idRae,
        this.tglRae,
        this.noRae,
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
        this.realisasiPenawaran,
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
        this.idProyek,
        this.namaProyek,
        this.scheduleKebutuhanProyek,
        this.kelompokProyek,
        this.targetPenawaran,
        this.isDraft,
        this.barangJadi,
    });

    final String? idRae;
    final DateTime? tglRae;
    final String? noRae;
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
    final DateTime? realisasiPenawaran;
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
    final DateTime? createdAt;
    final DateTime? tglApproval;
    final String? approvalLevel;
    final String? namaKaryawan;
    final String? namaJabatan;
    final String? idKaryawanPengaju;
    final String? idJabatanPengaju;
    final String? namaKaryawanPengaju;
    final String? namaJabatanPengaju;
    final String? idProyek;
    final String? namaProyek;
    final String? scheduleKebutuhanProyek;
    final String? kelompokProyek;
    final DateTime? targetPenawaran;
    final bool? isDraft;
    final List<BarangJadi>? barangJadi;

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idRae: json["id_rae"] == null ? "-" : json["id_rae"].toString(),
        tglRae: json["tgl_rae"] == null ? null : DateTime.parse(json["tgl_rae"]),
        noRae: json["no_rae"] == null ? "-" : json["no_rae"].toString(),
        idPeluang: json["id_peluang"] == null ? "-" : json["id_peluang"].toString(),
        noPeluang: json["no_peluang"] == null ? "-" : json["no_peluang"].toString(),
        tglPeluang: json["tgl_peluang"] == null ? null : DateTime.parse(json["tgl_peluang"]),
        idCustomer: json["id_customer"] == null ? "-" : json["id_customer"].toString(),
        namaCustomer: json["nama_customer"] == null ? "-" : json["nama_customer"].toString(),
        idPeringkatPeluang: json["id_peringkat_peluang"] == null ? "-" : json["id_peringkat_peluang"].toString(),
        namaPeringkatPeluang: json["nama_peringkat_peluang"] == null ? "-" : json["nama_peringkat_peluang"].toString(),
        keteranganPengiriman: json["keterangan_pengiriman"] == null ? "-" : json["keterangan_pengiriman"].toString(),
        lokasiPengiriman: json["lokasi_pengiriman"] == null ? "-" : json["lokasi_pengiriman"].toString(),
        tglSelesai: json["tgl_selesai"] == null ? null : DateTime.parse(json["tgl_selesai"]),
        realisasiPenawaran: json["realisasi_penawaran"] == null ? null : DateTime.parse(json["realisasi_penawaran"]),
        att: json["att"] == null ? "-" : json["att"].toString(),
        instalasi: json["instalasi"],
        lainLain: json["lain_lain"] == null ? "-" : json["lain_lain"].toString(),
        isHidden: json["is_hidden"],
        baseline: json["baseline"] == null ? "-" : json["baseline"].toString(),
        idApprovalTransaksi: json["id_approval_transaksi"] == null ? "-" : json["id_approval_transaksi"].toString(),
        noTransaksi: json["no_transaksi"] == null ? "-" : json["no_transaksi"].toString(),
        kodeTransaksi: json["kode_transaksi"] == null ? "-" : json["kode_transaksi"].toString(),
        idKaryawan: json["id_karyawan"] == null ? "-" : json["id_karyawan"].toString(),
        idJabatan: json["id_jabatan"] == null ? "-" : json["id_jabatan"].toString(),
        statusApproval: json["status_approval"] == null ? "-" : json["status_approval"].toString(),
        catatan: json["catatan"] == null ? "-" : json["catatan"].toString(),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        tglApproval: json["tgl_approval"] == null ? null : DateTime.parse(json["tgl_approval"]),
        approvalLevel: json["approval_level"] == null ? "-" : json["approval_level"].toString(),
        namaKaryawan: json["nama_karyawan"] == null ? "-" : json["nama_karyawan"].toString(),
        namaJabatan: json["nama_jabatan"] == null ? "-" : json["nama_jabatan"].toString(),
        idKaryawanPengaju: json["id_karyawan_pengaju"] == null ? "-" : json["id_karyawan_pengaju"].toString(),
        idJabatanPengaju: json["id_jabatan_pengaju"] == null ? "-" : json["id_jabatan_pengaju"].toString(),
        namaKaryawanPengaju: json["nama_karyawan_pengaju"] == null ? "-" : json["nama_karyawan_pengaju"].toString(),
        namaJabatanPengaju: json["nama_jabatan_pengaju"] == null ? "-" : json["nama_jabatan_pengaju"].toString(),
        idProyek: json["id_proyek"] == null ? "-" : json["id_proyek"].toString(),
        namaProyek: json["nama_proyek"] == null ? "-" : json["nama_proyek"].toString(),
        scheduleKebutuhanProyek: json["schedule_kebutuhan_proyek"] == null ? "-" : json["schedule_kebutuhan_proyek"].toString(),
        kelompokProyek: json["kelompok_proyek"] == null ? "-" : json["kelompok_proyek"].toString(),
        targetPenawaran: json["target_penawaran"] == null ? null : DateTime.parse(json["target_penawaran"]),
        isDraft: json["is_draft"],
        barangJadi: json["barang_jadi"] == null ? [] :
                    json["barang_jadi"] == List.empty() ? [] :
                    List<BarangJadi>.from(json["barang_jadi"].map((x) => BarangJadi.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id_rae": idRae == null ? "-" : idRae.toString(),
        "tgl_rae": tglRae == null ? null : "${tglRae?.year.toString().padLeft(4, '0')}-${tglRae?.month.toString().padLeft(2, '0')}-${tglRae?.day.toString().padLeft(2, '0')}",
        "no_rae": noRae == null ? "-" : noRae.toString(),
        "id_peluang": idPeluang == null ? "-" : idPeluang.toString(),
        "no_peluang": noPeluang == null ? "-" : noPeluang.toString(),
        "tgl_peluang": tglPeluang == null ? null : "${tglPeluang?.year.toString().padLeft(4, '0')}-${tglPeluang?.month.toString().padLeft(2, '0')}-${tglPeluang?.day.toString().padLeft(2, '0')}",
        "id_customer": idCustomer == null ? "-" : idCustomer.toString(),
        "nama_customer": namaCustomer == null ? "-" : namaCustomer.toString(),
        "id_peringkat_peluang": idPeringkatPeluang == null ? "-" : idPeringkatPeluang.toString(),
        "nama_peringkat_peluang": namaPeringkatPeluang == null ? "-" : namaPeringkatPeluang.toString(),
        "keterangan_pengiriman": keteranganPengiriman == null ? "-" : keteranganPengiriman.toString(),
        "lokasi_pengiriman": lokasiPengiriman == null ? "-" : lokasiPengiriman.toString(),
        "tgl_selesai": tglSelesai == null ? null : "${tglSelesai?.year.toString().padLeft(4, '0')}-${tglSelesai?.month.toString().padLeft(2, '0')}-${tglSelesai?.day.toString().padLeft(2, '0')}",
        "realisasi_penawaran": realisasiPenawaran == null ? null : "${realisasiPenawaran?.year.toString().padLeft(4, '0')}-${realisasiPenawaran?.month.toString().padLeft(2, '0')}-${realisasiPenawaran?.day.toString().padLeft(2, '0')}",
        "att": att == null ? "-" : att.toString() ,
        "instalasi": instalasi == null ? "-" : instalasi.toString() ,
        "lain_lain": lainLain == null ? "-" : lainLain.toString() ,
        "is_hidden": isHidden == null ? "-" : isHidden.toString() ,
        "baseline": baseline == null ? "-" : baseline.toString() ,
        "id_approval_transaksi": idApprovalTransaksi == null ? "-" : idApprovalTransaksi.toString() ,
        "no_transaksi": noTransaksi == null ? "-" : noTransaksi.toString() ,
        "kode_transaksi": kodeTransaksi == null ? "-" : kodeTransaksi.toString() ,
        "id_karyawan": idKaryawan == null ? "-" : idKaryawan.toString() ,
        "id_jabatan": idJabatan == null ? "-" : idJabatan.toString() ,
        "status_approval": statusApproval == null ? "-" : statusApproval.toString() ,
        "catatan": catatan == null ? "-" : catatan.toString() ,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "tgl_approval": tglApproval == null ? null : "${tglApproval?.year.toString().padLeft(4, '0')}-${tglApproval?.month.toString().padLeft(2, '0')}-${tglApproval?.day.toString().padLeft(2, '0')}",
        "approval_level": approvalLevel == null ? "-" : approvalLevel.toString(),
        "nama_karyawan": namaKaryawan == null ? "-" : namaKaryawan.toString(),
        "nama_jabatan": namaJabatan == null ? "-" : namaJabatan.toString(),
        "id_karyawan_pengaju": idKaryawanPengaju == null ? "-" : idKaryawanPengaju.toString(),
        "id_jabatan_pengaju": idJabatanPengaju == null ? "-" : idJabatanPengaju.toString(),
        "nama_karyawan_pengaju": namaKaryawanPengaju == null ? "-" : namaKaryawanPengaju.toString(),
        "nama_jabatan_pengaju": namaJabatanPengaju == null ? "-" : namaJabatanPengaju.toString(),
        "id_proyek": idProyek == null ? "-" : idProyek.toString(),
        "nama_proyek": namaProyek == null ? "-" : namaProyek.toString(),
        "schedule_kebutuhan_proyek": scheduleKebutuhanProyek == null ? "-" : scheduleKebutuhanProyek.toString(),
        "kelompok_proyek": kelompokProyek == null ? "-" : kelompokProyek.toString(),
        "target_penawaran": targetPenawaran == null ? null : "${targetPenawaran?.year.toString().padLeft(4, '0')}-${targetPenawaran?.month.toString().padLeft(2, '0')}-${targetPenawaran?.day.toString().padLeft(2, '0')}",
        "is_draft": isDraft == null ? "-" : isDraft.toString(),
        "barang_jadi": barangJadi == null ? [] :
                      barangJadi == List.empty() ? [] : 
                      List<dynamic>.from(barangJadi!.map((x) => x.toJson())),
    };
}

class BarangJadi {
    BarangJadi({
        this.idRae,
        this.idRaeDetail,
        this.kodeItem,
        this.namaItem,
    });

    final String? idRae;
    final String? idRaeDetail;
    final String? kodeItem;
    final String? namaItem;

    factory BarangJadi.fromRawJson(String str) => BarangJadi.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BarangJadi.fromJson(Map<String, dynamic> json) => BarangJadi(
        idRae: json["id_rae"] == null ? "-" : json["id_rae"].toString(),
        idRaeDetail: json["id_rae_detail"] == null ? "-" : json["id_rae_detail"].toString(),
        kodeItem: json["kode_item"] == null ? "-" : json["kode_item"].toString(),
        namaItem: json["nama_item"] == null ? "-" : json["nama_item"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_rae": idRae == null ? "-" : idRae.toString(),
        "id_rae_detail": idRaeDetail == null ? "-" : idRaeDetail.toString(),
        "kode_item": kodeItem == null ? "-" : kodeItem.toString(),
        "nama_item": namaItem == null ? "-" : namaItem.toString(),
    };
}

class Xqry {
    Xqry({
        this.page,
        this.perPage,
        this.approvalLevel,
        this.statusApproval,
    });

    final String? page;
    final String? perPage;
    final int? approvalLevel;
    final List<String>? statusApproval;

    factory Xqry.fromRawJson(String str) => Xqry.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Xqry.fromJson(Map<String, dynamic> json) => Xqry(
        page: json["page"] == null ? "-" : json["page"].toString(),
        perPage: json["per_page"] == null ? "-" : json["per_page"].toString(),
        approvalLevel: json["approval_level"] == null ? 0 : json["approval_level"].toInt(),
        statusApproval: json["status_approval"] == null ? [] :
                        json["status_approval"] == List.empty() ? [] : 
                        List<String>.from(json["status_approval"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "page": page == null ? "-" : page.toString() ,
        "per_page": perPage == null ? "-" : perPage.toString() ,
        "approval_level": approvalLevel == null ? 0 : approvalLevel!.toInt(),
        "status_approval": statusApproval == null ? [] :
                        statusApproval == List.empty() ? [] : 
                        List<dynamic>.from(statusApproval!.map((x) => x)),
    };
}