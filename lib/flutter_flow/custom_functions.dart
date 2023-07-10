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
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

double calculateTotalPrice(List<FruitStruct> cartFruits) {
  // calculate total prices
  double totalPrice = 0.0;
  for (FruitStruct fruit in cartFruits) {
    totalPrice += fruit.totalPrice;
  }
  return totalPrice;
}

int incrementValue(int value) {
  return value++;
}

int decrementValue(int value) {
  return value > 0 ? value-- : 0;
}

double calculateTotalForFruit(
  int kgs,
  double price,
) {
  return kgs * price;
}
