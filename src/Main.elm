module Main exposing (..)

import Html exposing (Html, text, div, h1, h2, h3, img, textarea, ul, li)
import Html.Attributes exposing (src, class, cols, rows, placeholder)
import Html.Events exposing (onInput)
import NameFunctions exposing (mostFrequentNames)
import String


---- MODEL ----


type alias Model =
    { inputNames : String
    , frequencyList : List String
    }


init : ( Model, Cmd Msg )
init =
    let
        input =
            "Ola\nOla\nOla\nPetter\nPetter\nKari"

        frequency =
            updateNameStats input
    in
        ( { inputNames = input
          , frequencyList = frequency
          }
        , Cmd.none
        )



---- UPDATE ----


type Msg
    = TextAreaUpdated String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        TextAreaUpdated input ->
            ( { model | inputNames = input, frequencyList = updateNameStats input }, Cmd.none )


updateNameStats : String -> List String
updateNameStats input =
    input
        |> String.split "\n"
        |> List.filter (\row -> String.length row > 0)
        |> mostFrequentNames



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Most frequent words" ]
        , div [ class "container" ]
            [ div [ class "item" ]
                [ h3 [] [ text "text1" ]
                , textarea [ cols 80, rows 10, onInput TextAreaUpdated ] [ text model.inputNames ]
                ]
            , div [ class "item" ]
                [ h3 [] [ text "Stats" ]
                , viewNameFrequency model.frequencyList
                ]
            ]
        ]


viewNameFrequency : List String -> Html Msg
viewNameFrequency frequencyList =
    ul []
        (frequencyList
            |> List.map (\nameStats -> li [] [ text nameStats ])
        )



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
