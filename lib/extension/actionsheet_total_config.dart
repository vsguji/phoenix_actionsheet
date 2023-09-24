/*
 * @Author: lipeng 1162423147@qq.com
 * @Date: 2023-09-24 18:40:26
 * @LastEditors: lipeng 1162423147@qq.com
 * @LastEditTime: 2023-09-24 18:46:00
 * @FilePath: /phoenix_actionsheet/lib/extension/actionsheet_total_config.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:phoenix_base/phoenix.dart';

import '../config/action_sheet_config.dart';
import 'actionsheet_default_config_utils.dart';

class ActionSheetTotalConfig extends BaseTotalConfig {
  ActionSheetTotalConfig({ActionSheetConfig? actionSheetConfig})
      : _actionSheetConfig = actionSheetConfig;

  ActionSheetConfig? _actionSheetConfig;

  ActionSheetConfig get actionSheetConfig =>
      _actionSheetConfig ?? BaseActionSheetConfigUtils.defaultActionSheetConfig;

  @override
  void initThemeConfig(String configId) {
    super.initThemeConfig(configId);
    _actionSheetConfig ??= ActionSheetConfig();
    actionSheetConfig.initThemeConfig(
      configId,
      currentLevelCommonConfig: commonConfig,
    );
  }
}

extension BaseActionSheetTotalConfig on BaseTotalConfig {
  static ActionSheetConfig? _actionSheetConfig;
  ActionSheetConfig get actionSheetConfig =>
      _actionSheetConfig ?? BaseActionSheetConfigUtils.defaultActionSheetConfig;
  set actionSheetTotalConfig(ActionSheetTotalConfig config) {
    _actionSheetConfig = config.actionSheetConfig;
  }
}
