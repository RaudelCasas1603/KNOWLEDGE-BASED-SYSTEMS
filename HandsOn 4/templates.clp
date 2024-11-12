;; Template para productos tipo smartphone
(deftemplate smartphone
  (slot marca)
  (slot modelo)
  (slot color)
  (slot precio))

;; Template para productos tipo computadora
(deftemplate computadora
  (slot marca)
  (slot modelo)
  (slot color)
  (slot precio))

;; Template para productos tipo accesorio (funda, mica, etc.)
(deftemplate accesorio
  (slot tipo)            ;; Tipo de accesorio, e.g., funda, mica
  (slot marca)
  (slot precio)
  (slot descuento (default 0)))   ;; Descuento predeterminado es 0 si no se especifica

;; Template para clientes
(deftemplate cliente
   (slot cliente-id)
   (slot nombre)
   (slot tipo-cliente (default menudista))  ;; Clasificación inicial como menudista
   (slot direccion)
   (slot telefono))

;; Template para órdenes
(deftemplate orden
   (slot cliente-id)        ;; ID del cliente que realizó la orden
   (slot producto)          ;; Tipo de producto: smartphone, computadora, etc.
   (slot marca)             ;; Marca del producto (e.g., apple, samsung)
   (slot modelo)            ;; Modelo del producto (e.g., iPhone16, Note21)
   (slot qty)               ;; Cantidad de productos en la orden
   (slot precio)            ;; Precio de los productos en la orden
)

;; Template para tarjetas de crédito
(deftemplate tarjeta-credito
  (slot banco)
  (slot grupo)
  (slot fecha-expiracion))

;; Template para vales
(deftemplate vale
  (slot valor)
  (slot descripcion))

(deftemplate promocion
  (slot nombre)
  (slot descuento)
  (slot fecha-expiracion))


(deftemplate producto-en-stock
  (slot producto)
  (slot marca)
  (slot modelo)
  (slot cantidad))
