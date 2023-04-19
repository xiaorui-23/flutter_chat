
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:chat_flutter/utils/chat_view_item_record_body_type/chat_view_item_record_body_type.dart';
import 'package:chat_flutter/utils/screenutil/screenutil.dart';
import 'package:chat_flutter/widgets/audio_box/audio_box.dart';
import 'package:chat_flutter/widgets/custom_selection_area/custom_selection_area.dart';

/// 内容主体
class ChatViewItemRecordBody extends StatelessWidget {
    
    /// 内容
    final dynamic itemBody;
    /// 自定义记录 item 主体
    final Widget? customItem;
    /// 记录时间
    final String? itemBodyRecordTime;
    /// 当前记录内容类型
    final ChatViewItemRecordBodyType itemBodyType;
    /// 背景色
    final Color backgroundColor;
    /// 是否为 右侧 己方
    final bool senderRight;
    /// 是否打开长按文字菜单
    final bool isOpenTextSelect;
    /// 记录主体的文字样式
    final TextStyle? itemBodyTextStyle;
    /// 音频时长
    final int audioTimelength;
    /// 播放状态
    final bool audioPlayStatus;
    /// 文本选择控制器
    final TextSelectionControls? selectionControls;
    /// 自定义时间记录 widget
    final Widget? customRecordTimeWidget;
    /// 自定义时间记录样式
    final TextStyle? customRecordTimeStyle;
    /// 长按文字菜单选择回调
    final Function(SelectedContent?)? onSelectionChanged;
    /// 内容主体点击事件
    final Function()? itemBodyTap;
    /// SelectableText 创建时
    final Function(FocusNode focusNode)? createSelectableTextCallback;
    /// 文件、图片、音频 点击事件
    final Function(ChatViewItemRecordBodyType type)? itemBodyMediaTap;
    /// 显示的工具菜单
    final Widget Function(BuildContext, SelectableRegionState)? contextMenuBuilder;

    ChatViewItemRecordBody({
        super.key,
        this.senderRight = true,
        this.itemBodyType = ChatViewItemRecordBodyType.text,
        this.backgroundColor = Colors.white,
        this.itemBody,
        this.itemBodyTextStyle,
        this.itemBodyTap,
        this.itemBodyMediaTap,
        this.selectionControls,
        this.isOpenTextSelect = false,
        this.onSelectionChanged,
        this.contextMenuBuilder,
        this.audioTimelength = 0,
        this.audioPlayStatus = false,
        this.itemBodyRecordTime,
        this.createSelectableTextCallback,
        this.customItem,
        this.customRecordTimeWidget,
        this.customRecordTimeStyle
    });

    
    /// 图片加载失败状态
    bool _imageLoadFailStatus = false;

