
# chat_flutter

This is a component package developed purely for `dart` to display chat record lists, supporting the basic content display of images, files, voice, video, and text.




[中文简体](https://github.com/xiaorui-23/chat_flutter/blob/master/README_CN.md)



## Rendering



<div>
    <img src="https://raw.githubusercontent.com/xiaorui-23/chat_flutter/master/example/assets/rendering/rendering_1.png" width="200" height="400" />
    <img src="https://raw.githubusercontent.com/xiaorui-23/chat_flutter/master/example/assets/rendering/rendering_2.png" width="200" height="400" />
    <img src="https://raw.githubusercontent.com/xiaorui-23/chat_flutter/master/example/assets/rendering/rendering_3.png" width="200" height="400" />
</div>

## Characteristic



This tool component can display chat records, commonly used for displaying chat record content.

The display content supports the following basic content:

- 图片 -> image
- 文件 -> file
- 文字 -> text
- 音频 -> audio
- 视频 -> video  <--> Not currently supported



## Install

pub.dev Address Navigation：

- pub.dev: [https://pub.dev/packages/chat_flutter](https://pub.dev/packages/chat_flutter)
- pub.flutter-io.cn: [https://pub.flutter-io.cn/packages/chat_flutter](https://pub.flutter-io.cn/packages/chat_flutter) -> (China Mirror Address)

### 1、

You can directly `pubspec.yaml` in the file `dependencies` add below for installation.

```dart
chat_flutter: ^1.0.0
```

As follows:

```dart
dependencies:
  chat_flutter: ^1.0.0
```

### 2、

You can also execute the following command to install from the terminal located in the project root directory:

```dart
flutter pub add chat_flutter
```

## Use 

Introduce on the required page:

```dart
import 'package:chat_flutter/chat_flutter.dart';
```

Complete Use Case:

```dart
import 'package:flutter/material.dart';
import 'package:chat_flutter/chat_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            children: [
                Expanded(
                    child: ChatViewWidget()
                )
            ],
        ),
    );
  }
}
```



More use cases can be found at [Here](https://github.com/xiaorui-23/chat_flutter.git) hit the target `/example/lib/main.dart` review.


## Precautions for use



This plugin only provides display and does not provide implementation of functions. If the following functions are not implemented:

- When displaying recorded content as audio, this plugin does not implement audio playback, and users need to implement the audio playback function themselves.



This plugin does not impose width or height restrictions on the content of the plugin, so you need to package the plugin with `widget` set the width and height of the box。



## About the Adaptation of Plugin Models



This plugin itself uses `flutter_screenutil` based on plugins, multiple models have been adapted, so you don't have to worry about encountering problems during use `UI` disorder and other issues, if the model you are using is not properly adapted, resulting in  `UI` for issues such as disordered styles, you can contact me through the contact information below to provide assistance.



## About plugin dependency issues



After the author discovers that the dependencies used in the plugin have been updated, they will be updated as soon as possible. For a smoother experience during use, it is recommended that you update the plugin as soon as possible, or `pubspec.yaml` add before version number in the file `^` symbol for using the latest version of the plugin



## About Customization



This plugin provides a high degree of customization to facilitate the functionality provided by the plugin when you are not satisfied `UI` customize to meet your needs.



## Case study and detailed usage reference guide



If you feel that the cases and usage assistance provided on this page cannot help you successfully start using this plugin, you can click [Here](https://github.com/xiaorui-23/chat_flutter.git) and enter `example/lib/main.dart` file View Detailed Use Cases. Alternatively, you can contact me through the contact information below.



## API Parameter Description


### `ChatViewWidget` Illustrate

| Name | Type | Describe | Default value |
| :----: | :----: | :----: | :----: |
| `children` | `List<ChatViewItem>` | record list  | `[]` |
| `isNeedScrollBottom` | `bool` | Whether to slide to the bottom during initial rendering  | `false` |
| `onCreated` | `Function(ScrollController chatViewWidgetController)` | When creation is complete, return a`ScrollController` list controller of type  | -- |
| `isOpenPreviewImage` | `bool` | Do you want to enable image preview  | `false` |



### `ChatViewItem` Illustrate



#### Common Parameter API



| Name | Type | Describe | Default value |
| :----: | :----: | :----: | :----: |
| `itemBody` | `dynamic` | Content. according to `itemBodyType` the content conveyed varies depending on the type. When `itemBodyType = ChatViewItemRecordBodyType.audio` time may not be transmitted, and detailed use can refer to case studies.  | -- |
| `senderRight` | `bool` | Is it on the right side  | `true` |
| `avatarPath` | `String` | The avatar address will be the default one when it is not delivered. If it is not delivered, the built-in icon avatar scheme will be used  | -- |
| `defaultAvatarPath` | `String` | Default avatar address | -- |
| `isAvatarShow` | `bool` | Is the avatar displayed | `true` |
| `avatarSize` | `double` | Avatar size | Adapted `45` |
| `avatarColor` | `Color` | Head color | -- |
| `customAvatar` | `Widget` | Custom avatar | -- |
| `customRecordTimeWidget` | `Widget` | Custom Time Record `widget` | -- |
| `customRecordTimeStyle` | `TextStyle` | Custom Time Record Style | -- |
| `chatViewItemRecordBodyBoxConstraints` | `BoxConstraints` | Content subject constraints | -- |
| `itemBodyType` | `ChatViewItemRecordBodyType` | Current record content type | `text` |
| `customAvatarWidget` | `Widget` | Custom avatar | -- |
| `itemBodyRecordTime` | `String` | Recording time | -- |
| `backgroundColor` | `Color` | Record the background color of the main body | `Colors.white` |
| `customItem` | `Widget` | Custom Record Body | -- |
| `avatarTap` | `Function` | Head image click callback | -- |
| `itemBodyTap` | `Function` | Content subject click event | -- |
| `itemBodyMediaTap` | `Function(ChatViewItemRecordBodyType type)` | File, image, audio, video click events | -- |



#### Below are different types of parameters API



#### Text



| Name | Type | Describe | Default value |
| :----: | :----: | :----: | :----: |
| `selectionControls` | `TextSelectionControls` | Text selection controller. When `isOpenTextSelect` the activation is valid. | -- |
| `itemBodyTextStyle` | `TextStyle` | Record the text style of the main body | `TextStyle (color: const Color(0xff1989fa),fontSize: 16` |
| `isOpenTextSelect` | `bool` | Do you want to open the long press text menu | `true` |
| `contextMenuBuilder` | `Widget Function(BuildContext context, SelectableRegionState selectableRegionState)` | Displayed Tools Menu | -- |
| `onSelectionChanged` | `Function(SelectedContent?)` | Long press the text menu to select a callback | -- |
| `createSelectableTextCallback` | `Function(FocusNode focusNode)` | Optional Text Content `widget` callback during creation | -- |



#### Audio



| Name | Type | Describe | Default value |
| :----: | :----: | :----: | :----: |
| `audioTimelength` | `int` | Audio duration  | `0` |
| `audioPlayStatus` | `bool` | Playing  | `false` |



#### Image



| Name | Type | Describe | Default value |
| :----: | :----: | :----: | :----: |
| `previewImageLongPressMenu` | `List<String>` | Preview Image Long Press to Display Menu  | -- |
| `onPreviewImageTapMenu` | `Function(String data, int index, List<String> menuList)` | Preview Image Menu Click Callback  | -- |
| `customPreviewImageCallback` | `Function(String imagePath)` | Custom preview image callback. Note: When passing this parameter, the preview scheme provided by the library will no longer be used.  | -- |
| `customLongPress` | `Function(BuildContext context)` | Custom long press image display callback  | -- |



#### Video



Not currently supported.



## Contact Author



When you encounter problems during use, you can click [Here](https://github.com/xiaorui-23/chat_flutter.git) have `issue` ask a question or contact me through the contact information below. When you see your contact or raise a question `issue` I will reply and contact you as soon as possible.

- [github](https://github.com/xiaorui-23/chat_flutter)
- [gitee](https://gitee.com/xiaorui-23/flutter_chat)

