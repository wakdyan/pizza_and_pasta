import 'package:flutter/material.dart';

import '../values/dimens.dart';
import 'app_color.dart';

final cardDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(cardRadius),
  color: AppColor.surface,
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      offset: Offset(0, 4),
      blurRadius: 6,
    ),
  ],
);

final selectedSizeDecoration = BoxDecoration(
  color: AppColor.primary,
  borderRadius: BorderRadius.circular(sizeCardRadius),
  boxShadow: [
    BoxShadow(
      color: AppColor.primary,
      offset: Offset(0, 0),
      blurRadius: 8,
      spreadRadius: 1,
    ),
  ],
);

final unselectedSizeDecoration = BoxDecoration(
  color: AppColor.surface,
  borderRadius: BorderRadius.circular(sizeCardRadius),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      offset: Offset(0, 0),
      blurRadius: 8,
      spreadRadius: 1,
    ),
  ],
);
