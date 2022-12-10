// To parse this JSON data, do
//
//     final historyRegpnw = historyRegpnwFromJson(jsonString);

import 'dart:convert';

class HistoryRegpnw {
    HistoryRegpnw({
        this.status,
        this.message,
        this.xqry,
        this.identity,
        required this.data,
        this.dataCount,
        this.totalPage,
    });

    final bool? status;
    final String? message;
    final Xqry? xqry;
    final Identity? identity;
    final List<Datum> data;
    final int? dataCount;
    final int? totalPage;

    factory HistoryRegpnw.fromRawJson(String str) => HistoryRegpnw.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory HistoryRegpnw.fromJson(Map<String, dynamic> json) => HistoryRegpnw(
        status: json["status"],
        message: json["message"] == null ? "-" : json["message"].toString(),
        xqry: Xqry.fromJson(json["xqry"]),
        identity: Identity.fromJson(json["identity"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        dataCount: json["data_count"] == null ? 0 : json["data_count"].toInt(),
        totalPage: json["total_page"] == null ? 0 : json["total_page"].toInt(),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message == null ? "-" : message.toString(),
        "xqry": xqry == null ? null : xqry!.toJson(),
        "identity": identity == null ? null : identity!.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "data_count": dataCount == null ? "-" : dataCount!.toInt(),
        "total_page": totalPage == null ? "-" : totalPage!.toInt(),
    };
}

class Datum {
    Datum({
        this.idRab,
        this.tglRab,
        this.noRab,
        this.profit,
        this.prelim,
        this.idRae,
        this.noRae,
        this.tglRae,
        this.idPeluang,
        this.noPeluang,
        this.tglPeluang,
        this.idCustomer,
        this.idPeringkatPeluang,
        this.keteranganPengiriman,
        this.lokasiPengiriman,
        this.tglSelesai,
        this.att,
        this.instalasi,
        this.lainLain,
        this.isHidden,
        this.namaCustomer,
        this.idPenawaran,
        this.tglPenawaran,
        this.noPenawaran,
        this.ppn,
        this.teksPembuka,
        this.teksPenutup,
        this.baseline,
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

    final String? idRab;
    final DateTime? tglRab;
    final String? noRab;
    final String? profit;
    final String? prelim;
    final String? idRae;
    final String? noRae;
    final DateTime? tglRae;
    final String? idPeluang;
    final String? noPeluang;
    final DateTime? tglPeluang;
    final String? idCustomer;
    final String? idPeringkatPeluang;
    final String? keteranganPengiriman;
    final String? lokasiPengiriman;
    final DateTime? tglSelesai;
    final String? att;
    final bool? instalasi;
    final String? lainLain;
    final bool? isHidden;
    final String? namaCustomer;
    final String? idPenawaran;
    final DateTime? tglPenawaran;
    final String? noPenawaran;
    final String? ppn;
    final String? teksPembuka;
    final String? teksPenutup;
    final String? baseline;
    final String? idApprovalTransaksi;
    final String? noTransaksi;
    final String? kodeTransaksi;
    final String? idKaryawanApproval;
    final String? idJabatanApproval;
    final String? statusApproval;
    final String? catatanApproval;
    final DateTime? approvalCreatedAt;
    final DateTime? tglApproval;
    final String? approvalLevel;
    final String? namaKaryawanApproval;
    final String? namaJabatanApproval;
    final String? namaKaryawanPengaju;
    final String? namaJabatanPengaju;

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idRab: json["id_rab"] == null ? "-" : json["id_rab"].toString(),
        tglRab: json["tgl_rab"] == null ? null : DateTime.parse(json["tgl_rab"]),
        noRab: json["no_rab"] == null ? "-" : json["no_rab"].toString(),
        profit: json["profit"] == null ? "-" : json["profit"].toString(),
        prelim: json["prelim"] == null ? "-" : json["prelim"].toString(),
        idRae: json["id_rae"] == null ? "-" : json["id_rae"].toString(),
        noRae: json["no_rae"] == null ? "-" : json["no_rae"].toString(),
        tglRae: json["tgl_rae"] == null ? null : DateTime.parse(json["tgl_rae"]),
        idPeluang: json["id_peluang"] == null ? "-" : json["id_peluang"].toString(),
        noPeluang: json["no_peluang"] == null ? "-" : json["no_peluang"].toString(),
        tglPeluang: json["tgl_peluang"] == null ? null : DateTime.parse(json["tgl_peluang"]),
        idCustomer: json["id_customer"] == null ? "-" : json["id_customer"].toString(),
        idPeringkatPeluang: json["id_peringkat_peluang"] == null ? "-" : json["id_peringkat_peluang"].toString(),
        keteranganPengiriman: json["keterangan_pengiriman"] == null ? "-" : json["keterangan_pengiriman"].toString(),
        lokasiPengiriman: json["lokasi_pengiriman"] == null ? "-" : json["lokasi_pengiriman"].toString(),
        tglSelesai: json["tgl_selesai"] == null ? null : DateTime.parse(json["tgl_selesai"]),
        att: json["att"] == null ? "-" : json["att"].toString(),
        instalasi: json["instalasi"],
        lainLain: json["lain_lain"] == null ? "-" : json["lain_lain"].toString(),
        isHidden: json["is_hidden"],
        namaCustomer: json["nama_customer"] == null ? "-" : json["nama_customer"].toString(),
        idPenawaran: json["id_penawaran"] == null ? "-" : json["id_penawaran"].toString(),
        tglPenawaran: json["tgl_penawaran"] == null ? null : DateTime.parse(json["tgl_penawaran"]),
        noPenawaran: json["no_penawaran"] == null ? "-" : json["no_penawaran"].toString(),
        ppn: json["ppn"] == null ? "-" : json["ppn"].toString(),
        teksPembuka: json["teks_pembuka"] == null ? "-" : json["teks_pembuka"].toString(),
        teksPenutup: json["teks_penutup"] == null ? "-" : json["teks_penutup"].toString(),
        baseline: json["baseline"] == null ? "-" : json["baseline"].toString(),
        idApprovalTransaksi: json["id_approval_transaksi"] == null ? "-" : json["id_approval_transaksi"].toString(),
        noTransaksi: json["no_transaksi"] == null ? "-" : json["no_transaksi"].toString(),
        kodeTransaksi: json["kode_transaksi"] == null ? "-" : json["kode_transaksi"].toString(),
        idKaryawanApproval: json["id_karyawan_approval"] == null ? "-" : json["id_karyawan_approval"].toString(),
        idJabatanApproval: json["id_jabatan_approval"] == null ? "-" : json["id_jabatan_approval"].toString(),
        statusApproval: json["status_approval"] == null ? "-" : json["status_approval"].toString(),
        catatanApproval: json["catatan_approval"] == null ? "-" : json["catatan_approval"].toString(),
        approvalCreatedAt: json["approval_created_at"] == null ? null : DateTime.parse(json["approval_created_at"]),
        tglApproval: json["tgl_approval"] == null ? null : DateTime.parse(json["tgl_approval"]),
        approvalLevel: json["approval_level"] == null ? "-" : json["approval_level"].toString(),
        namaKaryawanApproval: json["nama_karyawan_approval"] == null ? "-" : json["nama_karyawan_approval"].toString(),
        namaJabatanApproval: json["nama_jabatan_approval"] == null ? "-" : json["nama_jabatan_approval"].toString(),
        namaKaryawanPengaju: json["nama_karyawan_pengaju"] == null ? "-" : json["nama_karyawan_pengaju"].toString(),
        namaJabatanPengaju: json["nama_jabatan_pengaju"] == null ? "-" : json["nama_jabatan_pengaju"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_rab": idRab == null ? "-" : idRab.toString(),
        "tgl_rab": tglRab == null ? null : "${tglRab?.year.toString().padLeft(4, '0')}-${tglRab?.month.toString().padLeft(2, '0')}-${tglRab?.day.toString().padLeft(2, '0')}",
        "no_rab": noRab == null ? "-" : noRab.toString(),
        "profit": profit == null ? "-" : profit.toString(),
        "prelim": prelim == null ? "-" : prelim.toString(),
        "id_rae": idRae == null ? "-" : idRae.toString(),
        "no_rae": noRae == null ? "-" : noRae.toString(),
        "tgl_rae": tglRae == null ? null : "${tglRae?.year.toString().padLeft(4, '0')}-${tglRae?.month.toString().padLeft(2, '0')}-${tglRae?.day.toString().padLeft(2, '0')}",
        "id_peluang": idPeluang == null ? "-" : idPeluang.toString() ,
        "no_peluang": noPeluang == null ? "-" : noPeluang.toString() ,
        "tgl_peluang": tglPeluang == null ? null : "${tglPeluang?.year.toString().padLeft(4, '0')}-${tglPeluang?.month.toString().padLeft(2, '0')}-${tglPeluang?.day.toString().padLeft(2, '0')}",
        "id_customer": idCustomer == null ? "-" : idCustomer.toString(),
        "id_peringkat_peluang": idPeringkatPeluang == null ? "-" : idPeringkatPeluang.toString(),
        "keterangan_pengiriman": keteranganPengiriman == null ? "-" : keteranganPengiriman.toString(),
        "lokasi_pengiriman": lokasiPengiriman == null ? "-" : lokasiPengiriman.toString(),
        "tgl_selesai": tglSelesai == null ? null : "${tglSelesai?.year.toString().padLeft(4, '0')}-${tglSelesai?.month.toString().padLeft(2, '0')}-${tglSelesai?.day.toString().padLeft(2, '0')}",
        "att": att == null ? "-" : att.toString(),
        "instalasi": instalasi,
        "lain_lain": lainLain == null ? "-" : lainLain.toString(),
        "is_hidden": isHidden,
        "nama_customer": namaCustomer == null ? "-" : namaCustomer.toString(),
        "id_penawaran": idPenawaran == null ? "-" : idPenawaran.toString(),
        "tgl_penawaran": tglPenawaran == null ? null : "${tglPenawaran?.year.toString().padLeft(4, '0')}-${tglPenawaran?.month.toString().padLeft(2, '0')}-${tglPenawaran?.day.toString().padLeft(2, '0')}",
        "no_penawaran": noPenawaran == null ? "-" : noPenawaran.toString(),
        "ppn": ppn == null ? "-" : ppn.toString(),
        "teks_pembuka": teksPembuka == null ? "-" : teksPembuka.toString(),
        "teks_penutup": teksPenutup == null ? "-" : teksPenutup.toString(),
        "baseline": baseline == null ? "-" : baseline.toString(),
        "id_approval_transaksi": idApprovalTransaksi == null ? "-" : idApprovalTransaksi.toString(),
        "no_transaksi": noTransaksi == null ? "-" : noTransaksi.toString(),
        "kode_transaksi": kodeTransaksi == null ? "-" : kodeTransaksi.toString(),
        "id_karyawan_approval": idKaryawanApproval == null ? "-" : idKaryawanApproval.toString(),
        "id_jabatan_approval": idJabatanApproval == null ? "-" : idJabatanApproval.toString(),
        "status_approval": statusApproval == null ? "-" : statusApproval.toString(),
        "catatan_approval": catatanApproval == null ? "-" : catatanApproval.toString(),
        "approval_created_at": approvalCreatedAt == null ? null : approvalCreatedAt!.toIso8601String(),
        "tgl_approval": tglApproval == null ? null : "${tglApproval?.year.toString().padLeft(4, '0')}-${tglApproval?.month.toString().padLeft(2, '0')}-${tglApproval?.day.toString().padLeft(2, '0')}",
        "approval_level": approvalLevel == null ? "-" : approvalLevel.toString(),
        "nama_karyawan_approval": namaKaryawanApproval == null ? "-" : namaKaryawanApproval.toString(),
        "nama_jabatan_approval": namaJabatanApproval == null ? "-" : namaJabatanApproval.toString(),
        "nama_karyawan_pengaju": namaKaryawanPengaju == null ? "-" : namaKaryawanPengaju.toString(),
        "nama_jabatan_pengaju": namaJabatanPengaju == null ? "-" : namaJabatanPengaju.toString(),
    };
}

class Identity {
    Identity({
        this.idJabatan,
        this.idUnitOrganisasi,
        this.idKaryawan,
        this.kodeProses,
        this.behavior,
        this.approvalLevel,
    });

    final String? idJabatan;
    final String? idUnitOrganisasi;
    final String? idKaryawan;
    final String? kodeProses;
    final String? behavior;
    final String? approvalLevel;

    factory Identity.fromRawJson(String str) => Identity.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Identity.fromJson(Map<String, dynamic> json) => Identity(
        idJabatan: json["id_jabatan"] == null ? "-" : json["id_jabatan"].toString(),
        idUnitOrganisasi: json["id_unit_organisasi"] == null ? "-" : json["id_unit_organisasi"].toString(),
        idKaryawan: json["id_karyawan"] == null ? "-" : json["id_karyawan"].toString(),
        kodeProses: json["kode_proses"] == null ? "-" : json["kode_proses"].toString(),
        behavior: json["behavior"] == null ? "-" : json["behavior"].toString(),
        approvalLevel: json["approval_level"] == null ? "-" : json["approval_level"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_jabatan": idJabatan == null ? "-" : idJabatan.toString(),
        "id_unit_organisasi": idUnitOrganisasi == null ? "-" : idUnitOrganisasi.toString(),
        "id_karyawan": idKaryawan == null ? "-" : idKaryawan.toString(),
        "kode_proses": kodeProses == null ? "-" : kodeProses.toString(),
        "behavior": behavior == null ? "-" : behavior.toString(),
        "approval_level": approvalLevel == null ? "-" : approvalLevel.toString(),
    };
}

class Xqry {
    Xqry({
        this.page,
        this.perPage,
        this.idJabatanApproval,
    });

    final String? page;
    final String? perPage;
    final String? idJabatanApproval;

    factory Xqry.fromRawJson(String str) => Xqry.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Xqry.fromJson(Map<String, dynamic> json) => Xqry(
        page: json["page"] == null ? "-" : json["page"].toString(),
        perPage: json["per_page"] == null ? "-" : json["per_page"].toString(),
        idJabatanApproval: json["id_jabatan_approval"] == null ? "-" : json["id_jabatan_approval"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "page": page == null ? "-" : page.toString(),
        "per_page": perPage == null ? "-" : perPage.toString(),
        "id_jabatan_approval": idJabatanApproval == null ? "-" : idJabatanApproval.toString(),
    };
}