// To parse this JSON data, do
//
//     final historyRegsospk = historyRegsospkFromJson(jsonString);

import 'dart:convert';

class HistoryRegsospk {
    HistoryRegsospk({
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

    factory HistoryRegsospk.fromRawJson(String str) => HistoryRegsospk.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory HistoryRegsospk.fromJson(Map<String, dynamic> json) => HistoryRegsospk(
        status: json["status"],
        message: json["message"] == null ? "-" : json["message"].toString(),
        xqry: Xqry.fromJson(json["xqry"]),
        identity: Identity.fromJson(json["identity"]),
        data: json["data"] == List.empty() ? [] : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        dataCount: json["data_count"] == null ? "-" : json["data_count"].toInt(),
        totalPage: json["total_page"] == null ? "-" : json["total_page"].toInt(),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message == null ? "-" : message.toString(),
        "xqry": xqry!.toJson(),
        "identity": identity == null ? null : identity!.toJson(),
        "data": data == List.empty() ? [] : List<dynamic>.from(data.map((x) => x.toJson())),
        "data_count": dataCount == null ? 0 : dataCount!.toInt(),
        "total_page": totalPage == null ? 0 : totalPage!.toInt(),
    };
}

class Datum {
    Datum({
        this.idSalesOrderSpk,
        this.tglSalesOrderSpk,
        this.noSalesOrderSpk,
        this.tglBatasWaktu,
        this.diskon,
        this.ppn,
        this.idSales,
        this.namaSales,
        this.namaCustomer,
        this.baseline,
        this.idGudang,
        this.namaGudang,
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
        this.uangMuka,
    });

    final String? idSalesOrderSpk;
    final DateTime? tglSalesOrderSpk;
    final String? noSalesOrderSpk;
    final DateTime? tglBatasWaktu;
    final String? diskon;
    final String? ppn;
    final String? idSales;
    final String? namaSales;
    final String? namaCustomer;
    final String? baseline;
    final String? idGudang;
    final String? namaGudang;
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
    final String? uangMuka;

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idSalesOrderSpk: json["id_sales_order_spk"] == null ? "-" : json["id_sales_order_spk"].toString(),
        tglSalesOrderSpk: json["tgl_sales_order_spk"] == null ? null : DateTime.parse(json["tgl_sales_order_spk"]),
        noSalesOrderSpk: json["no_sales_order_spk"] == null ? "-" : json["no_sales_order_spk"].toString(),
        tglBatasWaktu: json["tgl_batas_waktu"] == null ? null : DateTime.parse(json["tgl_batas_waktu"]),
        diskon: json["diskon"] == null ? "-" : json["diskon"].toString(),
        ppn: json["ppn"] == null ? "-" : json["ppn"].toString(),
        idSales: json["id_sales"] == null ? "-" : json["id_sales"].toString(),
        namaSales: json["nama_sales"] == null ? "-" : json["nama_sales"].toString(),
        namaCustomer: json["nama_customer"] == null ? "-" : json["nama_customer"].toString(),
        baseline: json["baseline"] == null ? "-" : json["baseline"].toString(),
        idGudang: json["id_gudang"] == null ? "-" : json["id_gudang"].toString(),
        namaGudang: json["nama_gudang"] == null ? "-" : json["nama_gudang"].toString(),
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
        uangMuka: json["uang_muka"] == null ? "-" : json["uang_muka"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_sales_order_spk": idSalesOrderSpk == null ? "-" : idSalesOrderSpk.toString(),
        "tgl_sales_order_spk": tglSalesOrderSpk == null ? "-" : "${tglSalesOrderSpk?.year.toString().padLeft(4, '0')}-${tglSalesOrderSpk?.month.toString().padLeft(2, '0')}-${tglSalesOrderSpk?.day.toString().padLeft(2, '0')}",
        "no_sales_order_spk": noSalesOrderSpk == null ? "-" : noSalesOrderSpk.toString(),
        "tgl_batas_waktu": tglBatasWaktu == null ? "-" : "${tglBatasWaktu?.year.toString().padLeft(4, '0')}-${tglBatasWaktu?.month.toString().padLeft(2, '0')}-${tglBatasWaktu?.day.toString().padLeft(2, '0')}".toString(),
        "diskon": diskon == null ? "-" : diskon.toString(),
        "ppn": ppn == null ? "-" : ppn.toString(),
        "id_sales": idSales == null ? "-" : idSales.toString(),
        "nama_sales": namaSales == null ? "-" : namaSales.toString(),
        "nama_customer": namaCustomer == null ? "-" : namaCustomer.toString(),
        "baseline": baseline == null ? "-" : baseline.toString(),
        "id_gudang": idGudang == null ? "-" : idGudang.toString(),
        "nama_gudang": namaGudang == null ? "-" : namaGudang.toString(),
        "id_approval_transaksi": idApprovalTransaksi == null ? "-" : idApprovalTransaksi.toString(),
        "no_transaksi": noTransaksi == null ? "-" : noTransaksi.toString(),
        "kode_transaksi": kodeTransaksi == null ? "-" : kodeTransaksi.toString(),
        "id_karyawan_approval": idKaryawanApproval == null ? "-" : idKaryawanApproval.toString(),
        "id_jabatan_approval": idJabatanApproval == null ? "-" : idJabatanApproval.toString(),
        "status_approval": statusApproval == null ? "-" : statusApproval.toString(),
        "catatan_approval": catatanApproval == null ? "-" : catatanApproval.toString(),
        "approval_created_at": approvalCreatedAt == null ? "-" : approvalCreatedAt!.toIso8601String(),
        "tgl_approval": tglApproval == null ? "-" : "${tglApproval?.year.toString().padLeft(4, '0')}-${tglApproval?.month.toString().padLeft(2, '0')}-${tglApproval?.day.toString().padLeft(2, '0')}",
        "approval_level": approvalLevel == null ? "-" : approvalLevel.toString(),
        "nama_karyawan_approval": namaKaryawanApproval == null ? "-" : namaKaryawanApproval.toString(),
        "nama_jabatan_approval": namaJabatanApproval == null ? "-" : namaJabatanApproval.toString(),
        "nama_karyawan_pengaju": namaKaryawanPengaju == null ? "-" : namaKaryawanPengaju.toString(),
        "nama_jabatan_pengaju": namaJabatanPengaju == null ? "-" : namaJabatanPengaju.toString(),
        "uang_muka": uangMuka == null ? "-" : uangMuka.toString(),
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
