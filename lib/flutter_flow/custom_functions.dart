import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

DocumentReference? getPlacesDocRef() {
  // import 'package:cloud_firestore/cloud_firestore.dart';  DocumentReference getPlacesDocRef(String selectedPlacesID) {   return FirebaseFirestore.instance       .collection('places')       .doc(selectedPlacesID); }
// import 'package:cloud_firestore/cloud_firestore.dart';
  DocumentReference getPlacesDocRef(String selectedPlacesID) {
    return FirebaseFirestore.instance
        .collection('places')
        .doc(selectedPlacesID);
  }
}

String? bucleForProducts(
  List<ProductsRecord> productos,
  String oldHallway,
  String newHallway,
) {
  // Iterar sobre los productos recibidos
  for (var doc in productos) {
    // Obtener la lista de hallways de cada producto
    List<String> hallway = List<String>.from(doc.hallway ?? []);

    // Verifica si el oldHallway está en la lista
    if (hallway.contains(oldHallway)) {
      // Remover el pasillo viejo
      hallway.remove(oldHallway);

      // Agregar el nuevo pasillo
      hallway.add(newHallway);

      // Actualizar el documento en Firebase con la nueva lista de hallways
      doc.reference.update({
        'hallway':
            hallway, // Asegúrate de que sea 'hallways' si es el nombre correcto del campo
      }).then((_) {
        print("Producto ${doc.name} actualizado correctamente.");
      }).catchError((error) {
        print("Error al actualizar producto ${doc.name}: $error");
      });
    }
  }

  return 'Productos actualizados';
}

List<ProductsRecord>? filterProducts(
  List<ProductsRecord> products,
  String town,
  String? tag,
  String? gender,
) {
  List<ProductsRecord> filteredProducts;

  if (town == 'Urabá') {
    // Si town es 'uraba', devuelve todos los productos
    filteredProducts = products;
  } else {
    // Filtra los productos donde storetown coincide con town
    filteredProducts =
        products.where((product) => product.storeTown == town).toList();
  }

  if (tag != null && tag.isNotEmpty) {
    filteredProducts = filteredProducts
        .where((product) => product.tags.contains(tag))
        .toList();
  }

  if (gender != null && gender.isNotEmpty) {
    filteredProducts =
        filteredProducts.where((product) => product.gender == gender).toList();
  }

  filteredProducts.shuffle();
  return filteredProducts;
}
