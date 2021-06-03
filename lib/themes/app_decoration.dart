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

final selectedFoodSizeDecoration = BoxDecoration(
  color: AppColor.primary,
  borderRadius: BorderRadius.circular(sizeCardRadius),
  boxShadow: [
    BoxShadow(
      color: AppColor.primary,
      offset: Offset(0, 4),
      blurRadius: 6,
    ),
  ],
);

final unselectedFoodSizeDecoration = BoxDecoration(
  color: AppColor.surface,
  borderRadius: BorderRadius.circular(sizeCardRadius),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      offset: Offset(0, 4),
      blurRadius: 6,
    ),
  ],
);
