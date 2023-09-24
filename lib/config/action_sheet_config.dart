import 'package:flutter/material.dart';
import 'package:phoenix_base/phoenix.dart';

/// BrnActionSheet 主题配置
class ActionSheetConfig extends BaseConfig {
  /// 遵循外部主题配置
  /// 默认为 [BrnDefaultConfigUtils.defaultActionSheetConfig]
  ActionSheetConfig({
    BaseTextStyle? titleStyle,
    BaseTextStyle? itemTitleStyle,
    BaseTextStyle? itemTitleStyleLink,
    BaseTextStyle? itemTitleStyleAlert,
    BaseTextStyle? itemDescStyle,
    BaseTextStyle? itemDescStyleLink,
    BaseTextStyle? itemDescStyleAlert,
    BaseTextStyle? cancelStyle,
    double? topRadius,
    EdgeInsets? contentPadding,
    EdgeInsets? titlePadding,
    String configId = GLOBAL_CONFIG_ID,
  })  : _titleStyle = titleStyle,
        _itemTitleStyle = itemTitleStyle,
        _itemTitleStyleLink = itemTitleStyleLink,
        _itemTitleStyleAlert = itemTitleStyleAlert,
        _itemDescStyle = itemDescStyle,
        _itemDescStyleLink = itemDescStyleLink,
        _itemDescStyleAlert = itemDescStyleAlert,
        _cancelStyle = cancelStyle,
        _topRadius = topRadius,
        _contentPadding = contentPadding,
        _titlePadding = titlePadding,
        super(configId: configId);

  /// ActionSheet 的顶部圆角
  /// 默认值为 [BrnCommonConfig.radiusLg]
  double? _topRadius;

  /// 标题样式
  ///
  /// BaseTextStyle(
  ///   color: [BrnCommonConfig.colorTextSecondary],
  ///   fontSize: [BrnCommonConfig.fontSizeBase],
  /// )
  BaseTextStyle? _titleStyle;

  /// 元素标题默认样式
  ///
  /// BaseTextStyle(
  ///   color: [BrnCommonConfig.colorTextBase],
  ///   fontSize:[BrnCommonConfig.fontSizeSubHead],
  /// )
  BaseTextStyle? _itemTitleStyle;

  /// 元素标题链接样式
  ///
  /// BaseTextStyle(
  ///   color: [BrnCommonConfig.colorLink],
  ///   fontSize: [BrnCommonConfig.fontSizeSubHead],
  ///   fontWeight: FontWeight.w600,
  /// )
  BaseTextStyle? _itemTitleStyleLink;

  /// 元素警示项标题样式
  ///
  /// BaseTextStyle(
  ///   color: [BrnCommonConfig.brandError],
  ///   fontSize: [BrnCommonConfig.fontSizeBase],
  ///   fontWeight: FontWeight.w600,
  /// )
  BaseTextStyle? _itemTitleStyleAlert;

  /// 元素描述默认样式
  ///
  /// BaseTextStyle(
  ///   color: [BrnCommonConfig.colorTextBase],
  ///   fontSize: [BrnCommonConfig.fontSizeCaption],
  ///   fontWeight: FontWeight.w600,
  /// )
  BaseTextStyle? _itemDescStyle;

  /// 元素标题描述链接样式
  ///
  /// BaseTextStyle(
  ///   color: [BrnCommonConfig.colorLink],
  ///   fontSize: [BrnCommonConfig.fontSizeCaption],
  ///   fontWeight: FontWeight.w600,
  /// )
  BaseTextStyle? _itemDescStyleLink;

  /// 元素警示项标题描述样式
  ///
  /// BaseTextStyle(
  ///   color: [BrnCommonConfig.brandError],
  ///   fontSize: [BrnCommonConfig.fontSizeCaption],
  ///   fontWeight: FontWeight.w600,
  /// )
  BaseTextStyle? _itemDescStyleAlert;

  /// 取消按钮样式
  ///
  /// BaseTextStyle(
  ///   color: [BrnCommonConfig.colorTextBase],
  ///   fontSize: [BrnCommonConfig.fontSizeSubHead],
  ///   fontWeight: FontWeight.w600,
  /// )
  BaseTextStyle? _cancelStyle;

  /// 内容左右间距
  ///
  /// EdgeInsets.symmetric(horizontal: 60, vertical: 12)
  EdgeInsets? _contentPadding;

  /// 标题左右间距
  ///
  /// EdgeInsets.symmetric(horizontal: 60, vertical: 16)
  EdgeInsets? _titlePadding;

  double get topRadius =>
      _topRadius ?? BrnDefaultConfigUtils.defaultActionSheetConfig.topRadius;

  BaseTextStyle get titleStyle =>
      _titleStyle ?? BrnDefaultConfigUtils.defaultActionSheetConfig.titleStyle;

  BaseTextStyle get itemTitleStyle =>
      _itemTitleStyle ??
      BrnDefaultConfigUtils.defaultActionSheetConfig.itemTitleStyle;

  BaseTextStyle get itemTitleStyleLink =>
      _itemTitleStyleLink ??
      BrnDefaultConfigUtils.defaultActionSheetConfig.itemTitleStyleLink;

  BaseTextStyle get itemTitleStyleAlert =>
      _itemTitleStyleAlert ??
      BrnDefaultConfigUtils.defaultActionSheetConfig.itemTitleStyleAlert;

  BaseTextStyle get itemDescStyle =>
      _itemDescStyle ??
      BrnDefaultConfigUtils.defaultActionSheetConfig.itemDescStyle;

  BaseTextStyle get itemDescStyleLink =>
      _itemDescStyleLink ??
      BrnDefaultConfigUtils.defaultActionSheetConfig.itemDescStyleLink;

