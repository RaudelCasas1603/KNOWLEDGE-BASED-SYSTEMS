(deffacts productos
  (smartphone (marca apple) (modelo iPhone16) (color rojo) (precio 27000))
  (smartphone (marca samsung) (modelo Note21) (color negro) (precio 23000))
  (computadora (marca apple) (modelo MacBookAir) (color gris) (precio 35000))
  (computadora (marca dell) (modelo XPS13) (color plata) (precio 28000))
  (accesorio (tipo funda) (marca generica) (precio 500) (descuento 0))
  (accesorio (tipo mica) (marca generica) (precio 300) (descuento 0))
)

(deffacts clientes
  (cliente (cliente-id 1) (nombre "Juan Perez") (tipo-cliente menudista) (direccion "Calle Colon 123") (telefono "1234567890"))
  (cliente (cliente-id 2) (nombre "Maria Lopez") (tipo-cliente mayorista) (direccion "Avenida America Viva 456") (telefono "0987654321"))
)

(deffacts tarjetas-credito
  (tarjeta-credito (banco banamex) (grupo visa) (fecha-expiracion "01-12-23"))
  (tarjeta-credito (banco liverpool) (grupo visa) (fecha-expiracion "01-05-24")))

(deffacts ordenes-predeterminadas   ;; ordenes predeterminadas cuando inicie la base de conocimiento 
   (orden (cliente-id 1) (producto smartphone) (marca apple) (modelo iPhone16) (qty 1) (precio 27000))
   (orden (cliente-id 2) (producto smartphone) (marca samsung) (modelo Note21) (qty 2) (precio 23000))
   (orden (cliente-id 1) (producto computadora) (marca apple) (modelo MacBookAir) (qty 20) (precio 35000)))


(deffacts promociones
  (promocion (nombre "Descuento Verano") (descuento 10) (fecha-expiracion "2024-08-31"))
  (promocion (nombre "Promocion Navidad") (descuento 15) (fecha-expiracion "2024-12-25"))
)



(deffacts inventario
  (producto-en-stock (producto smartphone) (marca apple) (modelo iPhone16) (cantidad 20))
  (producto-en-stock (producto computadora) (marca dell) (modelo XPS13) (cantidad 15))
)


