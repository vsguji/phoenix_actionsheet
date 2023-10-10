import 'package:flutter/material.dart';
import 'package:phoenix_base/phoenix.dart';

import '../config/action_sheet_config.dart';

///
extension BaseActionSheetConfigUtils on BaseDefaultConfigUtils {
  ///
  static ActionSheetConfig defaultActionSheetConfig = ActionSheetConfig(
    topRadius: BaseDefaultConfigUtils.defaultCommonConfig.radiusLg,
    titleStyle: BaseTextStyle(
      color: BaseDefaultConfigUtils.defaultCommonConfig.colorTextSecondary,
      fontSize: BaseDefaultConfigUtils.defaultCommonConfig.fontSizeBase,
    ),
    itemTitleStyle: BaseTextStyle(
      color: BaseDefaultConfigUtils.defaultCommonConfig.colorTextBase,
      fontSize: BaseDefaultConfigUtils.defaultCommonConfig.fontSizeSubHead,
      fontWeight: FontWeight.w600,
    ),
    itemTitleStyleLink: BaseTextStyle(
      fontSize: BaseDefaultConfigUtils.defaultCommonConfig.fontSizeSubHead,
      fontWeight: FontWeight.w600,
      color: BaseDefaultConfigUtils.defaultCommonConfig.colorLink,
    ),
    itemTitleStyleAlert: BaseTextStyle(
      color: BaseDefaultConfigUtils.defaultCommonConfig.brandError,
      fontSize: BaseDefaultConfigUtils.defaultCommonConfig.fontSizeSubHead,
      fontWeight: FontWeight.w600,
    ),
    itemDescStyle: BaseTextStyle(
      color: BaseDefaultConfigUtils.defaultCommonConfig.colorTextBase,
      fontSize: BaseDefaultConfigUtils.defaultCommonConfig.fontSizeCaption,
      fontWeight: FontWeight.w600,
    ),
    itemDescStyleLink: BaseTextStyle(
      color: BaseDefaultConfigUtils.defaultCommonConfig.colorLink,
      fontSize: BaseDefaultConfigUtils.defaultCommonConfig.fontSizeCaption,
      fontWeight: FontWeight.w600,
    ),
    itemDescStyleAlert: BaseTextStyle(
      color: BaseDefaultConfigUtils.defaultCommonConfig.brandError,
      fontSize: BaseDefaultConfigUtils.defaultCommonConfig.fontSizeCaption,
      fontWeight: FontWeight.w600,
    ),
    cancelStyle: BaseTextStyle(
      color: BaseDefaultConfigUtils.defaultCommonConfig.colorTextBase,
      fontSize: BaseDefaultConfigUtils.defaultCommonConfig.fontSizeSubHead,
      fontWeight: FontWeight.w600,
    ),
    titlePadding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 16.0),
    contentPadding:
        const EdgeInsets.symmetric(horizontal: 60.0, vertical: 12.0),
  );
}