  BaseTextStyle get itemDescStyleAlert =>
      _itemDescStyleAlert ??
      BrnDefaultConfigUtils.defaultActionSheetConfig.itemDescStyleAlert;

  BaseTextStyle get cancelStyle =>
      _cancelStyle ??
      BrnDefaultConfigUtils.defaultActionSheetConfig.cancelStyle;

  EdgeInsets get contentPadding =>
      _contentPadding ??
      BrnDefaultConfigUtils.defaultActionSheetConfig.contentPadding;

  EdgeInsets get titlePadding =>
      _titlePadding ??
      BrnDefaultConfigUtils.defaultActionSheetConfig.titlePadding;

  @override
  void initThemeConfig(
    String configId, {
    BaseCommonConfig? currentLevelCommonConfig,
  }) {
    super.initThemeConfig(
      configId,
      currentLevelCommonConfig: currentLevelCommonConfig,
    );

    /// 用户全局组件配置
    ActionSheetConfig actionSheetConfig = BaseThemeConfig.instance
        .getConfig(configId: configId)
        .actionSheetConfig;

    _titlePadding ??= actionSheetConfig.titlePadding;
    _contentPadding ??= actionSheetConfig.contentPadding;
    _titleStyle = actionSheetConfig.titleStyle.merge(
      BaseTextStyle(
        color: commonConfig.colorTextSecondary,
        fontSize: commonConfig.fontSizeBase,
      ).merge(_titleStyle),
    );
    _itemTitleStyle = actionSheetConfig.itemTitleStyle.merge(
      BaseTextStyle(
        color: commonConfig.colorTextBase,
        fontSize: commonConfig.fontSizeSubHead,
      ).merge(_itemTitleStyle),
    );
    _itemTitleStyleLink = actionSheetConfig.itemTitleStyleLink.merge(
      BaseTextStyle(
        color: commonConfig.colorLink,
        fontSize: commonConfig.fontSizeSubHead,
      ).merge(_itemTitleStyleLink),
    );
    _itemTitleStyleAlert = actionSheetConfig.itemTitleStyleAlert.merge(
      BaseTextStyle(
        color: commonConfig.brandError,
        fontSize: commonConfig.fontSizeBase,
      ).merge(_itemTitleStyleAlert),
    );
    _itemDescStyle = actionSheetConfig.itemDescStyle.merge(
      BaseTextStyle(
        color: commonConfig.colorTextBase,
        fontSize: commonConfig.fontSizeCaption,
      ).merge(_itemDescStyle),
    );
    _itemDescStyleLink = actionSheetConfig.itemDescStyleLink.merge(
      BaseTextStyle(
        color: commonConfig.colorLink,
        fontSize: commonConfig.fontSizeCaption,
      ).merge(_itemDescStyleLink),
    );
    _itemDescStyleAlert = actionSheetConfig.itemDescStyleAlert.merge(
      BaseTextStyle(
        color: commonConfig.brandError,
        fontSize: commonConfig.fontSizeCaption,
      ).merge(_itemDescStyleAlert),
    );
    _cancelStyle = actionSheetConfig.cancelStyle.merge(
      BaseTextStyle(
        color: commonConfig.colorTextBase,
        fontSize: commonConfig.fontSizeSubHead,
      ).merge(_cancelStyle),
    );
    _topRadius ??= commonConfig.radiusLg;
  }

  ActionSheetConfig copyWith({
    double? topRadius,
    BaseTextStyle? titleStyle,
    BaseTextStyle? itemTitleStyle,
    BaseTextStyle? itemTitleStyleLink,
    BaseTextStyle? itemTitleStyleAlert,
    BaseTextStyle? itemDescStyle,
    BaseTextStyle? itemDescStyleLink,
    BaseTextStyle? itemDescStyleAlert,
    BaseTextStyle? cancelStyle,
    EdgeInsets? contentPadding,
    EdgeInsets? titlePadding,
  }) {
    return ActionSheetConfig(
      titleStyle: titleStyle ?? _titleStyle,
      itemTitleStyle: itemTitleStyle ?? _itemTitleStyle,
      itemTitleStyleLink: itemTitleStyleLink ?? _itemTitleStyleLink,
      itemTitleStyleAlert: itemTitleStyleAlert ?? _itemTitleStyleAlert,
      itemDescStyle: itemDescStyle ?? _itemDescStyle,
      itemDescStyleLink: itemDescStyleLink ?? _itemDescStyleLink,
      itemDescStyleAlert: itemDescStyleAlert ?? _itemDescStyleAlert,
      cancelStyle: cancelStyle ?? _cancelStyle,
      topRadius: topRadius ?? _topRadius,
      contentPadding: contentPadding ?? _contentPadding,
      titlePadding: titlePadding ?? _titlePadding,
    );
  }

  ActionSheetConfig merge(ActionSheetConfig? other) {
    if (other == null) return this;
    return copyWith(
      titleStyle: titleStyle.merge(other._titleStyle),
      itemTitleStyle: itemTitleStyle.merge(other._itemTitleStyle),
      itemTitleStyleLink: itemTitleStyleLink.merge(other._itemTitleStyleLink),
      itemTitleStyleAlert:
          itemTitleStyleAlert.merge(other._itemTitleStyleAlert),
      itemDescStyle: itemDescStyle.merge(other._itemDescStyle),
      itemDescStyleLink: itemDescStyleLink.merge(other._itemDescStyleLink),
      itemDescStyleAlert: itemDescStyleAlert.merge(other._itemDescStyleAlert),
      cancelStyle: cancelStyle.merge(other._cancelStyle),
      topRadius: other._topRadius,
      contentPadding: other._contentPadding,
      titlePadding: other._titlePadding,
    );
  }
}
