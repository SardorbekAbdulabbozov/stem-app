import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_project/src/core/controller/base_controller.dart';

class TopicController extends BaseController {
  String subject = '';
  String topic = '';
  List<Section> sections = [];
  Map<String, List<Section>> mapOfSections = {
    "Inson ko`zi": [
      Section(
        title: 'Ko`z strukturasi',
        model: 'Human_eye',
        info:
            "Odam koʻzi — odamning koʻruvchi juft sezgi organi. Odam koʻzi boshning tepa old qismida joylashgan boʻlib, uning atrofida qosh, qovoq, kipriklar joylashgan. Ushbu aʼzolar mimikada faol ishtirok etadilar. Odam koʻzining ishlash prinsipi yorugʻlikning miqdori bilan chambarchas bogʻliq.",
        features: ['image', 'video'],
        fullInfo:
            "Odam koʻzi ko'z olmasi, koʻrish nervlari va yordamchi organlar(qoboq, qosh, kiprik, koʻz olmasi mushaklari)dan tashkil topgan. U har xil yoʻnalishda bemalol aylana oladi: vertikal (tepaga va pastga), gorizontal (oʻngga va chapga) kabi. Odam koʻzi atrofida 3 juft mushaklar joylashgan boʻlib, 4 tasi toʻgʻri (tepa, pastki, ichki va tashqi) va 2 tasi egri (ustki va ostki) taraflarga harakatlantiruvchi mushaklardir. Bu mushaklarni miyadan keluvchi signallar boshqaradi. Tashqi tuzilishi Odam koʻzining tashqi tarafidan faqat eng kichik va eng boʻrtib turgan joyi — ko'z gavhari va uni oʻrab turuvchi ozgina joyi koʻrinadi xolos. Qolgan asosiy qismi koʻz soqqasi ichida turadi. Koʻz unchalik toʻgʻri boʻlmagan shar formasida boʻlib, katta yoshli odamlarning koʻzining hajmi 7,448 sm³, ogʻirligi esa 7-8 gramm keladi. Odam koʻzining kattaligi barchada bir xil boʻlib, bir necha millimetrgagina ulushigagina farq qiladi.",
        image:
            'https://www.centralfloridaretina.com/wp-content/uploads/eye-anatomy-infographic-1.jpg',
        video: 'nbwPPcwknPU',
      ),
    ],
    "Hujayra": [
      Section(
        title: 'Inson hujayrasi',
        model: 'Human_cell',
        info:
            "Hujayra (lotincha: cellula — „katakcha“) barcha hayot organizmlarning tuzilish, tarkibiy va funksional birligidir (viruslar bundan mustasno).",
        features: ['image'],
        fullInfo:
            "Hujayra (lotincha: cellula — „katakcha“) barcha hayot organizmlarning tuzilish, tarkibiy va funksional birligidir (viruslar bundan mustasno). Hujayra organizmning yashayotgan eng kichik boʻlagi, deb belgilanadi. Baʼzi organizmlar (masalan, bakteriyalar) bir hujayralidir, yaʼni faqat bitta hujayraga ega. Boshqa organizmlar esa koʻp hujayralidirlar (masalan, oʻrtacha odam 100 trillion yoki 1014 hujayradan iboratdir; oʻrtacha hujayra oʻlchami 10 mikrometr, massasi esa 1 nanogramdir). Eng katta hujayra tuyaqush tuxumi boʻlib, uzunligi 15 sm, massasi 1.4 kg gacha boʻladi. Hujayrani ilk marta Robert Xuk 1665-yilda kashf qilgan.",
        image: 'https://thumbs.dreamstime.com/z/human-cell-27673358.jpg',
        video: '',
      ),
    ],
    "Yer sayyorasi": [
      Section(
        title: 'Yer',
        model: 'Earth',
        info:
            "Yer — Quyosh sistemasidagi Quyoshdan uzoqligi jihatdan uchinchi (Merkuriy, Venera sayyoralaridan keyin) sayyora. U oʻz oʻqi atrofida va aylanaga juda yaqin boʻlgan elliptik orbita boʻyicha Quyosh atrofida aylanib turadi.",
        features: ['image'],
        fullInfo:
            "Yer — Quyosh sistemasidagi Quyoshdan uzoqligi jihatdan uchinchi (Merkuriy, Venera sayyoralaridan keyin) sayyora. U oʻz oʻqi atrofida va aylanaga juda yaqin boʻlgan elliptik orbita boʻyicha Quyosh atrofida aylanib turadi. Hajmi va massasi jihatidan Yer katta sayyoralar ichida (Yupiter, Saturn, Uran, Neptundan keyin) beshinchi oʻrinda. Yerda hayot borligi bilan u Quyosh sistemasidagi boshqa sayyoralardan farq qiladi. Biroq, hayot materiya taraqqiyotining tabiiy bosqichi boʻlganligi sababli Yerni koinotning hayot mavjud boʻlgan yagona. kosmik jismi, hayotning Yerdagi shakllarini esa mavjudotning yagona shakllari deb boʻlmaydi. Astronomik belgisi — ﬁ",
        image:
            'https://cdn.mos.cms.futurecdn.net/yCPyoZDQBBcXikqxkeW2jJ-1200-80.jpg',
        video: '',
      ),
    ],
    "Quyosh tizimi": [
      Section(
        title: 'Sayyoralar',
        model: 'Orbiting_solar_system',
        info:
            "Quyosh tizimi, Quyosh sistemasi — Quyoshning gravitatsion taʼsir maydoni ichida harakatlanuvchi osmon jismlari (Quyosh, sayyoralar, sayyoralarning yoʻldoshlari, kichik sayyoralar, kometalar, kosmik changlar) majmui.",
        features: ['video'],
        fullInfo:
            "Quyosh tizimi, Quyosh sistemasi — Quyoshning gravitatsion taʼsir maydoni ichida harakatlanuvchi osmon jismlari (Quyosh, sayyoralar, sayyoralarning yoʻldoshlari, kichik sayyoralar, kometalar, kosmik changlar) majmui. Quyosh tizimi chegarasining koʻrinma oʻlchami Pluton orbitasi (taxminan 40 a.b., q. Astronomik birlik) bilan aniqlansada, ammo uning haqiqiy chegarasi eng yaqin yulduzgacha (230 ming a.b. gacha) boʻlishi mumkin. Quyosh tizimining uzoq tashqi sohalari haqidagi maʼlumotlar Quyoshga yaqinlashuvchi uzun davrli kometalar va shu sistemani qoplagan kosmik changlarni kuza-tishdan olinadi. Quyosh tizimi hududidagi har qanday jism ham Quyosh tizimiga kiravermaydi. Quyoshning taʼsir doirasidagi har bir jismning Quyosh tizimiga kirishi uchun avvalo uning musbat kinetik va manfiy potensial energiyalarining yigʻindisi, yaʼni toʻla energiyasi manfiy boʻlishi kerak. Bundajism Quyoshningtortishish kuchini yenga olmay, Quyosh tizimi doirasida qoladi. Buning uchun Quyosh tizimiga tegishli jismlarga Quyoshning tortishish quchi taʼsiri boshqa yulduzlarnikiga nisba-tan ortiq boʻlishi kerak.",
        image: '',
        video: 'DMZ5WFRbSTc',
      ),
    ],
  };

  @override
  Future<void> onReady() async{
    super.onReady();
    subject = Get.arguments is List<String>
        ? (Get.arguments as List<String>).first
        : '';
    topic = Get.arguments is List<String>
        ? (Get.arguments as List<String>).last
        : '';
    await getSection(topic);
    debugPrint('${topic} ::::: ${sections.length}');
  }

  Future<void> getSection(String topicName) async {
    setLoading(true);
    await Future.delayed(
      const Duration(milliseconds: 1500),
          () async {
        sections = mapOfSections[topicName] ?? [];
        update();
      },
    );
    setLoading(false);
  }

}

class Section {
  final String title;
  final String info;
  final String fullInfo;
  final String image;
  final String video;
  final String model;
  final List<String> features;

  Section({
    required this.title,
    required this.model,
    required this.info,
    required this.features,
    required this.fullInfo,
    required this.image,
    required this.video,
  });
}
