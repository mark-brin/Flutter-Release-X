import 'dart:io';

class AppConfigModel {
  final String? flutterPath;
  final UploadOptions uploadOptions;
  final QrCode qrCode;

  // Constructor with default values
  AppConfigModel({
    this.flutterPath,
    UploadOptions? uploadOptions,
    QrCode? qrCode,
  })  : uploadOptions =
            uploadOptions ?? UploadOptions(), // Default for uploadOptions
        qrCode = qrCode ?? QrCode(); // Default for qrCode

  // Factory constructor to create an instance from a YAML file
  factory AppConfigModel.fromYaml(yamlPath) {
    final yamlMap = Map<String, dynamic>.from(yamlPath);

    return AppConfigModel(
      flutterPath: yamlMap['flutter_path'],
      uploadOptions: UploadOptions.fromYaml(yamlMap['upload_options']),
      qrCode: QrCode.fromYaml(yamlMap['qr_code']),
    );
  }

  // Convert AppConfig to a Map (for saving back to a file)
  Map<String, dynamic> toMap() {
    return {
      'flutter_path': flutterPath,
      'upload_options': uploadOptions.toMap(),
      'qr_code': qrCode.toMap(),
    };
  }

  // Optionally, save this configuration back to the file
  void saveToFile() {
    final yamlContent = '''
flutter_path: $flutterPath
upload_options:
  github:
    enabled: ${uploadOptions.github.enabled}
    token: ${uploadOptions.github.token}
    repo: ${uploadOptions.github.repo}
  google_drive:
    enabled: ${uploadOptions.googleDrive.enabled}
    credentials_path: ${uploadOptions.googleDrive.credentialsPath}
    client_id: ${uploadOptions.googleDrive.clientId}
    client_secret: ${uploadOptions.googleDrive.clientSecret}
qr_code:
  enabled: ${qrCode.enabled}
  save_file: ${qrCode.saveFile}
  show_in_command: ${qrCode.showInCommand}
  size: ${qrCode.size}
  error_correction_level: ${qrCode.errorCorrectionLevel}
  save_path: ${qrCode.savePath}
''';
    File('config.yaml').writeAsStringSync(yamlContent);
  }
}

class UploadOptions {
  final Github github;
  final GoogleDrive googleDrive;

  UploadOptions({
    Github? github,
    GoogleDrive? googleDrive,
  })  : github = github ?? Github(), // Default for github
        googleDrive = googleDrive ?? GoogleDrive(); // Default for googleDrive

  factory UploadOptions.fromYaml(Map<dynamic, dynamic> yamlMap) {
    return UploadOptions(
      github: Github.fromYaml(yamlMap['github']),
      googleDrive: GoogleDrive.fromYaml(yamlMap['google_drive']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'github': github.toMap(),
      'google_drive': googleDrive.toMap(),
    };
  }
}

class Github {
  final bool enabled;
  final String? token;
  final String? repo;
  final String tag;

  Github({
    this.enabled = false, // Default for enabled
    this.token,
    this.repo,
    String? tag,
  }) : tag = tag ?? 'v0.0.1';

  factory Github.fromYaml(Map<dynamic, dynamic> yamlMap) {
    return Github(
      enabled: yamlMap['enabled'] ?? false,
      token: yamlMap['token'],
      repo: yamlMap['repo'],
      tag: yamlMap['tag'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'enabled': enabled,
      'token': token,
      'repo': repo,
      'tag': tag,
    };
  }
}

class GoogleDrive {
  final bool enabled;
  final String? credentialsPath;
  final String? clientId;
  final String? clientSecret;

  GoogleDrive({
    this.enabled = false, // Default for enabled
    this.credentialsPath,
    this.clientId,
    this.clientSecret,
  });

  factory GoogleDrive.fromYaml(Map<dynamic, dynamic> yamlMap) {
    return GoogleDrive(
      enabled: yamlMap['enabled'] ?? false,
      credentialsPath: yamlMap['credentials_path'],
      clientId: yamlMap['client_id'],
      clientSecret: yamlMap['client_secret'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'enabled': enabled,
      'credentials_path': credentialsPath,
      'client_id': clientId,
      'client_secret': clientSecret,
    };
  }
}

class QrCode {
  final bool enabled;
  final bool saveFile;
  final bool showInCommand;
  final int size;
  final String errorCorrectionLevel;
  final String savePath;

  QrCode({
    this.enabled = true, // Default for enabled
    this.saveFile = true, // Default for saveFile
    this.showInCommand = true, // Default for showInCommand
    this.size = 256, // Default for size
    this.errorCorrectionLevel = 'L', // Default for errorCorrectionLevel
    this.savePath = './release-qr-code.png', // Default for savePath
  });

  factory QrCode.fromYaml(Map<dynamic, dynamic> yamlMap) {
    return QrCode(
      enabled: yamlMap['enabled'] ?? true,
      saveFile: yamlMap['save_file'] ?? true,
      showInCommand: yamlMap['show_in_command'] ?? true,
      size: yamlMap['size'] ?? 256,
      errorCorrectionLevel: yamlMap['error_correction_level'] ?? 'L',
      savePath: yamlMap['save_path'] ?? './release-qr-code.png',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'enabled': enabled,
      'save_file': saveFile,
      'show_in_command': showInCommand,
      'size': size,
      'error_correction_level': errorCorrectionLevel,
      'save_path': savePath,
    };
  }
}