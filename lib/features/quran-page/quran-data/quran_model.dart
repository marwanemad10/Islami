//         "id": "1",
//         "jozz": "1",
//         "page": "1",
//         "sura_no": "1",
//         "sura_name_en": "Al-Fātiḥah",
//         "sura_name_ar": "الفَاتِحة ",
//         "line_start": "2",
//         "line_end": "2",
//         "aya_no": "1",
//         "aya_text": "بِسۡمِ ٱللَّهِ ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ",
//         "aya_text_emlaey": "بسم الله الرحمن الرحيم",
//         "aya_tafseer": "[1] أبتدئ قراءة القرآن باسم الله مستعيناً به،  ٱللَّهِ علم على الرب -تبارك وتعالى- المعبود بحق دون سواه، وهو أخص أسماء الله تعالى، ولا يسمى به غيره سبحانه.ٱلرَّحۡمَٰنِ ذي الرحمة العامة الذي وسعت رحمته جميع الخلق، ٱلرَّحِيمِ بالمؤمنين، وهما اسمان من أسمائه تعالى، يتضمنان إثبات صفة الرحمة لله تعالى، كما يليق بجلاله."

class QuranModel2 {
  String? page;
  String? sura_no;
  String? sura_name_ar;
  String? aya_no;
  String? aya_text;
  String? aya_text_emlaey;
  String? aya_tafseer;

  QuranModel2({
    this.page,
    this.sura_no,
    this.sura_name_ar,
    this.aya_no,
    this.aya_text,
    this.aya_text_emlaey,
    this.aya_tafseer,
  });

  QuranModel2.fromJson(Map<String, dynamic> json) {
    if (json["page"] is String) {
      page = json["page"];
    }
    if (json["sura_no"] is String) {
      sura_no = json["sura_no"];
    }
    if (json["sura_name_ar"] is String) {
      sura_name_ar = json["sura_name_ar"];
    }
    if (json["aya_no"] is String) {
      aya_no = json["aya_no"];
    }
    if (json["aya_text"] is String) {
      aya_text = json["aya_text"];
    }
    if (json["aya_text_emlaey"] is String) {
      aya_text_emlaey = json["aya_text_emlaey"];
    }
    if (json["aya_tafseer"] is String) {
      aya_tafseer = json["aya_tafseer"];
    }
  }
}
