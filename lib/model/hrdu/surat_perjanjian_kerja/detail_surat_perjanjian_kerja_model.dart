// To parse this JSON data, do
//
//     final detailRegspk = detailRegspkFromJson(jsonString);

import 'dart:convert';

class DetailRegspk {
    DetailRegspk({
        this.status,
        this.message,
        this.data,
    });

    final bool? status;
    final String? message;
    final Data? data;

    factory DetailRegspk.fromRawJson(String str) => DetailRegspk.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DetailRegspk.fromJson(Map<String, dynamic> json) => DetailRegspk(
        status: json["status"],
        message: json["message"] == null ? "-" : json["message"].toString(),
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message == null ? "-" : message.toString(),
        "data": data?.toJson(),
    };
}

class Data {
    Data({
        this.detail,
        this.behavior,
        required this.approval,
    });

    final Detail? detail;
    final String? behavior;
    final List<Approval> approval;

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        detail: json["detail"] == null ? null : Detail.fromJson(json["detail"]),
        behavior: json["behavior"] == null ? "-" : json["behavior"].toString(),
        approval: json["approval"] == List.empty() ? [] : List<Approval>.from(json["approval"].map((x) => Approval.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "detail": detail?.toJson(),
        "behavior": behavior == null ? "-" : behavior.toString(),
        "approval": approval == List.empty() ? [] : List<dynamic>.from(approval.map((x) => x.toJson())),
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

class Detail {
    Detail({
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
        this.idRae,
        this.idRab,
        this.idPeluang,
        this.noRab,
        this.baselineRef,
        this.idProyek,
        this.namaProyek,
        this.noPeluang,
        this.tglPeluang,
        this.lainLain,
        this.lokasiPengiriman,
        this.keteranganPengiriman,
        this.namaPeringkatPeluang,
        this.idSegmentasiPasar,
        this.tglRae,
        this.tglRab,
        this.noRae,
        this.namaSegmentasiPasar,
        this.linkReferensi,
        this.scheduleKebutuhanProyek,
        this.realisasiPenawaran,
        this.diskon,
        this.telepon,
        this.alamat,
        this.email,
        this.uangMuka,
        this.detailBarangJadi,
        this.detailPrelim,
        this.stakeholder,
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
    final String? idRae;
    final String? idRab;
    final String? idPeluang;
    final String? noRab;
    final String? baselineRef;
    final String? idProyek;
    final String? namaProyek;
    final String? noPeluang;
    final DateTime? tglPeluang;
    final String? lainLain;
    final String? lokasiPengiriman;
    final String? keteranganPengiriman;
    final String? namaPeringkatPeluang;
    final String? idSegmentasiPasar;
    final DateTime? tglRae;
    final DateTime? tglRab;
    final String? noRae;
    final String? namaSegmentasiPasar;
    final String? linkReferensi;
    final String? scheduleKebutuhanProyek;
    final DateTime? realisasiPenawaran;
    final String? diskon;
    final String? telepon;
    final String? alamat;
    final String? email;
    final String? uangMuka;
    final List<DetailBarangJadi>? detailBarangJadi;
    final List<DetailPrelim>? detailPrelim;
    final List<Approval>? stakeholder;

    factory Detail.fromRawJson(String str) => Detail.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        idSpk: json["id_spk"] == null ? "-" : json["id_spk"].toString(),
        noSpk: json["no_spk"] == null ? "-" : json["no_spk"].toString(),
        tglSpk: json["tgl_spk"] == null ? null : DateTime.parse(json["tgl_spk"]),
        tglSelesaiSpk: json["tgl_selesai_spk"] == null ? null : DateTime.parse(json["tgl_selesai_spk"]),
        idPenawaran: json["id_penawaran"] == null ? "-" : json["id_penawaran"].toString(),
        catatan: json["catatan"] == null ? "-" : json["catatan"].toString(),
        ppn: json["ppn"] == null ? "0.0" : json["ppn"].toString(),
        baseline: json["baseline"] == null ? "-" : json["baseline"].toString(),
        tglPenawaran: json["tgl_penawaran"] == null ? null : DateTime.parse(json["tgl_penawaran"]),
        noPenawaran: json["no_penawaran"] == null ? "-" : json["no_penawaran"].toString(),
        namaCustomer: json["nama_customer"] == null ? "-" : json["nama_customer"].toString(),
        att: json["att"] == null ? "-" : json["att"].toString(),
        tglSelesai: json["tgl_selesai"] == null ? null : DateTime.parse(json["tgl_selesai"]),
        idRae: json["id_rae"] == null ? "-" : json["id_rae"].toString(),
        idRab: json["id_rab"] == null ? "-" : json["id_rab"].toString(),
        idPeluang: json["id_peluang"] == null ? "-" : json["id_peluang"].toString(),
        noRab: json["no_rab"] == null ? "-" : json["no_rab"].toString(),
        baselineRef: json["baseline_ref"] == null ? "-" : json["baseline_ref"].toString(),
        idProyek: json["id_proyek"] == null ? "-" : json["id_proyek"].toString(),
        namaProyek: json["nama_proyek"] == null ? "-" : json["nama_proyek"].toString(),
        noPeluang: json["no_peluang"] == null ? "-" : json["no_peluang"].toString(),
        tglPeluang: json["tgl_peluang"] == null ? null : DateTime.parse(json["tgl_peluang"]),
        lainLain: json["lain_lain"] == null ? "-" : json["lain_lain"].toString(),
        lokasiPengiriman: json["lokasi_pengiriman"] == null ? "-" : json["lokasi_pengiriman"].toString(),
        keteranganPengiriman: json["keterangan_pengiriman"] == null ? "-" : json["keterangan_pengiriman"].toString(),
        namaPeringkatPeluang: json["nama_peringkat_peluang"] == null ? "-" : json["nama_peringkat_peluang"].toString(),
        idSegmentasiPasar: json["id_segmentasi_pasar"] == null ? "-" : json["id_segmentasi_pasar"].toString(),
        tglRae: json["tgl_rae"] == null ? null : DateTime.parse(json["tgl_rae"]),
        tglRab: json["tgl_rab"] == null ? null : DateTime.parse(json["tgl_rab"]),
        noRae: json["no_rae"] == null ? "-" : json["no_rae"].toString(),
        namaSegmentasiPasar: json["nama_segmentasi_pasar"] == null ? "-" : json["nama_segmentasi_pasar"].toString(),
        linkReferensi: json["link_referensi"] == null ? "-" : json["link_referensi"].toString(),
        scheduleKebutuhanProyek: json["schedule_kebutuhan_proyek"] == null ? "-" : json["schedule_kebutuhan_proyek"].toString(),
        realisasiPenawaran: json["realisasi_penawaran"] == null ? null : DateTime.parse(json["realisasi_penawaran"]),
        diskon: json["diskon"] == null ? "0.0" : json["diskon"].toString(),
        telepon: json["telepon"] == null ? "-" : json["telepon"].toString(),
        alamat: json["alamat"] == null ? "-" : json["alamat"].toString(),
        email: json["email"] == null ? "-" : json["email"].toString(),
        uangMuka: json["uang_muka"] == null ? "0.0" : json["uang_muka"].toString(),
        detailBarangJadi: json["detail_barang_jadi"] == List.empty() ? [] : List<DetailBarangJadi>.from(json["detail_barang_jadi"].map((x) => DetailBarangJadi.fromJson(x))),
        detailPrelim: json["detail_prelim"] == List.empty() ? [] : List<DetailPrelim>.from(json["detail_prelim"].map((x) => DetailPrelim.fromJson(x))),
        stakeholder: json["stakeholder"] == List.empty() ? [] : List<Approval>.from(json["stakeholder"].map((x) => Approval.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id_spk": idSpk == null ? "-" : idSpk.toString(),
        "no_spk": noSpk == null ? "-" : noSpk.toString(),
        "tgl_spk": tglSpk == null ? null : "${tglSpk?.year.toString().padLeft(4, '0')}-${tglSpk?.month.toString().padLeft(2, '0')}-${tglSpk?.day.toString().padLeft(2, '0')}",
        "tgl_selesai_spk": tglSelesaiSpk == null ? null : "${tglSelesaiSpk?.year.toString().padLeft(4, '0')}-${tglSelesaiSpk?.month.toString().padLeft(2, '0')}-${tglSelesaiSpk?.day.toString().padLeft(2, '0')}",
        "id_penawaran": idPenawaran == null ? "-" : idPenawaran.toString(),
        "catatan": catatan == null ? "-" : catatan.toString(),
        "ppn": ppn == null ? "0.0" : ppn.toString(),
        "baseline": baseline == null ? "-" : baseline.toString(),
        "tgl_penawaran": tglPenawaran == null ? null : "${tglPenawaran?.year.toString().padLeft(4, '0')}-${tglPenawaran?.month.toString().padLeft(2, '0')}-${tglPenawaran?.day.toString().padLeft(2, '0')}",
        "no_penawaran": noPenawaran == null ? "-" : noPenawaran.toString(),
        "nama_customer": namaCustomer == null ? "-" : namaCustomer.toString(),
        "att": att == null ? "-" : att.toString(),
        "tgl_selesai": tglSelesai == null ? null : "${tglSelesai?.year.toString().padLeft(4, '0')}-${tglSelesai?.month.toString().padLeft(2, '0')}-${tglSelesai?.day.toString().padLeft(2, '0')}",
        "id_rae": idRae == null ? "-" : idRae.toString(),
        "id_rab": idRab == null ? "-" : idRab.toString(),
        "id_peluang": idPeluang == null ? "-" : idPeluang.toString(),
        "no_rab": noRab == null ? "-" : noRab.toString(),
        "baseline_ref": baselineRef == null ? "-" : baselineRef.toString(),
        "id_proyek": idProyek == null ? "-" : idProyek.toString(),
        "nama_proyek": namaProyek == null ? "-" : namaProyek.toString(),
        "no_peluang": noPeluang == null ? "-" : noPeluang.toString(),
        "tgl_peluang": tglPeluang == null ? null : "${tglPeluang?.year.toString().padLeft(4, '0')}-${tglPeluang?.month.toString().padLeft(2, '0')}-${tglPeluang?.day.toString().padLeft(2, '0')}",
        "lain_lain": lainLain == null ? "-" : lainLain.toString(),
        "lokasi_pengiriman": lokasiPengiriman == null ? "-" : lokasiPengiriman.toString(),
        "keterangan_pengiriman": keteranganPengiriman == null ? "-" : keteranganPengiriman.toString(),
        "nama_peringkat_peluang": namaPeringkatPeluang == null ? "-" : namaPeringkatPeluang.toString(),
        "id_segmentasi_pasar": idSegmentasiPasar == null ? "-" : idSegmentasiPasar.toString(),
        "tgl_rae": tglRae == null ? null : "${tglRae?.year.toString().padLeft(4, '0')}-${tglRae?.month.toString().padLeft(2, '0')}-${tglRae?.day.toString().padLeft(2, '0')}",
        "tgl_rab": tglRab == null ? null : "${tglRab?.year.toString().padLeft(4, '0')}-${tglRab?.month.toString().padLeft(2, '0')}-${tglRab?.day.toString().padLeft(2, '0')}",
        "no_rae": noRae == null ? "-" : noRae.toString(),
        "nama_segmentasi_pasar": namaSegmentasiPasar == null ? "-" : namaSegmentasiPasar.toString(),
        "link_referensi": linkReferensi == null ? "-" : linkReferensi.toString(),
        "schedule_kebutuhan_proyek": scheduleKebutuhanProyek == null ? "-" : scheduleKebutuhanProyek.toString(),
        "realisasi_penawaran": realisasiPenawaran == null ? "-" : "${realisasiPenawaran?.year.toString().padLeft(4, '0')}-${realisasiPenawaran?.month.toString().padLeft(2, '0')}-${realisasiPenawaran?.day.toString().padLeft(2, '0')}",
        "diskon": diskon == null ? "0.0" : diskon.toString(),
        "telepon": telepon == null ? "-" : telepon.toString(),
        "alamat": alamat == null ? "-" : alamat.toString(),
        "email": email == null ? "-" : email.toString(),
        "uang_muka": uangMuka == null ? "0.0" : uangMuka.toString(),
        "detail_barang_jadi": detailBarangJadi == null ? null : List<dynamic>.from(detailBarangJadi!.map((x) => x.toJson())),
        "detail_prelim": detailPrelim == null ? null : List<dynamic>.from(detailPrelim!.map((x) => x.toJson())),
        "stakeholder": stakeholder == null ? null : List<dynamic>.from(stakeholder!.map((x) => x.toJson())),
    };
}

class DetailBarangJadi {
    DetailBarangJadi({
        this.idRabDetail,
        this.idRab,
        this.idRaeDetail,
        this.idBarangJadi,
        this.qtyRab,
        this.hargaSatuanRab,
        this.kodeItem,
        this.namaItem,
        this.namaSatuan,
        this.idJenis,
        this.rounded,
    });

    final String? idRabDetail;
    final String? idRab;
    final String? idRaeDetail;
    final String? idBarangJadi;
    final String? qtyRab;
    final String? hargaSatuanRab;
    final String? kodeItem;
    final String? namaItem;
    final String? namaSatuan;
    final String? idJenis;
    final String? rounded;

    factory DetailBarangJadi.fromRawJson(String str) => DetailBarangJadi.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DetailBarangJadi.fromJson(Map<String, dynamic> json) => DetailBarangJadi(
        idRabDetail: json["id_rab_detail"] == null ? "-" : json["id_rab_detail"].toString(),
        idRab: json["id_rab"] == null ? "-" : json["id_rab"].toString(),
        idRaeDetail: json["id_rae_detail"] == null ? "-" : json["id_rae_detail"].toString(),
        idBarangJadi: json["id_barang_jadi"] == null ? "-" : json["id_barang_jadi"].toString(),
        qtyRab: json["qty_rab"] == null ? "-" : json["qty_rab"].toString(),
        hargaSatuanRab: json["harga_satuan_rab"] == null ? "-" : json["harga_satuan_rab"].toString(),
        kodeItem: json["kode_item"] == null ? "-" : json["kode_item"].toString(),
        namaItem: json["nama_item"] == null ? "-" : json["nama_item"].toString(),
        namaSatuan: json["nama_satuan"] == null ? "-" : json["nama_satuan"].toString(),
        idJenis: json["id_jenis"] == null ? "-" : json["id_jenis"].toString(),
        rounded: json["rounded"] == null ? "-" : json["rounded"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_rab_detail": idRabDetail == null ? "-" : idRabDetail.toString(),
        "id_rab": idRab == null ? "-" : idRab.toString(),
        "id_rae_detail": idRaeDetail == null ? "-" : idRaeDetail.toString(),
        "id_barang_jadi": idBarangJadi == null ? "-" : idBarangJadi.toString(),
        "qty_rab": qtyRab == null ? "-" : qtyRab.toString(),
        "harga_satuan_rab": hargaSatuanRab == null ? "-" : hargaSatuanRab.toString(),
        "kode_item": kodeItem == null ? "-" : kodeItem.toString(),
        "nama_item": namaItem == null ? "-" : namaItem.toString(),
        "nama_satuan": namaSatuan == null ? "-" : namaSatuan.toString(),
        "id_jenis": idJenis == null ? "-" : idJenis.toString(),
        "rounded": rounded == null ? "-" : rounded.toString(),
    };
}

class DetailPrelim {
    DetailPrelim({
        this.idRabPrelim,
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
        this.idRab,
        this.konstanta,
        this.unitPrice,
    });

    final String? idRabPrelim;
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
    final String? idRab;
    final String? konstanta;
    final String? unitPrice;

    factory DetailPrelim.fromRawJson(String str) => DetailPrelim.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DetailPrelim.fromJson(Map<String, dynamic> json) => DetailPrelim(
        idRabPrelim: json["id_rab_prelim"] == null ? "-" : json["id_rab_prelim"].toString(),
        idItemPrelim: json["id_item_prelim"] == null ? "-" : json["id_item_prelim"].toString(),
        kodeItemPrelim: json["kode_item_prelim"] == null ? "-" : json["kode_item_prelim"].toString(),
        namaItemPrelim: json["nama_item_prelim"] == null ? "-" : json["nama_item_prelim"].toString(),
        idKelompok: json["id_kelompok"] == null ? "-" : json["id_kelompok"].toString(),
        namaKelompok: json["nama_kelompok"] == null ? "-" : json["nama_kelompok"].toString(),
        hargaSatuanPrelim: json["harga_satuan_prelim"] == null ? "-" : json["harga_satuan_prelim"].toString(),
        qtyAnalisa: json["qty_analisa"] == null ? "-" : json["qty_analisa"].toString(),
        idSatuanPrelim: json["id_satuan_prelim"] == null ? "-" : json["id_satuan_prelim"].toString(),
        kodeSatuanPrelim: json["kode_satuan_prelim"] == null ? "-" : json["kode_satuan_prelim"].toString(),
        namaSatuanPrelim: json["nama_satuan_prelim"] == null ? "-" : json["nama_satuan_prelim"].toString(),
        qtyDurasi: json["qty_durasi"] == null ? "-" : json["qty_durasi"].toString(),
        idSatuanWaktu: json["id_satuan_waktu"] == null ? "-" : json["id_satuan_waktu"].toString(),
        kodeSatuanWaktu: json["kode_satuan_waktu"] == null ? "-" : json["kode_satuan_waktu"].toString(),
        namaSatuanWaktu: json["nama_satuan_waktu"] == null ? "-" : json["nama_satuan_waktu"].toString(),
        idRab: json["id_rab"] == null ? "-" : json["id_rab"].toString(),
        konstanta: json["konstanta"] == null ? "-" : json["konstanta"].toString(),
        unitPrice: json["unit_price"] == null ? "-" : json["unit_price"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_rab_prelim": idRabPrelim == null ? "-" : idRabPrelim.toString(),
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
        "id_rab": idRab == null ? "-" : idRab.toString(),
        "konstanta": konstanta == null ? "-" : konstanta.toString(),
        "unit_price": unitPrice == null ? "-" : unitPrice.toString(),
    };
}