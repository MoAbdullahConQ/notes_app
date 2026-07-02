# Notes App

![Platform](https://img.shields.io/badge/platform-Flutter-02569B?logo=flutter&logoColor=white)
![Language](https://img.shields.io/badge/language-Dart-0175C2?logo=dart&logoColor=white)
![State Management](https://img.shields.io/badge/state%20management-BLoC%2FCubit-blueviolet)
![License](https://img.shields.io/badge/license-MIT-green)

A minimal, dark-themed notes app built with Flutter. Notes are stored locally on-device using Hive, with a color-coded, card-based UI for quickly creating, editing, and deleting notes.

## Demo

<a href="https://youtube.com/shorts/ZlLOA-F6MpE">
  <img src="https://img.youtube.com/vi/ZlLOA-F6MpE/maxresdefault.jpg" width="600">
</a>

*Click the thumbnail above to watch the app in action or click here* ▶️ [Watch the demo](https://youtube.com/shorts/ZlLOA-F6MpE)

## Features

- Create notes with a title and content via a bottom sheet form
- Color-tag each note from a preset palette
- Edit note title, content, and color from a dedicated edit screen
- Delete notes directly from the notes list
- Notes persist locally on-device with Hive (no backend required)
- Auto-generated creation date per note
- Form validation on note creation
- Loading state handling while a note is being saved
- Dark theme UI with a custom `Poppins` font

## Architecture

The app follows the **BLoC (Cubit)** pattern for state management, with a clear separation between UI, business logic, and data:

- **`NotesCubit`** — fetches and holds the list of notes from local storage
- **`AddNoteCubit`** — handles creating a note, including the selected color and save state (loading/success/failure)
- **`NoteModel`** — a Hive-backed data model (`title`, `subTitle`, `date`, `color`) with a generated type adapter for local persistence
- **Views/Widgets** — split into reusable widgets (`NoteItem`, `ColorListView`, `CustomTextField`, `CustomButton`, `CustomAppBar`, etc.) consumed by the `NotesView` and `EditNoteView` screens

## Tech Stack

| | |
|---|---|
| **Framework** | Flutter |
| **Language** | Dart (SDK ^3.4.3) |
| **State Management** | `flutter_bloc` (Cubit) |
| **Local Storage** | `hive` / `hive_flutter` |
| **Icons** | `font_awesome_flutter` |
| **Date Formatting** | `intl` |
| **Loading Overlay** | `modal_progress_hud_nsn` |
| **Code Generation** | `build_runner`, `hive_generator` |

## Project Structure

```
notes_app/
├── lib/
│   ├── main.dart                      # App entry point, Hive init, theme
│   ├── constants.dart                 # Colors, Hive box name
│   ├── simple_bloc_observer.dart      # Global BLoC observer for debugging
│   ├── models/
│   │   ├── note_model.dart            # Hive data model
│   │   └── note_model.g.dart          # Generated Hive type adapter
│   ├── cuibts/
│   │   ├── notes_cubit/               # Fetch/list notes state
│   │   └── add_note_cubit/            # Create note state
│   ├── views/
│   │   ├── notes_view.dart            # Home screen (notes list + FAB)
│   │   └── edit_note_view.dart        # Edit note screen
│   └── widgets/                       # Reusable UI components
├── assets/fonts/                      # Poppins font family
└── pubspec.yaml
```

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (Dart ^3.4.3)
- Android Studio / VS Code with the Flutter extension
- An emulator or physical device

### Setup

```bash
git clone https://github.com/MoAbdullahConQ/notes_app.git
cd notes_app
flutter pub get
```

Generate the Hive type adapter (already committed, but regenerate if the model changes):

```bash
dart run build_runner build --delete-conflicting-outputs
```

Run the app:

```bash
flutter run
```

## How It Works

On launch, Hive is initialized and a local box (`notes_box`) is opened to persist `NoteModel` objects. `NotesCubit` reads all notes from that box for the home screen list. Tapping the floating action button opens a bottom sheet (`AddNoteForm`) where the user enters a title, content, and picks a color; on save, `AddNoteCubit` writes the note to Hive and the list refreshes. Tapping an existing note opens `EditNoteView`, where changes are saved back to the same Hive object.

## Author

**Muhammed Abdullah**
- GitHub: [@MoAbdullahConQ](https://github.com/MoAbdullahConQ)
- LinkedIn: [muhammed-bn-abdullah](https://linkedin.com/in/muhammed-bn-abdullah)
- Email: muhammed.abdullah.01155849512@gmail.com

## License

This project is licensed under the [MIT License](LICENSE).
