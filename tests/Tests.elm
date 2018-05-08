module Tests exposing (..)

import Test exposing (..)
import Expect
import NameFunctions exposing (..)


-- Check out http://package.elm-lang.org/packages/elm-community/elm-test/latest to learn more about testing in Elm!


all : Test
all =
    describe "A Test Suite"
        [ test "One single name" <|
            \_ ->
                let
                    result =
                        mostFrequentNames [ "Ola" ]
                            |> List.take 1
                in
                    Expect.equal [ "ola (1)" ] result
        , test "10 names" <|
            \_ ->
                let
                    result =
                        mostFrequentNames [ "Ola", "Ola", "Ola", "Ola", "Ola", "Ola", "Ola", "Kari", "Kari", "Petter" ]
                in
                    Expect.equal [ "ola (7)", "kari (2)", "petter (1)" ] result
        , test "10 names mixed" <|
            \_ ->
                let
                    result =
                        mostFrequentNames [ "Kari", "Ola", "Petter", "Ola", "Ola", "Kari", "Ola", "Ola", "Ola", "Ola" ]
                in
                    Expect.equal [ "ola (7)", "kari (2)", "petter (1)" ] result
        ]
