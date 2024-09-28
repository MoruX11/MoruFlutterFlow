import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _selectedCategoryID = '';
  String get selectedCategoryID => _selectedCategoryID;
  set selectedCategoryID(String value) {
    _selectedCategoryID = value;
  }

  String _selectedPlacesID = '';
  String get selectedPlacesID => _selectedPlacesID;
  set selectedPlacesID(String value) {
    _selectedPlacesID = value;
  }

  List<String> _namesForChoiceChip = [];
  List<String> get namesForChoiceChip => _namesForChoiceChip;
  set namesForChoiceChip(List<String> value) {
    _namesForChoiceChip = value;
  }

  void addToNamesForChoiceChip(String value) {
    namesForChoiceChip.add(value);
  }

  void removeFromNamesForChoiceChip(String value) {
    namesForChoiceChip.remove(value);
  }

  void removeAtIndexFromNamesForChoiceChip(int index) {
    namesForChoiceChip.removeAt(index);
  }

  void updateNamesForChoiceChipAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    namesForChoiceChip[index] = updateFn(_namesForChoiceChip[index]);
  }

  void insertAtIndexInNamesForChoiceChip(int index, String value) {
    namesForChoiceChip.insert(index, value);
  }

  bool _searchInGroceries = false;
  bool get searchInGroceries => _searchInGroceries;
  set searchInGroceries(bool value) {
    _searchInGroceries = value;
  }

  bool _searchInRestaurant = false;
  bool get searchInRestaurant => _searchInRestaurant;
  set searchInRestaurant(bool value) {
    _searchInRestaurant = value;
  }

  bool _searchInRegalos = false;
  bool get searchInRegalos => _searchInRegalos;
  set searchInRegalos(bool value) {
    _searchInRegalos = value;
  }

  bool _searchInModa = false;
  bool get searchInModa => _searchInModa;
  set searchInModa(bool value) {
    _searchInModa = value;
  }

  bool _searchInProducts = false;
  bool get searchInProducts => _searchInProducts;
  set searchInProducts(bool value) {
    _searchInProducts = value;
  }

  bool _searchInHomePage = false;
  bool get searchInHomePage => _searchInHomePage;
  set searchInHomePage(bool value) {
    _searchInHomePage = value;
  }

  String _townState = '';
  String get townState => _townState;
  set townState(String value) {
    _townState = value;
  }

  List<String> _photosToEditProduct = [];
  List<String> get photosToEditProduct => _photosToEditProduct;
  set photosToEditProduct(List<String> value) {
    _photosToEditProduct = value;
  }

  void addToPhotosToEditProduct(String value) {
    photosToEditProduct.add(value);
  }

  void removeFromPhotosToEditProduct(String value) {
    photosToEditProduct.remove(value);
  }

  void removeAtIndexFromPhotosToEditProduct(int index) {
    photosToEditProduct.removeAt(index);
  }

  void updatePhotosToEditProductAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    photosToEditProduct[index] = updateFn(_photosToEditProduct[index]);
  }

  void insertAtIndexInPhotosToEditProduct(int index, String value) {
    photosToEditProduct.insert(index, value);
  }

  List<String> _photoToEditLogo = [];
  List<String> get photoToEditLogo => _photoToEditLogo;
  set photoToEditLogo(List<String> value) {
    _photoToEditLogo = value;
  }

  void addToPhotoToEditLogo(String value) {
    photoToEditLogo.add(value);
  }

  void removeFromPhotoToEditLogo(String value) {
    photoToEditLogo.remove(value);
  }

  void removeAtIndexFromPhotoToEditLogo(int index) {
    photoToEditLogo.removeAt(index);
  }

  void updatePhotoToEditLogoAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    photoToEditLogo[index] = updateFn(_photoToEditLogo[index]);
  }

  void insertAtIndexInPhotoToEditLogo(int index, String value) {
    photoToEditLogo.insert(index, value);
  }
}
