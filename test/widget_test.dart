
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:venta_autos_flutter/main.dart';

void main() {
  testWidgets(
    'La aplicación muestra la pantalla de bienvenida',
    (WidgetTester tester) async {
      await tester.pumpWidget(const VentaAutosApp());

      expect(find.text('Press me'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    },
  );
}
