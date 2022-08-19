module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (style)
import Html.Events exposing (..)
import Random
import Maybe exposing (withDefault)


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
  ( Model [Three, Ace, King, Queen, Five]
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
  = Draw
  | NewCard Card


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Draw ->
      ( model
      , Random.generate NewCard cardGenerator
      )

    NewCard newCard ->
      ( Model [newCard]
      , Cmd.none
      )


cardGenerator : Random.Generator Card
cardGenerator =
  Random.uniform Ace
    [ Two
    , Three
    , Four
    , Five
    , Six
    , Seven
    , Eight
    , Nine
    , Ten
    , Jack
    , Queen
    , King
    ]



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none



-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ button [ onClick Draw ] [ text "Draw" ]
    , div [] (List.map viewCard model.cards)
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