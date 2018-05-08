module NameFunctions exposing (..)

import String
import Dict exposing (Dict)


mostFrequentNames : List String -> List String
mostFrequentNames inputNames =
    inputNames
        |> List.map String.toLower
        |> List.concatMap (String.split " ")
        |> List.concatMap (String.split "-")
        |> List.foldl (\name accumulator -> Dict.update name incrementer accumulator) Dict.empty
        |> Dict.toList
        |> List.sortBy (\( _, nameCount ) -> nameCount)
        |> List.reverse
        |> List.map (\( name, nameCount ) -> name ++ " (" ++ toString nameCount ++ ")")
        |> List.take 3


incrementer : Maybe Int -> Maybe Int
incrementer maybeAccumulator =
    maybeAccumulator
        |> Maybe.map ((+) 1)
        |> Maybe.withDefault 1
        |> Just
