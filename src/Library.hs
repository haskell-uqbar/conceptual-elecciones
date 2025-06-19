module Library where
import PdePreludat

doble :: Number -> Number
doble numero = numero + numero

--------------- 1 -------------
positivo :: Number -> Bool 
positivo = (> 0)

--------------- 2 -------------
costoEntrada :: Number -> Number
costoEntrada edad = 100 + 2 * adicional edad

adicional :: Number -> Number
adicional edad 
    |edad > 18 = edad + 1
    | otherwise = 18 - edad

-------------- 3 ---------------
--devuelveAlgo :: (Number -> Bool) -> Number -> Number -> (Number -> Number) -> Number
devuelveAlgo x y z w  
    | x y && x z = w y + z
    | otherwise  = z

devuelveOtraCosa :: Number -> (a1 -> Bool) -> (a2 -> a1) -> [a2] -> Bool
devuelveOtraCosa a b c = (> a) . length . filter b . map c

-------------- 4 ---------------
mayoresQueNAlAplicar :: Ord b => b -> (a -> b) -> [a] -> [a]
mayoresQueNAlAplicar n f = filter ((>n).f)  

-------------- 5 ---------------
type Partido = Number

data Mesa = UnaMesa {
    distrito:: String,
    votos :: [Partido],
    cantidadVotantesHabilitados::Number
} deriving Show

data Eleccion = UnaEleccion {
    partidos::[Partido],
    mesas:: [Mesa]
}
--a)
ganador::Eleccion->Partido
ganador eleccion = maximoSegun (votosTotales eleccion) (partidos eleccion)

votosTotales:: Eleccion -> Partido -> Number
votosTotales eleccion partido = sum (map (votosPartido partido) (mesas eleccion))

votosPartido:: Partido -> Mesa -> Number
votosPartido partido mesa = length (filter (partido ==) (votos mesa))

--b)
esIrregular :: Eleccion -> Bool
esIrregular eleccion = any votosDeMas (mesas eleccion)

votosDeMas :: Mesa -> Bool
votosDeMas mesa = cantidadVotos mesa > cantidadVotantesHabilitados mesa

cantidadVotos:: Mesa -> Number
cantidadVotos = length.votos

--c)
mesaConMenosAusentismo :: Eleccion -> Mesa
mesaConMenosAusentismo eleccion = maximoSegun presentismo (mesas eleccion) 

presentismo::Mesa -> Number
presentismo mesa = cantidadVotos mesa / cantidadVotantesHabilitados mesa

-- Ya estaba hecha
maximoSegun :: Ord a1 => (a2 -> a1) -> [a2] -> a2
maximoSegun f = foldl1 maxSegun
    where 
        maxSegun a b
            | f a > f b = a
            | otherwise = b
