module NameFunctions exposing (..)

import String
import Dict exposing (Dict)
import List.Extra exposing (uniqueBy)


mostFrequentNames : List String -> List String
mostFrequentNames inputNames =
    inputNames
        |> List.map String.toLower
        |> List.concatMap splitNames
        |> List.foldl (\name accumulator -> Dict.update name incrementer accumulator) Dict.empty
        |> Dict.toList
        |> List.sortWith sortByCountThenName
        |> List.reverse
        |> List.map (\( name, nameCount ) -> name ++ " (" ++ toString nameCount ++ ")")
        |> List.take 3



-- Helper functions


splitNames : String -> List String
splitNames name =
    name
        |> String.split " "
        |> List.concatMap (String.split "-")
        |> uniqueBy identity


splitNamesPointfree : String -> List String
splitNamesPointfree =
    String.split " "
        >> List.concatMap (String.split "-")
        >> uniqueBy identity


incrementer : Maybe Int -> Maybe Int
incrementer maybeAccumulator =
    maybeAccumulator
        |> Maybe.map ((+) 1)
        |> Maybe.withDefault 1
        |> Just


sortByCountThenName : ( comparable, comparable1 ) -> ( comparable, comparable1 ) -> Order
sortByCountThenName ( aKey, aVal ) ( bKey, bVal ) =
    case compare aVal bVal of
        LT ->
            LT

        EQ ->
            compareNames aKey bKey

        GT ->
            GT


compareNames : comparable -> comparable -> Order
compareNames a b =
    case compare a b of
        LT ->
            GT

        EQ ->
            EQ

        GT ->
            LT
