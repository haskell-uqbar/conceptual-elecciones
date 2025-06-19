## Examen Paradigma Funcional

## 1. Números positivos

Un desarrollador que dice ser cinturón negro en Haskell nos dice que el siguiente código es espectacular y no tiene fallas

```
positivo :: Ord a => a => a  
positivo   
 | x < 0 == True = False  
 | x > 0 == False = True
```
Pero como hábiles programadores que somos, nos damos cuenta de que hay problemas

 1. Marcar errores que hacen que directamente no funcione correctamente  
 2. Indicar cosas que si bien funcionan, se pueden hacer mejor  
 3. Implementar una versión corregida.

## 2. Costos de entrada

Esta función no tiene errores de funcionamiento y devuelve los valores correctos del precio de la entrada según la edad de la persona

```
costoEntrada :: Number -> Number
costoEntrada edad
   | edad > 18 = 100 + 2 * (edad + 1)
   | edad > 60 = 100 + 2 * (edad / 2 - 20)
   | otherwise = 100 + 2 * (18 - edad)
```

1. Hacer una versión que siga funcionando de la misma forma, pero mejor hecha.   
2. Justificar brevemente por qué la nueva versión es mejor.

## 3. Devuelve algo 

Tenemos las funciones

```
devuelveAlgo x y z w  
| x y && x z = w y + z
| otherwise  = z

devuelveOtraCosa a b c = (> a) . length . filter b . map c
```

1. Inferir el tipo mas genérico de las funciones.  
2. Para cada función, mostrar al menos dos ejemplos de llamada con elementos de diferente tipo, en caso que la función permita diferentes tipos, o un único ejemplo en caso contrario, y el resultado que daría en cada uno. 

## 4. Mayores

Dado el siguiente archivo de tests:

```
runTests = hspec $ do
  describe "mayoresQueNAlAplicar" $ do
     it "a" $ do
       mayoresQueNAlAplicar 4 (\x -> x) [1,2,3,4,5,6,7]  `shouldBe` [5, 6, 7]
     it "b" $ do
       mayoresQueNAlAplicar 3 (+1) [1,2,3,4,5]  `shouldBe` [3, 4, 5]
     it "c" $ do
       mayoresQueNAlAplicar 4 negate [4,5,6,6000]  `shouldBe` []
```

1. Definir la función que haga que al correr los tests, todos pasen.   
2. ¿Para qué nos sirven los tests? Responder brevemente.

## 5. Votación 

¡Se cayó el sistema\! Desde la secretaría electoral nos llaman urgente para que implementemos el sistema de votación. No sólo se necesita saber el ganador, sino detectar irregularidades y en particular conocer los índices de ausentismo. 


```
data Mesa = UnaMesa {
  distrito:: String,
  votos :: [Partido],
  cantidadVotantesHabilitados::Number
} deriving Show
```

El sistema debe funcionar para cualquier elección, donde una elección se compone de:

- una lista de mesas.  
- una lista de partidos políticos participantes.

También disponemos de una función `maximoSegun` ya implementada, que quedó de un viejo desarrollador de software que resolvía problemas matemáticos.  Si por ejemplo se la invocaba  `maximoSegun abs [4,2,-3,-10,7]` obtenía como respuesta el `-10` por ser el número con mayor valor absoluto de la lista. Consideramos que nos puede ayudar a resolver problemas donde no necesariamente sean números los elementos de la lista

Nos piden modelar los tipos de datos restantes, implementar las funciones necesarias y hacer ejemplos de consulta para :

1. Obtener al partido ganador de una elección  
2. Determinar si fue una elección irregular, que sucede cuando hay mesas donde la cantidad de votos emitidos supera a la cantidad de votantes habilitados.  
3. Obtener la mesa con el menor índice de ausentismo.  
4. ¿Qué pasaría si hubiera un lista infinitas de mesas? ¿Qué puntos funcionarían y qué puntos no? Justificar

