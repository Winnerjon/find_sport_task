
import 'package:find_sport_task/src/common/localization/localization.dart';

enum Words {
  languages, /// Tillar",
  chooseLanguage, /// Til tanlang",
  signUp, /// Ro'yxatdan o'tish",
  firstName, /// Ism",
  enterFirstName, /// Ismingizni kiriting",
  lastName, /// Familiya",
  enterLastName, /// Familiyangizni kiriting",
  phoneNumber, /// Telefon raqam",
  password, /// Parol",
  enterPassword, /// Parolingizni kiriting",
  confirmPassword, /// Parolni tasdiqlang",
  enterConfirmPassword, /// Tasdiqlash parolingizni kiriting",
  required, /// Kiritish shart",
  suitablePassword, /// Parol mos kelmadi",
  save, /// Saqlash",

  newAds, /// Yangi reklamalar",
  title, /// Sarlavha",
  enterProductTitle, /// Mahsulot nomini kiriting",
  description, /// Tavsif",
  enterDescription, /// Tavsifni kiriting",
  changeLocation, /// Joylashuvni o'zgartirish",
  addressLocation, /// Manzil bo'yicha",
  enterMapAddress, /// Xarita manzilini kiriting"
} extension TextKeys on Words {
  String get text => toString().split(".")[1];

  String translate() {
    return AppLocalization.tr(text);
  }
}