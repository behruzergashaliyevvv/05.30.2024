import 'package:flutter/foundation.dart';
import '../models/note.dart';
import '../services/api_service.dart';

class NoteController with ChangeNotifier {
  List<Note> _notes = [];

  List<Note> get notes => _notes;

  NoteController() {
    fetchNotes();
  }

  void fetchNotes() async {
    _notes = await ApiService.fetchNotes();
    notifyListeners();
  }

  void addNote(String productName, double price, int amount) async {
    final newNote = Note(
      id: DateTime.now().toString(),
      productName: productName,
      price: price,
      amount: amount,
    );
    _notes.add(newNote);
    notifyListeners();
    await ApiService.saveNote(newNote);
  }

  void deleteNote(String id) async {
    _notes.removeWhere((note) => note.id == id);
    notifyListeners();
    await ApiService.deleteNote(id);
  }
}
