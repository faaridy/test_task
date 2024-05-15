import 'package:flutter/material.dart';

extension MaterialStateProperity<T> on T{
   MaterialStatePropertyAll<T> get mspAll => MaterialStatePropertyAll<T>(this);
}