    @override
    Widget build(BuildContext context) {
        return StatefulBuilder(
            builder: (context, setState) {
                return Container(
                    padding: EdgeInsets.only(
                        top: sh(10),
                        bottom: sh(10)
                    ),
                    child: Stack(
                        children: [
                            Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                    Container(
                                        margin: EdgeInsets.only(
                                            right: sw(senderRight ? 23 : 0),
                                            left: sw(!senderRight ? 23 : 0)
                                        ),
                                        constraints: BoxConstraints(
                                            minHeight: sh(45),
                                        ),
                                        child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: senderRight ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                                // 记录时间
                                                if (customRecordTimeWidget != null) customRecordTimeWidget!,
                                                if(itemBodyRecordTime != null)
                                                    Container(
                                                        width: sw(235),
                                                        margin: EdgeInsets.only(
                                                            top: sh(10),
                                                            bottom: sh(10)
                                                        ),
                                                        alignment: Alignment.center,
                                                        child: Text(
                                                            itemBodyRecordTime!,
                                                            textAlign: TextAlign.center,
                                                            style: customRecordTimeStyle ?? TextStyle(
                                                                fontSize: sf(14),
                                                                color: const Color.fromARGB(255, 183, 182, 182)
                                                            ),
                                                        ),
                                                    ),
                                                // 内容主体
                                                customItem ?? Container(
                                                    constraints: BoxConstraints(
                                                        maxWidth: sw(230),
                                                    ),
                                                    decoration: excludeContentType(itemBodyType) && !_imageLoadFailStatus ? null : BoxDecoration(
                                                        color: backgroundColor,
                                                        borderRadius: BorderRadius.all(Radius.circular(sr(10))) 
                                                    ),
                                                    padding: excludeContentType(itemBodyType) && !_imageLoadFailStatus ? null :  EdgeInsets.only(
                                                        left: sw(10),
                                                        right: sw(10),
                                                        top: sh(13),
                                                        bottom: sh(13)
                                                    ),
                                                    child: GestureDetector(
                                                        onTap: itemBodyTap,
                                                        child: isOpenTextSelect && itemBodyType == ChatViewItemRecordBodyType.text ? CustomSelectionArea(
                                                            itemBodyTextStyle: itemBodyTextStyle,
                                                            onSelectionChanged: onSelectionChanged,
                                                            contextMenuBuilder: contextMenuBuilder,
                                                            selectionControls: selectionControls,
                                                            createSelectableTextCallback: createSelectableTextCallback,
                                                            child: _typeHandlerWidget(
                                                                onImageError: (exception, stackTrace) {
                                                                    setState(() {});
                                                                },
                                                            ),
                                                        ) : _typeHandlerWidget(
                                                            onImageError: (exception, stackTrace) {
                                                                setState(() {});
                                                            },
                                                        )
                                                    ),
                                                ),
                                                // 
                                            ],
                                        ),
                                    ),
                                ],
                            ),
                            // 箭头图标
                            if (customItem == null && (!excludeContentType(itemBodyType) || _imageLoadFailStatus))
                                Positioned(
                                    top: sh(itemBodyRecordTime == null ? 10 : 45),
                                    right: senderRight ? 0 : null,
                                    left: !senderRight ? 0 : null,
                                    child: Container(
                                        decoration: BoxDecoration(
                                            border:  Border(
                                                bottom: BorderSide(
                                                    width: sw(12),
                                                    color: Colors.transparent,
                                                ),
                                                top: BorderSide(
                                                    width: sw(12),
                                                    color: Colors.transparent,
                                                ),
                                                left: BorderSide(
                                                    width: sw(12),
                                                    color: senderRight ? backgroundColor : Colors.transparent,
                                                ),
                                                right: BorderSide(
                                                    width: sw(12),
                                                    color: !senderRight ? backgroundColor : Colors.transparent,
                                                )
                                            )
                                        ),
                                    )
                                ),
                            // 
                        ],
                    ),
                );
            }
        );
    }

    /// 根据 记录类型返回对应 widget
    Widget _typeHandlerWidget ({Function(Object exception, StackTrace? stackTrace)? onImageError}) {
        // 图片
        if (itemBodyType == ChatViewItemRecordBodyType.image) {

            Widget container = StatefulBuilder(
                builder: (context, setState) {

                    return Container(
                        width: _imageLoadFailStatus ? null : sz(200),
                        height: _imageLoadFailStatus ? null : sz(200),
                        decoration: BoxDecoration(
                            image: !_imageLoadFailStatus ? DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage('$itemBody'),
                                onError: (exception, stackTrace) {
                                    
                                    _imageLoadFailStatus = true;

                                    if (onImageError != null){
                                        onImageError(exception, stackTrace);
                                    }
                                    
                                    setState((){});
                                },
                            ) : null
                        ),
                        child: _imageLoadFailStatus ? Text(
                            '图片加载失败...',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: sf(15),
                                color: Colors.black
                            ),
                        ) : null,
                    );
                }
            );

            return GestureDetector(
                onTap: () {
                    if (itemBodyMediaTap != null){
                        itemBodyMediaTap!(ChatViewItemRecordBodyType.image);
                    }
                },
                child: container,
            );
        }
        // 文件
        else if (itemBodyType == ChatViewItemRecordBodyType.file) {
            return GestureDetector(
                onTap: () {
                    if (itemBodyMediaTap != null){
                        itemBodyMediaTap!(ChatViewItemRecordBodyType.file);
                    }
                },
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                        // 图标
                        Icon(
                            Icons.file_open,
                            color: const Color(0xff1989fa),
                            size: sf(20),
                        ),
                        // 文字描述
                        Container(
                            constraints: BoxConstraints(
                                maxWidth: sw(150)
                            ),
                            margin: EdgeInsets.only(
                                left: sw(10)
                            ),
                            child: Text(
                                '${itemBody ?? ""}',
                                softWrap: true,
                                style: itemBodyTextStyle ?? TextStyle (
                                    color: const Color(0xff1989fa),
                                    fontSize: sf(16)
                                ),
                            )
                        ),
                    ],
                ),
            );
        }
        // 音频
        else if (itemBodyType == ChatViewItemRecordBodyType.audio) {
            return GestureDetector(
                onTap: () {
                    if (itemBodyMediaTap != null){
                        itemBodyMediaTap!(ChatViewItemRecordBodyType.audio);
                    }
                },
                child: AudioBox(
                    audioTimelength: audioTimelength,
                    audioPlayStatus: audioPlayStatus,
                ),
            );
        }
        // 文字
        else {
            return Text(
                '$itemBody',
                textAlign: TextAlign.left,
                softWrap: true,
                style: itemBodyTextStyle ?? TextStyle(
                    fontSize: sf(15),
                    color: Colors.black
                ),
            );
        }
    }
}


/// 需要排除样式内容显示的内容类型
bool excludeContentType (ChatViewItemRecordBodyType type) {
    return [ChatViewItemRecordBodyType.image].contains(type);
}



