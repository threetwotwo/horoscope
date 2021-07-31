import 'package:flutter/foundation.dart';

enum Sign {
  Aries,
  Taurus,
  Gemini,
  Cancer,
  Leo,
  Virgo,
  Libra,
  Scorpio,
  Sagittarius,
  Capricorn,
  Aquarius,
  Pisces,
}

String signEmoji(Sign sign) {
  switch (sign) {
    case Sign.Aries:
      return '♈︎';
    case Sign.Taurus:
      return '♉︎︎';
    case Sign.Gemini:
      return '♊︎';
    case Sign.Cancer:
      return '♋︎';
    case Sign.Leo:
      return '♌︎';
    case Sign.Virgo:
      return '♍︎';
    case Sign.Libra:
      return '♎︎';
    case Sign.Scorpio:
      return '♏︎';
    case Sign.Sagittarius:
      return '♐︎';
    case Sign.Capricorn:
      return '♑︎';
    case Sign.Aquarius:
      return '♒︎';
    case Sign.Pisces:
      return '♓︎';
    default:
      return '';
  }
}

String signString(Sign sign) => describeEnum(sign).toLowerCase();
