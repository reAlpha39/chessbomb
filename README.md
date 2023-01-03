# ChessBomb

A game inspired by Bomberman and Chess.

## Installation
- Add [Flutter](https://flutter.dev/docs/get-started/install 'Flutter') to your machine
- Open this project folder with Terminal/CMD
- Ensure there's no cache/build leftover by running `flutter clean` in the Terminal
- Run in the Terminal `flutter packages get`
- Run in the Terminal `flutter packages pub run build_runner build --delete-conflicting-outputs`
## Running the App
- Open Android Emulator
- Run `flutter run`

## Build an APK
- Run `flutter build apk` or Run `flutter build apk --split-per-abi` for split the APK
- The apk will be saved under this location: `[project]/build/app/outputs/flutter-apk/`
- We can also build appbundle (.aab) by running this command: `flutter build appbundle`

For more information, check out the [official documentation](https://flutter.dev/docs 'documentation')
