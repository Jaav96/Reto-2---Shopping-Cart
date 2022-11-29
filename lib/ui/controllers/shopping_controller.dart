import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../../domain/product.dart';

class ShoppingController extends GetxController {
  // lista de productos
  var entries = <Product>[].obs;
  // el valor total de la compra
  var total = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // los dos elementos que vamos a tener en la tienda
    entries.add(Product(0, "Toy car", 10));
    entries.add(Product(1, "Toy house", 20));
  }

  void calcularTotal() {
    int newTotal = 0;
    for (var i = 0; i < entries.length; i++) {
      newTotal = newTotal + entries[i].price * entries[i].quantity;
    }
    total.value = newTotal;
  }

  agregarProducto(id) {
    logInfo('agregarProducto $id');
    Product articulo = entries.firstWhere((element) => element.id == id);
    int pos = entries.indexOf(articulo);
    articulo.quantity++;
    entries[pos] = articulo;
    calcularTotal();
  }

  quitarProducto(id) {
    logInfo('quitarProducto $id');
    Product articulo = entries.firstWhere((element) => element.id == id);
    int pos = entries.indexOf(articulo);
    articulo.quantity--;
    entries[pos] = articulo;
    if (articulo.quantity < 0) {
      articulo.quantity = 0;
    }
    calcularTotal();
  }
}
