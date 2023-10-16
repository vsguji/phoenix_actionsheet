import 'package:flutter/material.dart';
import 'package:phoenix_actionsheet/phoenix_actionsheet.dart';
import 'package:phoenix_base/phoenix.dart';
import 'package:phoenix_btn/phoenix_btn.dart';
import 'package:phoenix_dialog/phoenix_dialog.dart';
import 'package:phoenix_navbar/phoenix_navbar.dart';
import 'package:phoenix_toast/phoenix_toast.dart';

class SelectedListActionSheetExamplePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>
      SelectedListActionSheetExamplePageState();
}

class SelectedListActionSheetExamplePageState
    extends State<SelectedListActionSheetExamplePage> {
  late SelectedListActionSheetController controller;
  final List<String> _data = [
    '1. 可以只指定要显示的文案，后边的 delete icon 是组件自带',
    '2. delete icon 可以控制全部显示或者隐藏，但不支持某一行独立控制',
    '3. 每一行的视图支持完全自定义',
    '4. 如果要刷新列表，请调用 controller 调用 reloadData() 方法 ',
    '5. 该例子中，点击最后一行的删除图表，可以更新当前行的文案'
  ];

  @override
  void initState() {
    controller = SelectedListActionSheetController();
    super.initState();
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// 要拦截 Android 的系统返回行为，请务必自行添加以下 WillPopScope 逻辑
    return WillPopScope(
      onWillPop: () async {
        if (!controller.isHidden) {
          controller.dismiss();
          return false;
        }
        return true;
      },
      child: Scaffold(
          appBar: PhoenixAppBar(
            title: '已选菜单列表',
          ),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                BottomButtonPanel(
                    mainButtonName: 'BrnBottomButtonPanel',
                    mainButtonOnTap: () {
                      PhoenixToast.show(
                          '确定！sheet 的数据源长度 ${_data.length}', context);
                    },
                    iconButtonList: [
                      VerticalIconButton(
                          name: '已选(${_data.length})',
                          iconWidget: PhoenixTools.getAssetImage(
                              'icons/grey_place_holder.png'),
                          onTap: () {
                            if (!controller.isHidden) {
                              controller.dismiss();
                            } else {
                              if (_data.length <= 0) {
                                PhoenixToast.show('数据为空，弹窗不展示', context);
                                return;
                              }
                              SelectedListActionSheet<String>(
                                  context: context,
                                  isClearButtonHidden: false,
                                  isDeleteButtonHidden: false,
                                  items: _data,
                                  bottomOffset: 82,
                                  controller: controller,
                                  title: '已选标题，优先级没有titleWidget高',
                                  titleWidget: Container(
                                    color: Colors.blueGrey,
                                    child: const Center(
                                      child: Text(
                                        '自定义的视图',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                  itemTitleBuilder:
                                      (int index, String? entity) {
                                    return entity;
                                  },
                                  onClear: () {
                                    controller.dismiss();
                                    // 自定义清空的操作，可以不实现，会走默认的清空操作。
                                    DialogManager.showConfirmDialog(context,
                                        title: "确定要清空已选列表吗?",
                                        cancel: '取消',
                                        confirm: '确定', onConfirm: () {
                                      setState(() {});
                                      _data.clear();
                                    }, onCancel: () {});
                                  },
                                  onClearCanceled: () {
                                    PhoenixToast.show("取消!!!!", context);
                                  },
                                  onClearConfirmed: () {
                                    setState(() {});
                                    PhoenixToast.show("确定!!!!", context);
                                  },
                                  onListDismissed:
                                      (bool isClosedByClearButton) {
                                    PhoenixToast.show(
                                        "消失了!!!!$isClosedByClearButton",
                                        context);
                                  },
                                  onListShowed: () {
                                    PhoenixToast.show("显示了哦~~", context);
                                  },
                                  onItemDelete: (int idx, String? entity) {
                                    _data[idx] = '$idx 变化了哈';
                                    controller.reloadData();
                                    PhoenixToast.show("$idx 奇数行无法删除", context);
                                    return true;
                                  }).show();
                            }
                          })
                    ]),
              ],
            ),
          )),
    );
  }
}
