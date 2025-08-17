import 'dart:io';

void main(){
  List<Map<String, dynamic>> Productos=[
    {
      'nombre': 'arroz',
      'precio': 1.50,
      'cantidadDisponible': 100
    }
  ];

  bool continuar = true;
  while(continuar){
    print('Ingrese el numero de opción que desea realizar:');
    print('1. Agregar producto');
    print('2. Eliminar producto');  
    print('3. Actualizar producto');
    print('4. Listar productos');
    print('5. Salir');
    String? opcion = stdin.readLineSync();
   
    switch(opcion) {
      case '1':
        AgregarProducto(Productos);
        break;
      case '2':
        EliminarProductos(Productos); 
        break;
      case '3':
        ActualizarProducto(Productos);
        break;
      case '4':
        ListarProductos(Productos);
        break;
      case '5':
        continuar = false;
        print('ha salido del programa');
        break;
        default:
        print('Opción no valida.');
    }
  }
}

AgregarProducto(List<Map<String , dynamic>> Productos){
  
print('Ingrese el nombre del producto:');
String? Nombre = stdin.readLineSync() ?? '';

print('Ingrese el Precio del producto:');
double ? Precio = double.tryParse(stdin.readLineSync()?? '');

print('Ingrese la cantidad disponible:');
int ? CantidadD = int.tryParse(stdin.readLineSync()?? '');

if (Nombre.isNotEmpty && Precio != null && CantidadD != null) {
    Productos.add({'nombre': Nombre,'precio': Precio,'cantidadDisponible': CantidadD});
    print('-------------------------------------');
    print('Producto agregado exitosamente.');
    print('-------------------------------------');
    return;
  } else {
      print('-------------------------------------');
    print('Datos inválidos. No se pudo agregar el producto.');
      print('-------------------------------------');
  }

}

ListarProductos(List<Map<String , dynamic>> Productos){
  print('Lista de productos:'); 
  for( int i = 0; i<Productos.length; i++){
    print('-------------------------------------');

    print('Producto ${i}:, Nombre: ${Productos[i]['nombre']}, Precio: ${Productos[i]['precio']}, Cantidad Disponible: ${Productos[i]['cantidadDisponible']}');

    print('-------------------------------------');
  }
}

ActualizarProducto(List<Map<String , dynamic>> Productos) {
  ListarProductos(Productos);
  print('Ingrese el número del producto que desea actualizar:');
  int? indice = int.tryParse(stdin.readLineSync() ?? '');

  if (indice == null || indice < 0 || indice >= Productos.length) {
    print('-------------------------------------');
    print('Índice inválido. No se pudo actualizar el producto.');
    print('-------------------------------------');
    return;
  }

  // Guardar valores actuales
  String nombreActual = Productos[indice]['nombre'];
  double precioActual = Productos[indice]['precio'];
  int cantidadActual = Productos[indice]['cantidadDisponible'];

  // Pedir nuevo nombre
  print('Ingrese el nuevo nombre del producto:');
  String entradaNombre = stdin.readLineSync() ?? '';
  String nuevoNombre = entradaNombre.isEmpty ? nombreActual : entradaNombre;

  // Pedir nuevo precio
  print('Ingrese el nuevo precio del producto:');
  String entradaPrecio = stdin.readLineSync() ?? '';
  double nuevoPrecio = entradaPrecio.isEmpty ? precioActual : double.parse(entradaPrecio);

  
  print('Ingrese la nueva cantidad disponible:');
  String entradaCantidad = stdin.readLineSync() ?? '';
  int nuevaCantidad = entradaCantidad.isEmpty ? cantidadActual : int.parse(entradaCantidad);

  // Actualizar producto
  Productos[indice] = {
    'nombre': nuevoNombre,
    'precio': nuevoPrecio,
    'cantidadDisponible': nuevaCantidad
  };

  print('-------------------------------------');
  print('Producto actualizado correctamente.');
  print('-------------------------------------');
}




EliminarProductos(List<Map<String , dynamic>> Productos){{
  ListarProductos(Productos);
  print('Ingrese el número del producto que desea eliminar:');
  int? indice = int.tryParse(stdin.readLineSync() ?? '');

  if (indice != null && indice >= 0 && indice < Productos.length) {
    Productos.removeAt(indice);
      print('-------------------------------------');
    print('Producto eliminado exitosamente.');
      print('-------------------------------------');
  } else {
      print('-------------------------------------');
    print('Índice inválido. No se pudo eliminar el producto.');
      print('-------------------------------------');
  }
}}