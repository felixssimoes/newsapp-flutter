import 'package:flutter/material.dart';

const _poppinsFamilyStyle = TextStyle(
  fontFamily: 'Poppins',
  fontStyle: FontStyle.normal,
);

const _ibmPlexSerifStyle = TextStyle(
  fontFamily: 'IbmPlexSerif',
  fontStyle: FontStyle.normal,
);

class TextStyles {
  TextStyles._();

  static final ibmPlexSerifBold = _ibmPlexSerifStyle.copyWith(
    fontWeight: FontWeight.w700,
  );
  static final ibmPlexSerifSemiBold = _ibmPlexSerifStyle.copyWith(
    fontWeight: FontWeight.w600,
  );
  static final ibmPlexSerifRegular = _ibmPlexSerifStyle.copyWith(
    fontWeight: FontWeight.w400,
  );

  static final poppinsRegular = _poppinsFamilyStyle.copyWith(
    fontWeight: FontWeight.w400,
  );
  static final poppinsItalic = _poppinsFamilyStyle.copyWith(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
  );
  static final poppinsMedium = _poppinsFamilyStyle.copyWith(
    fontWeight: FontWeight.w500,
  );
  static final poppinsBold = _poppinsFamilyStyle.copyWith(
    fontWeight: FontWeight.w700,
  );
}
