import 'package:balance_project/config/extensions/padding_extension.dart';
import 'package:balance_project/imports.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImagePickerWidget extends StatelessWidget {
  final String? serverInitialImage;
  final void Function(Uint8List, String) onImagePicked;
  final void Function() onImageNotValid;
  final ValueNotifier<bool> _imagePathNotifier = ValueNotifier(true);
  final bool isIcon;
  final double _previewImageHeight = 200;
  final double _previewImageWidth = 400;
  Uint8List _imagePathBytes = Uint8List(0);
  String _imageType = "";
  String _serverImageType = "";
  final bool isListAdd;

  ImagePickerWidget(
      {required this.serverInitialImage,
      required this.onImagePicked,
      required this.onImageNotValid,
      this.isIcon = false,
      this.isListAdd = false,
      super.key}) {
    _serverImageType = _getImageType(serverInitialImage ?? "");
  }

  String _getImageType(String imagePath) {
    if (kDebugMode) {
      print('image type : ${imagePath.split(".").last.toLowerCase()}');
    }
    return _imageType = imagePath.split(".").last.toLowerCase();
  }

  void pickImage(BuildContext context) async {
    FilePickerResult? files = await FilePicker.platform
        .pickFiles(type: FileType.any, allowMultiple: false);

    if (files != null && files.files.isNotEmpty) {
      _imageType = _getImageType(files.files.first.name);

      if (_imageType == "png" ||
          _imageType == "jpeg" ||
          _imageType == "svg" ||
          _imageType == "webp") {
        _imagePathBytes = files.files.first.bytes ?? Uint8List(0);
        _imagePathNotifier.value = !_imagePathNotifier.value;
        onImagePicked(_imagePathBytes, _imageType);
        // _imagePathBytes = Uint8List(0);
      } else {
        onImageNotValid();
      }
    }
  }

  // Widget _getDisplayedImage(){

  // }

  Widget _getImageErrorWidget(String message) {
    return Container(
        color: Colors.white,
        width: _previewImageWidth,
        height: _previewImageHeight,
        child: Center(
            child: message.isEmpty
                ? const Icon(Icons.broken_image, color: Colors.red, size: 50.0)
                : Text(message)));
  }

  Widget _getImageWidget(Uint8List selectedImage, String? serverImage) {
    return SizedBox(
      width: _previewImageWidth,
      height: _previewImageHeight,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: (serverImage?.isEmpty ?? true) && selectedImage.isEmpty
            ? _getImageErrorWidget("No image selected")
            : serverImage!.isNotEmpty
                ? _serverImageType != "svg"
                    ? CachedNetworkImage(
                        imageUrl: serverImage,
                        width: _previewImageWidth,
                        height: _previewImageHeight,
                        // errorWidget: (context, url, error) {
                        //   return _getImageErrorWidget("");
                        // },

                        fit: BoxFit.cover,
                      )
                    : SvgPicture.network(
                        serverImage,
                        width: _previewImageWidth,
                        height: _previewImageHeight,
                      )
                : _imageType == "svg"
                    ? SvgPicture.memory(
                        selectedImage,
                        width: _previewImageWidth,
                        height: _previewImageHeight,
                      )
                    : Image.memory(
                        selectedImage,
                        fit: BoxFit.cover,
                      ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            if (isListAdd) ...[
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  isIcon ? 'Icon' : 'Image',
                  style: TextStyle(
                      fontSize: AppDimensions.getFonTSize18,
                      fontWeight: TextStyleBlueprint.boldFontWeight,
                      color: StaticColors.black_735),
                ),
              ),
            ],
            ElevatedButton(
                onPressed: () {
                  pickImage(context);
                },
                child: const Text("Pick image")),
          ],
        ),
        30.flexPaddingHeight,
        ValueListenableBuilder<bool>(
          valueListenable: _imagePathNotifier,
          builder: (context, value, child) {
            if (_imagePathBytes.isNotEmpty) {
              return _getImageWidget(_imagePathBytes, "");
            } else {
              return _getImageWidget(_imagePathBytes, serverInitialImage);
            }
          },
        ),
      ],
    );
  }
}
