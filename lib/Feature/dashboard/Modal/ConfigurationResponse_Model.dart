class CongurationModel {
  final AvailableImages? availableImages;
  final ResourceStatusMessages resourceStatusMessages;

  CongurationModel({
    required this.availableImages,
    required this.resourceStatusMessages,
  });

  factory CongurationModel.fromJson(Map<String, dynamic> json) {
    final message = json['message'] as Map<String, dynamic>?;

    return CongurationModel(
      availableImages: message != null
          ? AvailableImages.fromJson(message['availableImages'])
          : null,
      resourceStatusMessages: ResourceStatusMessages.fromJson(
        message?['resourceStatusMessages'] ?? {},
      ),
    );
  }
}

class AvailableImages {
  final String s3Bucket;
  final String defaultImage;
  final List<ImageInfo> images;

  AvailableImages({
    required this.s3Bucket,
    required this.defaultImage,
    required this.images,
  });

  factory AvailableImages.fromJson(Map<String, dynamic> json) {
    return AvailableImages(
      s3Bucket: json['s3Bucket'] ?? '',
      defaultImage: json['default'] ?? '',
      images: (json['images'] as List<dynamic>?)
              ?.map((imageJson) => ImageInfo.fromJson(imageJson))
              .toList() ??
          [],
    );
  }
}

class ImageInfo {
  final int productId;
  final String imageName;

  ImageInfo({
    required this.productId,
    required this.imageName,
  });

  factory ImageInfo.fromJson(Map<String, dynamic> json) {
    return ImageInfo(
      productId: json['productId'] ?? 0,
      imageName: json['imagename'] ?? '',
    );
  }
}

class ResourceStatusMessages {
  final bool showResourceStatus;
  final String defaultStatus;
  final List<ResourceStatusMessage> messages;

  ResourceStatusMessages({
    required this.showResourceStatus,
    required this.defaultStatus,
    required this.messages,
  });

  factory ResourceStatusMessages.fromJson(Map<String, dynamic> json) {
    return ResourceStatusMessages(
      showResourceStatus: json['showResourceStatus'] ?? false,
      defaultStatus: json['default'] ?? 'Unknown status. Contact support',
      messages: (json['messages'] as List<dynamic>?)
              ?.map(
                  (messageJson) => ResourceStatusMessage.fromJson(messageJson))
              .toList() ??
          [],
    );
  }
}

class ResourceStatusMessage {
  final String type;
  final String status;
  final String message;

  ResourceStatusMessage({
    required this.type,
    required this.status,
    required this.message,
  });

  factory ResourceStatusMessage.fromJson(Map<String, dynamic> json) {
    return ResourceStatusMessage(
      type: json['type'] ?? '',
      status: json['status'] ?? '',
      message: json['message'] ?? '',
    );
  }
}
