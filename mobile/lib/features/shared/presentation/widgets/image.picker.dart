import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/core/utils/extensions.dart';
import 'package:mobile/features/shared/presentation/widgets/buttons.dart';
import 'package:shared_utils/shared_utils.dart';

/// Image picker container widget
class ImagePickerContainer extends StatefulWidget {
  final String label;
  final IconData? icon;
  final String? imageUrl;
  final Function(File?)? onImageSelected;
  final VoidCallback? onImageRemoved;

  const ImagePickerContainer(
    this.label, {
    Key? key,
    this.icon,
    this.imageUrl,
    this.onImageSelected,
    this.onImageRemoved,
  }) : super(key: key);

  @override
  State<ImagePickerContainer> createState() => _ImagePickerContainerState();
}

class _ImagePickerContainerState extends State<ImagePickerContainer> {
  File? _selectedFile;
  late var _imageUrl = widget.imageUrl;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: _pickImage,
        child: Container(
          height: context.height * 0.25,
          margin: const EdgeInsets.only(bottom: 16),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
                color: context.colorScheme.secondaryContainer, width: 1.5),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: _selectedFile == null
                    ? _imageUrl.isNullOrEmpty()
                        ? AnimatedColumn(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(widget.icon ?? TablerIcons.notes,
                                      size: 48,
                                      color: context.colorScheme.secondary)
                                  .bottom(16),
                              widget.label
                                  .subtitle1(context,
                                      color: context.colorScheme.secondary,
                                      weight: FontWeight.w600,
                                      alignment: TextAlign.center)
                                  .bottom(8),
                              context.localizer.pickAvatar.subtitle2(context,
                                  alignment: TextAlign.center,
                                  emphasis: kEmphasisMedium),
                            ],
                          ).horizontal(40).centered()
                        : _imageUrl.asNetworkImage(width: context.width)
                    : Image.file(_selectedFile!, fit: BoxFit.cover),
              ),

              // show only when image is selected or when image is not selected but has imageUrl
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                bottom: _selectedFile != null || !_imageUrl.isNullOrEmpty()
                    ? 16
                    : -100,
                right: 16,
                child: RoundedIconButton(
                  icon: TablerIcons.trash,
                  isOpaque: true,
                  foregroundColor: context.colorScheme.onErrorContainer,
                  color: context.colorScheme.errorContainer,
                  onTap: () {
                    if (_selectedFile != null) {
                      _selectedFile = null;
                    } else {
                      _imageUrl = '';
                      if (widget.onImageRemoved == null) return;
                      widget.onImageRemoved!();
                    }
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ),
      );

  void _pickImage() async {
    var picker = ImagePicker();
    var pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;
    var croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: context.localizer.appName,
            toolbarColor: context.colorScheme.primary,
            toolbarWidgetColor: context.colorScheme.onPrimary,
            initAspectRatio: CropAspectRatioPreset.original,
            showCropGrid: true,
            lockAspectRatio: false),
        IOSUiSettings(
          title: context.localizer.appName,
          showCancelConfirmationDialog: true,
          aspectRatioLockEnabled: true,
        ),
        WebUiSettings(context: context),
      ],
    );

    if (croppedFile == null) return;

    setState(() => _selectedFile = File(croppedFile.path));
    if (widget.onImageSelected == null) return;
    widget.onImageSelected!(_selectedFile);
  }
}
