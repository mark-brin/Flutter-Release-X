# Flutter Release X

A powerful CLI tool to build and release Flutter apps effortlessly. Generate release builds, upload to the cloud, and share QR codes and download links for quick and easy distribution.

## Installation

```bash
dart pub global activate flutter_release_x
```

or

```bash
dart pub add flutter_release_x
```

## Usage

To build the release APK, upload it to GitHub, and generate a QR code:

```bash
flutter_release_x build
```

`--show-config`: Displays the current configuration settings. By default, it reads from `config.yaml`. If a custom file path is provided, it reads from the specified file. Use this option to verify that the setup is correctly configured.

```bash
frx build -s
```

`--config`: Use this flag to specify a custom configuration file path, overriding the default `config.yaml`. This allows you to point to a specific configuration file as needed.

```bash
frx build -c config/file/path
```

## Configuration

Create a `config.yaml` file in the root directory of your project to specify your upload options and QR code generation settings:

```yaml
# e.g. Windows: C:/dev/flutter/bin/flutter.bat
# macOS: /Users/USER_NAME/development/flutter/bin/flutter
flutter_path: FLUTTER/BINARY/PATH

upload_options:
  github:
    enabled: true
    token: YOUR_GITHUB_TOKEN
    repo: REPO/PATH # e.g. RittikSoni/Flutter-Release-X
    tag: v0.0.1
  google_drive:
    enabled: true
    client_id: YOUR_CLIENT_ID
    client_secret: YOUR_CLIENT_SECRET

# QR Code generation settings
# Default settings:
qr_code:
  enabled: true # Whether or not to generate QR codes
  save_file: true # Flag to save the QR code image to the file system (true/false)
  show_in_command: true # Flag to show the QR code in the command line output (true/false)
  size: 256 # The size of the generated QR code Image 256 x 256
  error_correction_level: low # Error correction level for the QR code (low, medium, quartile, high)
  save_path: "./release-qr-code.png" # Path where the QR code will be saved.
```

### Generating a GitHub Personal Access Token

To enable your Flutter CLI tool to upload and delete releases on GitHub, you'll need to generate a **Personal Access Token (PAT)** with the appropriate permissions. Follow the steps below to create and configure your token.

#### Steps to Generate a GitHub Token

1. **Open the GitHub Token Generation Page**:

   - [Generate GitHub Token](https://github.com/settings/tokens/new).

2. **Set the Token Name**:

   - In the **Note** field, enter a descriptive name for your token, such as `Flutter Release X Token`.

3. **Select Scopes**:

   - Under **Select scopes**, check the following permissions:
     - `repo` (Full control of private repositories)
       - This includes access to public and private repositories, which is required for uploading and deleting releases.

4. **Generate the Token**:

   - Click the **Generate token** button at the bottom of the page.
   - Copy the token immediately, as you won’t be able to see it again.

5. **Set Up Your Project**:

   ```yaml
   github:
     enabled: true
     token: YOUR_GITHUB_TOKEN
   ```

### Google Drive Configuration

To upload files to Google Drive, follow these steps to set up your credentials:

1. **Create a Google Cloud Project**:

   - Go to the Google Cloud Console.
   - Create a new project or select an existing one.

2. **Enable the Drive API**:

   - In the Google Cloud Console, navigate to **APIs & Services > Library**.
   - Search for "Google Drive API" and enable it.

3. **Create OAuth 2.0 Credentials**:

   - Go to **APIs & Services > Credentials**.
   - Click on **Create Credentials** and select **OAuth Client ID**.
   - Configure the consent screen if prompted.
   - Set the application type to **Desktop App**.
   - Note down the generated **Client ID** and **Client Secret**.

4. **Set Up Your Project**:

   ```yaml
   google_drive:
     enabled: true
     client_id: YOUR_CLIENT_ID
     client_secret: YOUR_CLIENT_SECRET
   ```

   By following these steps, your application will be able to authenticate with Google Drive using the client ID and secret to upload files.

## Features Overview

| Feature                  | Status         |
| ------------------------ | -------------- |
| APK Builds               | ✅ Integrated  |
| GitHub Upload            | ✅ Integrated  |
| Google Drive Upload      | ✅ Integrated  |
| Upload Link Generation   | ✅ Integrated  |
| QR Code Generation       | ✅ Integrated  |
| iOS Builds               | 🚀 Coming Soon |
| Windows Builds           | 🚀 Coming Soon |
| macOS Builds             | 🚀 Coming Soon |
| Linux Builds             | 🚀 Coming Soon |
| AWS S3 Upload            | 🚀 Coming Soon |
| GitLab Upload            | 🚀 Coming Soon |
| Google Play Store Upload | 🚀 Coming Soon |
| Apple App Store Upload   | 🚀 Coming Soon |

Stay tuned for exciting updates and more cloud upload functionalities like AWS S3, Google Play Store, and Apple App Store integrations. 🚀

## Support the package (optional)

If you find this package useful, you can support it for free by giving it a thumbs up at the top of this page. Here's another option to support the package:

<p align='center'><a href="https://www.buymeacoffee.com/kingrittik" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a></p>

## Get Involved

❤️💙🩵 Love using Flutter Release X? We're expanding its capabilities and would love your input! If you have ideas or want to contribute, check out our GitHub repository and star the project to show your support.

```bash
https://github.com/RittikSoni/Flutter-Release-X
```

Let's make Flutter Release X even more awesome together! 🌟

## License

This project is licensed under the MIT License - see the [MIT LICENSE](LICENSE) file for details.

## 👨‍💻 About the Author

Flutter Release X is crafted with ❤️ and 🚀 by **Rittik Soni**.

As the creator of this project, I’m passionate about simplifying app deployment and making it as effortless as your morning coffee ☕.

### 🌟 Want to Connect?

- 💡 **Have suggestions or ideas?** I’d love to hear them!
- 🐞 **Found a bug?** Don’t worry, I’ll squash it in no time!

Feel free to reach out to me:
📧 **Email:** [contact.kingrittik@gmail.com](mailto:contact.kingrittik@gmail.com)  
🌐 **GitHub:** [Flutter Release X Repository](https://github.com/RittikSoni/Flutter-Release-X)  
📺 **YouTube:** [Learn Flutter & More with Rittik](https://www.youtube.com/@king_rittik)  
📸 **Instagram:** [@kingrittikofficial](https://www.instagram.com/kingrittikofficial)  
📖 **Medium:** [@kingrittik](https://medium.com/@kingrittik)  
☕️ **Buy me a coffee:** [@kingrittik](https://buymeacoffee.com/kingrittik)

---

### 🤝 Contributors

Looking to contribute? Join me on this journey!  
Check out the [Contributing Guidelines](CONTRIBUTING.md) and submit your pull requests.

Together, let’s make Flutter development faster, easier, and more fun! 🎉
