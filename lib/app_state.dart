import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _language = prefs.getString('ff_language') ?? _language;
    });
    _safeInit(() {
      _products = prefs
              .getStringList('ff_products')
              ?.map((x) {
                try {
                  return ProductStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _products;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _showFullList = true;
  bool get showFullList => _showFullList;
  set showFullList(bool _value) {
    _showFullList = _value;
  }

  String _language = '';
  String get language => _language;
  set language(String _value) {
    _language = _value;
    prefs.setString('ff_language', _value);
  }

  List<ProductStruct> _products = [
    ProductStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"0\",\"name\":\"Laptop\",\"price\":\"999.9\",\"description\":\"Description goes here....\"}')),
    ProductStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"1\",\"name\":\"iPhone 13\",\"price\":\"899\",\"description\":\"Limited offer. Best price\"}')),
    ProductStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"2\",\"name\":\"TV\",\"price\":\"1200\",\"description\":\"Best TV you can find out there\"}'))
  ];
  List<ProductStruct> get products => _products;
  set products(List<ProductStruct> _value) {
    _products = _value;
    prefs.setStringList(
        'ff_products', _value.map((x) => x.serialize()).toList());
  }

  void addToProducts(ProductStruct _value) {
    _products.add(_value);
    prefs.setStringList(
        'ff_products', _products.map((x) => x.serialize()).toList());
  }

  void removeFromProducts(ProductStruct _value) {
    _products.remove(_value);
    prefs.setStringList(
        'ff_products', _products.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromProducts(int _index) {
    _products.removeAt(_index);
    prefs.setStringList(
        'ff_products', _products.map((x) => x.serialize()).toList());
  }

  void updateProductsAtIndex(
    int _index,
    ProductStruct Function(ProductStruct) updateFn,
  ) {
    _products[_index] = updateFn(_products[_index]);
    prefs.setStringList(
        'ff_products', _products.map((x) => x.serialize()).toList());
  }

  List<UserStruct> _users = [];
  List<UserStruct> get users => _users;
  set users(List<UserStruct> _value) {
    _users = _value;
  }

  void addToUsers(UserStruct _value) {
    _users.add(_value);
  }

  void removeFromUsers(UserStruct _value) {
    _users.remove(_value);
  }

  void removeAtIndexFromUsers(int _index) {
    _users.removeAt(_index);
  }

  void updateUsersAtIndex(
    int _index,
    UserStruct Function(UserStruct) updateFn,
  ) {
    _users[_index] = updateFn(_users[_index]);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
