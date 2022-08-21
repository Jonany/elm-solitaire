module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (style)
import Html.Events exposing (..)
import Random.List exposing (shuffle)
import Random exposing (generate)


-- MAIN


main =
  Browser.element
    { init = init
    , update = update
    , subscriptions = subscriptions
    , view = view
    }



-- MODEL


type alias Model =
  { cards : List Card
  }


init : () -> (Model, Cmd Msg)
init _ =
  ( Model [Ace, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King]
  , Cmd.none
  )


type Card
  = Ace
  | Two
  | Three
  | Four
  | Five
  | Six
  | Seven
  | Eight
  | Nine
  | Ten
  | Jack
  | Queen
  | King



-- UPDATE


type Msg
  = Shuffle
  | ShuffledList (List Card)


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Shuffle ->
        ( model, generate ShuffledList (shuffle model.cards) )

    ShuffledList shuffledList ->
        ( Model shuffledList, Cmd.none)



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none



-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ button [ onClick Shuffle ] [ text "Shuffle" ]
        , div
            [ style "display" "grid"
            , style "grid-template-columns" "repeat(13, 7vw)"
            ]
            (List.map viewCard model.cards)
    ]


viewCardFace : Card -> String
viewCardFace card =
  case card of
    Ace -> "🂡"
    Two -> "🂢"
    Three -> "🂣"
    Four -> "🂤"
    Five -> "🂥"
    Six -> "🂦"
    Seven -> "🂧"
    Eight -> "🂨"
    Nine -> "🂩"
    Ten -> "🂪"
    Jack -> "🂫"
    Queen -> "🂭"
    King -> "🂮"


viewCard : Card -> Html Msg
viewCard card =
  div [ 
      style "font-size" "12em"
      , style "color" "red"
    ] [ text (viewCardFace card) ]


-- shuffleCards : List Card -> List Card
-- shuffleCards cards = shuffle cards