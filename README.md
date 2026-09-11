# Data Modeler Semana 5
***


# 👤 Autor del proyecto


● Nombre: Giuseppe Sabaini

● Carrera: Programador Computacional

● Asignatura: Modelamiento de Bases de Datos

***

# 📦 Descripción general

● Normalización en 3FN:Se estructuraron las tablas principales
  eliminando redundancias de datos y dependencias parciales.

● Gestión de Ventas: Se creó la entidad asociativa DETALLE_BOLETA para resolver la relación muchos a muchos (N:M) entre las ventas (BOLETA_VENTA) y los          productos (PRODUCTO), almacenando el precio unitario y la cantidad.

● Estructura de Productos: Se implementó una jerarquía fuerte/débil
  para organizar los productos por categoría, marca y modelo

● Especialización de Proveedores: Se aplicó una estructura de herencia con restricción de exclusividad para clasificar a los proveedores en PROVEEDOR_EMPRESA    PROVEEDOR_PERSONA.
