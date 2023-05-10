import 'package:jiffy/jiffy.dart';
import 'package:intl/intl.dart';
import 'package:mapalus_pos_2/app/widgets/time_span_picker.dart';

extension IntegerExtension on int {
  static const String keyFree = 'gratis';

  String formatNumberToCurrency({bool canBeFree = false}) {
    int number = this;
    if (number <= 0) {
      number = 0;
    }
    if (number == 0) {
      if (canBeFree) {
        return keyFree;
      }
      return "";
    }
    var f = NumberFormat('#,###');
    var s = "Rp. ${f.format(number)}".replaceAll(",", ".");
    return s;
  }
}

extension StringExtension on String {
  static const String keyFree = 'gratis';

  double formatCurrencyToNumber() {
    String currencyNumber = this;
    if (currencyNumber.toLowerCase() == keyFree) {
      return 0;
    }
    if (currencyNumber == "-") {
      return 0;
    }
    var string = currencyNumber.replaceAll("Rp. ", "");
    var safe = string.replaceAll(".", "");
    return double.parse(safe);
  }

//   String cleanPhone({bool useCountryCode = false}) {
//     trim();
//     if (useCountryCode) {
//       return startsWith("0") ? replaceFirst('0', '+62') : this;
//     }
//     return contains('+62') ? replaceFirst('+62', '0') : this;
//   }
//
//   bool statusStringToBool(){
//     return !toLowerCase().contains("belum");
//   }
//
//   String toTitleCase(){
//
//     if (length <= 1) {
//       return toUpperCase();
//     }
//
//     // Split string into multiple words
//     final List<String> words = split(' ');
//
//     // Capitalize first letter of each words
//     final capitalizedWords = words.map((word) {
//       if (word.trim().isNotEmpty) {
//         final String firstLetter = word.trim().substring(0, 1).toUpperCase();
//         final String remainingLetters = word.trim().substring(1);
//
//         return '$firstLetter$remainingLetters';
//       }
//       return '';
//     });
//
//     // Join/Merge all words back to one String
//     return capitalizedWords.join(' ');
//   }
//
  String get toInitials {
    List<String> names = split(" ");
    String initials = "";
    int numWords = 2;

    if (numWords < names.length) {
      numWords = names.length;
    }
    for (var i = 0; i < numWords; i++) {
      initials += names[i][0];
    }
    return initials;
  }
}

//
//   String toBIPRA({bool abbreviate = true}){
//
//     if (!abbreviate) {
//       if (toLowerCase() == "jemaat") {
//         return "";
//       }
//       if (toLowerCase() == "pkb") {
//         return "Pria / Kaum Bapa";
//       }
//       if (toLowerCase() == "wki") {
//         return "Wanita / Kaum Ibu";
//       }
//       if (toLowerCase() == "pemuda") {
//         return "Pemuda";
//       }
//       if (toLowerCase() == "remaja") {
//         return "Remaja";
//       }
//       if (toLowerCase() == "asm" || toLowerCase() == "anak") {
//         return "Anak Sekolah Minggu";
//       }
//     }
//
//     if (toLowerCase() == "jemaat") {
//       return "JEMAAT";
//     }
//     if (toLowerCase().contains("pria")) {
//       return "PKB";
//     }
//     if (toLowerCase().contains("wanita")) {
//       return "WKI";
//     }
//     if (toLowerCase().contains("pemuda")) {
//       return "PEMUDA";
//     }
//     if (toLowerCase().contains("remaja")) {
//       return "REMAJA";
//     }
//     if (toLowerCase().contains("anak")) {
//       return "ASM";
//     }
//     throw Exception( "Invalid BIPRA conversion $this");
//   }
// }
//
// extension BooleanExtension on bool {
//   String statusBoolToString(String actionName){
//     return this ? actionName : "Belum $actionName";
//   }
// }
//

extension DateTimeExtension on DateTime {
  String get toDayEEEE {
    return Jiffy.parseFromDateTime(this).format(pattern: "EEEE");
  }

  String get toMonthM {
    return Jiffy.parseFromDateTime(this).format(pattern: "M");
  }

  String get toMonthMMM {
    return Jiffy.parseFromDateTime(this).format(pattern: "MMM");
  }

  String get toMonthMMMM {
    return Jiffy.parseFromDateTime(this).format(pattern: "MMMM");
  }

  String get toTimeHHmm {
    return Jiffy.parseFromDateTime(this).format(pattern: "HH:mm");
  }

  String get toYeary {
    return Jiffy.parseFromDateTime(this).format(pattern: "y");
  }

  String get toDated {
    return Jiffy.parseFromDateTime(this).format(pattern: "d");
  }

  String format(String format) {
    return Jiffy.parseFromDateTime(this).format(pattern: format);
  }


  DateTime resetTimeOfTheDay({bool start = true}) {
    final j = Jiffy.parseFromDateTime(this);
    return start ? j.startOf(Unit.day).dateTime : j.endOf(Unit.day).dateTime;
  }

  DateTime resetTimeOfTheWeek({bool start = true}) {
    final j = Jiffy.parseFromDateTime(this);
    return start ? j.startOf(Unit.week).dateTime : j.endOf(Unit.week).dateTime;
  }

  DateTime resetTimeOfTheMonth({bool start = true}) {
    final j = Jiffy.parseFromDateTime(this);
    return start
        ? j.startOf(Unit.month).dateTime
        : j.endOf(Unit.month).dateTime;
  }

  DateTime resetTimeOfTheYear({bool start = true}) {
    final j = Jiffy.parseFromDateTime(this);
    return start ? j.startOf(Unit.year).dateTime : j.endOf(Unit.year).dateTime;
  }

  String fromNowHumanReadable() {
    final now = Jiffy.now();
    final comparison = Jiffy.parseFromDateTime(this);

    if (comparison.diff(now, unit: Unit.minute) < 60 &&
        comparison.diff(now, unit: Unit.minute) > 15) {
      return "±1 jam lagi";
    }
    if (comparison.diff(now, unit: Unit.minute) <= 15 &&
        comparison.diff(now, unit: Unit.minute) > -15) {
      return "Saat ini";
    }
    if (comparison.diff(now, unit: Unit.minute) >= -15 &&
        comparison.diff(now, unit: Unit.minute) < -60) {
      return "±1 jam lalu";
    }
    String result = Jiffy.parseFromDateTime(this).fromNow();
    if (result.contains("yang")) {
      result = result.replaceAll("yang ", '');
    }
    if (result.contains("dalam")) {
      result = "${result.replaceAll("dalam ", "")} lagi";
    }

    return result;
  }
}
//
// extension ListExtension on List<String>{
//   bool equal(List<String> otherList) {
//     if (length != otherList.length) {
//       return false;
//     }
//
//     for (int i = 0; i < length; i++) {
//       if (this[i] != otherList[i]) {
//         return false;
//       }
//     }
//
//     return true;
//   }

extension EnumTranslatedName on Enum {
  String get timeSpanSelectionTranslatedName {
    if (runtimeType != TimeSpanPickerSelection) {
      throw (Exception("TimeSpanPickerSelection enum only"));
    }
    final e = this as TimeSpanPickerSelection;
    switch (e) {
      case TimeSpanPickerSelection.thisDay:
        return "Hari ini";
      case TimeSpanPickerSelection.thisWeek:
        return "Minggu ini";
      case TimeSpanPickerSelection.thisMonth:
        return "Bulan ini";
      case TimeSpanPickerSelection.thisYear:
        return "Tahun ini";
      case TimeSpanPickerSelection.custom:
        return "Pilih lingkup tanggal";
    }
  }
}
