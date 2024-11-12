(defrule oferta-iphone16-banamex
   (orden (producto smartphone) (marca apple) (modelo iPhone16))
   (tarjeta-credito (banco banamex) (grupo visa))
   =>
   (printout t "Oferta: 24 meses sin intereses en iPhone16 con tarjeta Banamex" crlf))

(defrule oferta-note21-liverpool
   (orden (producto smartphone) (marca samsung) (modelo Note21))
   (tarjeta-credito (banco liverpool) (grupo visa))
   =>
   (printout t "Oferta: 12 meses sin intereses en Samsung Note21 con tarjeta Liverpool VISA" crlf))

(defrule oferta-macbook-iphone-contado
   (orden (producto smartphone) (marca apple) (modelo iPhone16))
   (orden (producto computadora) (marca apple) (modelo MacBookAir))
   (not (tarjeta-credito))
   =>
   (printout t "Oferta: Vales por la compra de una MacBookAir y iPhone16 al pagar de contado" crlf))

(defrule oferta-descuento-accesorios
   (orden (producto smartphone))
   (accesorio (tipo funda) (marca generica))
   =>
   (printout t "Descuento: 15% en funda y mica para la compra de un smartphone" crlf))

(defrule oferta-libre-envio
   (orden (producto computadora) (marca dell) (modelo XPS13) (qty ?qty&:(>= ?qty 2)))
   =>
   (printout t "Oferta: Envío gratuito por la compra de 2 o más computadoras Dell XPS13" crlf))


;; DESCUENTOS POR CANTIDAD Y TIPO 


(defrule descuento-mayorista
   (cliente (tipo-cliente mayorista))
   (orden (producto smartphone) (qty ?qty&:(>= ?qty 5)))
   =>
   (printout t "Descuento: 10% en compras de más de 5 smartphones para clientes mayoristas" crlf))

(defrule descuento-compra-combo
   (orden (producto smartphone) (marca apple) (modelo iPhone16) (qty ?qty&:(>= ?qty 2)))
   (orden (producto computadora) (marca apple) (modelo MacBookAir) (qty ?qty&:(>= ?qty 1)))
   =>
   (printout t "Descuento: 5% de descuento por la compra combinada de 2 iPhone16 y 1 MacBookAir" crlf))

(defrule descuento-accesorios
   (orden (producto smartphone) (qty ?qty&:(>= ?qty 3)))
   (accesorio (tipo funda) (marca generica))
   =>
   (printout t "Descuento: 10% en accesorios por la compra de más de 3 smartphones" crlf))


;; CLASIFICACION DE CLIENTES 

(defrule clasificar-mayorista
   ?fact-cliente <- (cliente (cliente-id ?id) (nombre ?nombre) (tipo-cliente menudista))
   (orden (cliente-id ?id) (producto smartphone) (qty ?qty&:(> ?qty 10)))
   =>
   (modify ?fact-cliente (tipo-cliente mayorista))
   (printout t "El cliente " ?nombre " ha sido clasificado como mayorista." crlf))

(defrule clasificar-vip
   ?fact-cliente <- (cliente (cliente-id ?id) (nombre ?nombre) (tipo-cliente menudista))
   (orden (cliente-id ?id) (producto computadora) (qty ?qty&:(>= ?qty 3)))
   =>
   (modify ?fact-cliente (tipo-cliente vip))
   (printout t "El cliente " ?nombre " ha sido clasificado como VIP por comprar 3 computadoras." crlf))


;;ACTUALIZACION DE STOCK 


(defrule stock-actualizado
   (orden (producto smartphone) (marca apple) (modelo iPhone16) (qty ?qty))
   =>
   (if (> ?qty 10) 
      then (printout t "Stock actualizado para mayorista: " ?qty crlf)
      else (printout t "Stock actualizado para menudista: " ?qty crlf)))

(defrule stock-bajo
   (orden (producto computadora) (modelo MacBookAir) (qty ?qty&:(<= ?qty 3)))
   =>
   (printout t "¡Alerta! El stock de MacBookAir es bajo. Solo quedan " ?qty " unidades." crlf))


;; OFERTAS BASADAS EN FECHA 


(defrule oferta-navidad
   (orden (producto smartphone) (marca apple) (modelo iPhone16))
   (not (fecha "diciembre"))
   =>
   (printout t "Oferta especial de Navidad: 15% de descuento en iPhone16 hasta el 31 de diciembre" crlf))

(defrule oferta-lanzamiento
   (orden (producto smartphone) (marca samsung) (modelo Note21))
   (not (fecha "junio"))
   =>
   (printout t "¡Oferta de lanzamiento! 10% de descuento en Samsung Note21 durante el mes de junio." crlf))


;;COMISIONES Y BENEFICIOS DE VENTAS

(defrule comision-vendedor
   (orden (cliente-id ?cliente-id) (producto ?producto) (qty ?qty))
   (cliente (cliente-id ?cliente-id) (tipo-cliente vip))
   =>
   (printout t "Comisión del vendedor: 5% sobre el valor de la venta al cliente VIP de " ?producto crlf))

(defrule beneficio-cliente-vip
   (cliente (tipo-cliente vip))
   =>
   (printout t "¡Cliente VIP! Tienes acceso a ofertas exclusivas y beneficios adicionales." crlf))


;;PROMOCIONES DE TEMPORADA 

(defrule promocion-verano
   (orden (producto computadora) (modelo XPS13) (qty ?qty&:(>= ?qty 2)))
   (not (temporada verano))
   =>
   (printout t "Promoción de verano: 20% de descuento por la compra de 2 o más XPS13 en temporada de verano." crlf))

(defrule promocion-otoño
   (orden (producto smartphone) (modelo iPhone16) (qty ?qty&:(>= ?qty 3)))
   (not (temporada otono))
   =>
   (printout t "¡Descuento de otoño! 10% en la compra de 3 o más iPhone16 en temporada de otoño." crlf))


;;DESCUENTOS POR FORMA DE PAGO 


(defrule descuento-pago-contado
   (orden (producto ?producto) (qty ?qty) (precio ?precio))
   (not (tarjeta-credito))
   =>
   (printout t "Descuento: 5% por pagar en efectivo al comprar " ?producto crlf))

(defrule descuento-tarjeta-debito
   (orden (producto ?producto) (qty ?qty) (precio ?precio))
   (tarjeta-credito (grupo debito))
   =>
   (printout t "Descuento: 3% por pagar con tarjeta de débito en " ?producto crlf))



;;REGLAS DE INVENTARION Y STOCK 

(defrule inventario-bajo
   (orden (producto ?producto) (qty ?qty&:(<= ?qty 5)))
   =>
   (printout t "Inventario bajo para " ?producto ". ¡Realiza tu pedido pronto!" crlf))

(defrule inventario-suficiente
   (orden (producto ?producto) (qty ?qty&:(> ?qty 5)))
   =>
   (printout t "Inventario suficiente para " ?producto ". Pedido procesado correctamente." crlf))





