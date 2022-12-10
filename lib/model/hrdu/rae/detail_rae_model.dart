// To parse this JSON data, do
//
//     final detailRegrae = detailRegraeFromJson(jsonString);

import 'dart:convert';

class DetailRegrae {
    DetailRegrae({
        this.status,
        this.message,
        this.data,
    });

    final bool? status;
    final String? message;
    final Data? data;

    factory DetailRegrae.fromRawJson(String str) => DetailRegrae.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DetailRegrae.fromJson(Map<String, dynamic> json) => DetailRegrae(
        status: json["status"],
        message: json["message"] == null ? "-" : json["message"].toString(),
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message == null ? "-" : message.toString(),
        "data": data == null ? null : data!.toJson(),
    };
}

class Data {
    Data({
        this.detail,
        this.behavior,
        this.approval,
    });

    final DataDetail? detail;
    final String? behavior;
    final List<Approval>? approval;

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        detail: json["detail"] == null ? null : DataDetail.fromJson(json["detail"]),
        behavior: json["behavior"] == null ? "-" : json["behavior"].toString(),
        approval: json["approval"] == null ? [] :
                  json["approval"] == List.empty() ? [] : 
                  List<Approval>.from(json["approval"].map((x) => Approval.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "detail": detail == null ? null : detail!.toJson(),
        "behavior": behavior == null ? "-" : behavior.toString(),
        "approval": approval == null ? [] :
                    approval == List.empty() ? [] : 
                    List<dynamic>.from(approval!.map((x) => x.toJson())),
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
    final DateTime? createdAt;
    final DateTime? tglApproval;
    final String? approvalLevel;
    final String? namaKaryawan;
    final String? namaJabatan;
    final String? approvalBaseline;

    factory Approval.fromRawJson(String str) => Approval.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Approval.fromJson(Map<String, dynamic> json) => Approval(
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
        approvalBaseline: json["approval_baseline"] == null ? "-" : json["approval_baseline"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_approval_transaksi": idApprovalTransaksi == null ? "-" : idApprovalTransaksi.toString(),
        "no_transaksi": noTransaksi == null ? "-" : noTransaksi.toString(),
        "kode_transaksi": kodeTransaksi == null ? "-" : kodeTransaksi.toString(),
        "id_karyawan": idKaryawan == null ? "-" : idKaryawan.toString(),
        "id_jabatan": idJabatan == null ? "-" : idJabatan.toString(),
        "status_approval": statusApproval == null ? "-" : statusApproval.toString(),
        "catatan": catatan == null ? "-" : catatan.toString(),
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "tgl_approval": tglApproval == null ? null : "${tglApproval?.year.toString().padLeft(4, '0')}-${tglApproval?.month.toString().padLeft(2, '0')}-${tglApproval?.day.toString().padLeft(2, '0')}",
        "approval_level": approvalLevel == null ? "-" : approvalLevel.toString(),
        "nama_karyawan": namaKaryawan == null ? "-" : namaKaryawan.toString(),
        "nama_jabatan": namaJabatan == null ? "-" : namaJabatan.toString(),
        "approval_baseline": approvalBaseline == null ? "-" : approvalBaseline.toString(),
    };
}

class DataDetail {
    DataDetail({
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
        this.att,
        this.instalasi,
        this.lainLain,
        this.isHidden,
        this.baseline,
        this.idProyek,
        this.kodeProyek,
        this.namaProyek,
        this.lokasiProyek,
        this.realisasiPenawaran,
        this.scheduleKebutuhanProyek,
        this.kelompokProyek,
        this.detail,
        this.prelim,
        this.stakeholder,
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
    final String? att;
    final bool? instalasi;
    final String? lainLain;
    final bool? isHidden;
    final String? baseline;
    final String? idProyek;
    final String? kodeProyek;
    final String? namaProyek;
    final String? lokasiProyek;
    final DateTime? realisasiPenawaran;
    final String? scheduleKebutuhanProyek;
    final String? kelompokProyek;
    final List<DetailElement>? detail;
    final List<Prelim>? prelim;
    final List<Approval>? stakeholder;

    factory DataDetail.fromRawJson(String str) => DataDetail.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DataDetail.fromJson(Map<String, dynamic> json) => DataDetail(
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
        att: json["att"] == null ? "-" : json["att"].toString(),
        instalasi: json["instalasi"],
        lainLain: json["lain_lain"] == null ? "-" : json["lain_lain"].toString(),
        isHidden: json["is_hidden"],
        baseline: json["baseline"] == null ? "-" : json["baseline"].toString(),
        idProyek: json["id_proyek"] == null ? "-" : json["id_proyek"].toString(),
        kodeProyek: json["kode_proyek"] == null ? "-" : json["kode_proyek"].toString(),
        namaProyek: json["nama_proyek"] == null ? "-" : json["nama_proyek"].toString(),
        lokasiProyek: json["lokasi_proyek"] == null ? "-" : json["lokasi_proyek"].toString(),
        realisasiPenawaran: json["realisasi_penawaran"] == null ? null : DateTime.parse(json["realisasi_penawaran"]),
        scheduleKebutuhanProyek: json["schedule_kebutuhan_proyek"] == null ? "-" : json["schedule_kebutuhan_proyek"].toString(),
        kelompokProyek: json["kelompok_proyek"] == null ? "-" : json["kelompok_proyek"].toString(),
        detail: json["detail"] == null ? [] :
                json["detail"] == List.empty() ? [] :
                List<DetailElement>.from(json["detail"].map((x) => DetailElement.fromJson(x))),
        prelim: json["prelim"] == null ? [] : 
                json["prelim"] == List.empty() ? [] :
                List<Prelim>.from(json["prelim"].map((x) => Prelim.fromJson(x))),
        stakeholder: json["stakeholder"] == null ? [] : 
                json["stakeholder"] == List.empty() ? [] :
                List<Approval>.from(json["stakeholder"].map((x) => Approval.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id_rae": idRae == null ? "-" : idRae.toString(),
        "tgl_rae": tglRae == null ? null : "${tglRae?.year.toString().padLeft(4, '0')}-${tglRae?.month.toString().padLeft(2, '0')}-${tglRae?.day.toString().padLeft(2, '0')}",
        "no_rae": noRae == null ? "-" : noRae.toString(),
        "id_peluang": idPeluang == null ? "-" : idPeluang.toString(),
        "no_peluang": noPeluang == null ? "-" : noPeluang.toString(),
        "tgl_peluang": tglPeluang == null ? "-" : "${tglPeluang?.year.toString().padLeft(4, '0')}-${tglPeluang?.month.toString().padLeft(2, '0')}-${tglPeluang?.day.toString().padLeft(2, '0')}",
        "id_customer": idCustomer == null ? "-" : idCustomer.toString(),
        "nama_customer": namaCustomer == null ? "-" : namaCustomer.toString(),
        "id_peringkat_peluang": idPeringkatPeluang == null ? "-" : idPeringkatPeluang.toString(),
        "nama_peringkat_peluang": namaPeringkatPeluang == null ? "-" : namaPeringkatPeluang.toString(),
        "keterangan_pengiriman": keteranganPengiriman == null ? "-" : keteranganPengiriman.toString(),
        "lokasi_pengiriman": lokasiPengiriman == null ? "-" : lokasiPengiriman.toString(),
        "tgl_selesai": tglSelesai == null ? "-" : "${tglSelesai?.year.toString().padLeft(4, '0')}-${tglSelesai?.month.toString().padLeft(2, '0')}-${tglSelesai?.day.toString().padLeft(2, '0')}",
        "att": att == null ? "-" : att.toString(),
        "instalasi": instalasi == null ? "-" : instalasi.toString(),
        "lain_lain": lainLain == null ? "-" : lainLain.toString(),
        "is_hidden": isHidden == null ? "-" : isHidden.toString(),
        "baseline": baseline == null ? "-" : baseline.toString(),
        "id_proyek": idProyek == null ? "-" : idProyek.toString(),
        "kode_proyek": kodeProyek == null ? "-" : kodeProyek.toString(),
        "nama_proyek": namaProyek == null ? "-" : namaProyek.toString(),
        "lokasi_proyek": lokasiProyek == null ? "-" : lokasiProyek.toString(),
        "realisasi_penawaran": realisasiPenawaran == null ? "-" : "${realisasiPenawaran?.year.toString().padLeft(4, '0')}-${realisasiPenawaran?.month.toString().padLeft(2, '0')}-${realisasiPenawaran?.day.toString().padLeft(2, '0')}",
        "schedule_kebutuhan_proyek": scheduleKebutuhanProyek == null ? "-" : scheduleKebutuhanProyek.toString(),
        "kelompok_proyek": kelompokProyek == null ? "-" : kelompokProyek.toString(),
        "detail": detail == null ? [] : 
                  detail == List.empty() ? [] :
                  List<dynamic>.from(detail!.map((x) => x.toJson())),
        "prelim": prelim == null ? [] :
                  prelim == List.empty() ? [] :
                  List<dynamic>.from(prelim!.map((x) => x.toJson())),
        "stakeholder": stakeholder == null ? [] : 
                  stakeholder == List.empty() ? [] :
                  List<dynamic>.from(stakeholder!.map((x) => x.toJson())),
    };
}

class DetailElement {
    DetailElement({
        this.idRaeDetail,
        this.idRae,
        this.idBarangJadi,
        this.qtyRae,
        this.hargaSatuanRae,
        this.refUid,
        this.kodeItem,
        this.namaItem,
        this.namaSatuan,
        this.idJenis,
        this.idSatuanJual,
        this.namaJenis,
        this.linkReferensi,
        this.uraian,
        this.namaKelompok,
        this.namaPengaju,
    });

    final String? idRaeDetail;
    final String? idRae;
    final String? idBarangJadi;
    final String? qtyRae;
    final String? hargaSatuanRae;
    final String? refUid;
    final String? kodeItem;
    final String? namaItem;
    final String? namaSatuan;
    final String? idJenis;
    final String? idSatuanJual;
    final String? namaJenis;
    final String? linkReferensi;
    final String? uraian;
    final String? namaKelompok;
    final String? namaPengaju;

    factory DetailElement.fromRawJson(String str) => DetailElement.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DetailElement.fromJson(Map<String, dynamic> json) => DetailElement(
        idRaeDetail: json["id_rae_detail"] == null ? "-" : json["id_rae_detail"].toString(),
        idRae: json["id_rae"] == null ? "-" : json["id_rae"].toString(),
        idBarangJadi: json["id_barang_jadi"] == null ? "-" : json["id_barang_jadi"].toString(),
        qtyRae: json["qty_rae"] == null ? "-" : json["qty_rae"].toString(),
        hargaSatuanRae: json["harga_satuan_rae"] == null ? "-" : json["harga_satuan_rae"].toString(),
        refUid: json["ref_uid"] == null ? "-" : json["ref_uid"].toString(),
        kodeItem: json["kode_item"] == null ? "-" : json["kode_item"].toString(),
        namaItem: json["nama_item"] == null ? "-" : json["nama_item"].toString(),
        namaSatuan: json["nama_satuan"] == null ? "-" : json["nama_satuan"].toString(),
        idJenis: json["id_jenis"] == null ? "-" : json["id_jenis"].toString(),
        idSatuanJual: json["id_satuan_jual"] == null ? "-" : json["id_satuan_jual"].toString(),
        namaJenis: json["nama_jenis"] == null ? "-" : json["nama_jenis"].toString(),
        linkReferensi: json["link_referensi"] == null ? "-" : json["link_referensi"].toString(),
        uraian: json["uraian"] == null ? "-" : json["uraian"].toString(),
        namaKelompok: json["nama_kelompok"] == null ? "-" : json["nama_kelompok"].toString(),
        namaPengaju: json["nama_pengaju"] == null ? "-" : json["nama_pengaju"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_rae_detail": idRaeDetail == null ? "-" : idRaeDetail.toString(),
        "id_rae": idRae == null ? "-" : idRae.toString(),
        "id_barang_jadi": idBarangJadi == null ? "-" : idBarangJadi.toString(),
        "qty_rae": qtyRae == null ? "-" : qtyRae.toString(),
        "harga_satuan_rae": hargaSatuanRae == null ? "-" : hargaSatuanRae.toString(),
        "ref_uid": refUid == null ? "-" : refUid.toString(),
        "kode_item": kodeItem == null ? "-" : kodeItem.toString(),
        "nama_item": namaItem == null ? "-" : namaItem.toString(),
        "nama_satuan": namaSatuan == null ? "-" : namaSatuan.toString(),
        "id_jenis": idJenis == null ? "-" : idJenis.toString(),
        "id_satuan_jual": idSatuanJual == null ? "-" : idSatuanJual.toString(),
        "nama_jenis": namaJenis == null ? "-" : namaJenis.toString(),
        "link_referensi": linkReferensi == null ? "-" : linkReferensi.toString(),
        "uraian": uraian == null ? "-" : uraian.toString(),
        "nama_kelompok": namaKelompok == null ? "-" : namaKelompok.toString(),
        "nama_pengaju": namaPengaju,
    };
}

class Prelim {
    Prelim({
        this.idRaePrelim,
        this.idItemPrelim,
        this.kodeItemPrelim,
        this.namaItemPrelim,
        this.idKelompok,
        this.namaKelompok,
        this.hargaSatuanPrelim,
        this.qtyAnalisa,
        this.idSatuanPrelim,
        this.kodeSatuanPrelim,
        this.namaSatuanPrelim,
        this.qtyDurasi,
        this.idSatuanWaktu,
        this.kodeSatuanWaktu,
        this.namaSatuanWaktu,
        this.idRae,
        this.konstanta,
        this.unitPrice,
    });

    final String? idRaePrelim;
    final String? idItemPrelim;
    final String? kodeItemPrelim;
    final String? namaItemPrelim;
    final String? idKelompok;
    final String? namaKelompok;
    final String? hargaSatuanPrelim;
    final String? qtyAnalisa;
    final String? idSatuanPrelim;
    final String? kodeSatuanPrelim;
    final String? namaSatuanPrelim;
    final String? qtyDurasi;
    final String? idSatuanWaktu;
    final String? kodeSatuanWaktu;
    final String? namaSatuanWaktu;
    final String? idRae;
    final String? konstanta;
    final String? unitPrice;

    factory Prelim.fromRawJson(String str) => Prelim.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Prelim.fromJson(Map<String, dynamic> json) => Prelim(
        idRaePrelim: json["id_rae_prelim"] == null ? "-" : json["id_rae_prelim"].toString() ,
        idItemPrelim: json["id_item_prelim"] == null ? "-" : json["id_item_prelim"].toString() ,
        kodeItemPrelim: json["kode_item_prelim"] == null ? "-" : json["kode_item_prelim"].toString() ,
        namaItemPrelim: json["nama_item_prelim"] == null ? "-" : json["nama_item_prelim"].toString() ,
        idKelompok: json["id_kelompok"] == null ? "-" : json["id_kelompok"].toString() ,
        namaKelompok: json["nama_kelompok"] == null ? "-" : json["nama_kelompok"].toString() ,
        hargaSatuanPrelim: json["harga_satuan_prelim"] == null ? "-" : json["harga_satuan_prelim"].toString() ,
        qtyAnalisa: json["qty_analisa"] == null ? "-" : json["qty_analisa"].toString() ,
        idSatuanPrelim: json["id_satuan_prelim"] == null ? "-" : json["id_satuan_prelim"].toString() ,
        kodeSatuanPrelim: json["kode_satuan_prelim"] == null ? "-" : json["kode_satuan_prelim"].toString() ,
        namaSatuanPrelim: json["nama_satuan_prelim"] == null ? "-" : json["nama_satuan_prelim"].toString() ,
        qtyDurasi: json["qty_durasi"] == null ? "-" : json["qty_durasi"].toString() ,
        idSatuanWaktu: json["id_satuan_waktu"] == null ? "-" : json["id_satuan_waktu"].toString() ,
        kodeSatuanWaktu: json["kode_satuan_waktu"] == null ? "-" : json["kode_satuan_waktu"].toString() ,
        namaSatuanWaktu: json["nama_satuan_waktu"] == null ? "-" : json["nama_satuan_waktu"].toString() ,
        idRae: json["id_rae"] == null ? "-" : json["id_rae"].toString() ,
        konstanta: json["konstanta"] == null ? "-" : json["konstanta"].toString() ,
        unitPrice: json["unit_price"] == null ? "-" : json["unit_price"].toString() ,
    );

    Map<String, dynamic> toJson() => {
        "id_rae_prelim": idRaePrelim == null ? "-" : idRaePrelim.toString(),
        "id_item_prelim": idItemPrelim == null ? "-" : idItemPrelim.toString(),
        "kode_item_prelim": kodeItemPrelim == null ? "-" : kodeItemPrelim.toString(),
        "nama_item_prelim": namaItemPrelim == null ? "-" : namaItemPrelim.toString(),
        "id_kelompok": idKelompok == null ? "-" : idKelompok.toString(),
        "nama_kelompok": namaKelompok == null ? "-" : namaKelompok.toString(),
        "harga_satuan_prelim": hargaSatuanPrelim == null ? "-" : hargaSatuanPrelim.toString(),
        "qty_analisa": qtyAnalisa == null ? "-" : qtyAnalisa.toString(),
        "id_satuan_prelim": idSatuanPrelim == null ? "-" : idSatuanPrelim.toString(),
        "kode_satuan_prelim": kodeSatuanPrelim == null ? "-" : kodeSatuanPrelim.toString(),
        "nama_satuan_prelim": namaSatuanPrelim == null ? "-" : namaSatuanPrelim.toString(),
        "qty_durasi": qtyDurasi == null ? "-" : qtyDurasi.toString(),
        "id_satuan_waktu": idSatuanWaktu == null ? "-" : idSatuanWaktu.toString(),
        "kode_satuan_waktu": kodeSatuanWaktu == null ? "-" : kodeSatuanWaktu.toString(),
        "nama_satuan_waktu": namaSatuanWaktu == null ? "-" : namaSatuanWaktu.toString(),
        "id_rae": idRae == null ? "-" : idRae.toString(),
        "konstanta": konstanta == null ? "-" : konstanta.toString(),
        "unit_price": unitPrice == null ? "-" : unitPrice.toString(),
    };
}