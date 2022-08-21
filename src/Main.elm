module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (style)
import Html.Events exposing (..)
import Random exposing (generate)
import Random.List exposing (shuffle)



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


init : () -> ( Model, Cmd Msg )
init _ =
    ( Model
        [ { name = "Ace"
          , icon = "🂡"
          , suite = Spades
          , suiteIndex = 1
          }
        , { name = "Ace"
          , icon = "🂱"
          , suite = Hearts
          , suiteIndex = 1
          }
        , { name = "Ace"
          , icon = "🃁"
          , suite = Diamonds
          , suiteIndex = 1
          }
        , { name = "Ace"
          , icon = "🃑"
          , suite = Clubs
          , suiteIndex = 1
          }
        , { name = "Two"
          , icon = "🂢"
          , suite = Spades
          , suiteIndex = 2
          }
        , { name = "Two"
          , icon = "🂲"
          , suite = Hearts
          , suiteIndex = 2
          }
        , { name = "Two"
          , icon = "🃂"
          , suite = Diamonds
          , suiteIndex = 2
          }
        , { name = "Two"
          , icon = "🃒"
          , suite = Clubs
          , suiteIndex = 2
          }
        , { name = "Three"
          , icon = "🂣"
          , suite = Spades
          , suiteIndex = 3
          }
        , { name = "Three"
          , icon = "🂳"
          , suite = Hearts
          , suiteIndex = 3
          }
        , { name = "Three"
          , icon = "🃃"
          , suite = Diamonds
          , suiteIndex = 3
          }
        , { name = "Three"
          , icon = "🃓"
          , suite = Clubs
          , suiteIndex = 3
          }
        , { name = "Four"
          , icon = "🂤"
          , suite = Spades
          , suiteIndex = 4
          }
        , { name = "Four"
          , icon = "🂴"
          , suite = Hearts
          , suiteIndex = 4
          }
        , { name = "Four"
          , icon = "🃄"
          , suite = Diamonds
          , suiteIndex = 4
          }
        , { name = "Four"
          , icon = "🃔"
          , suite = Clubs
          , suiteIndex = 4
          }
        , { name = "Five"
          , icon = "🂥"
          , suite = Spades
          , suiteIndex = 5
          }
        , { name = "Five"
          , icon = "🂵"
          , suite = Hearts
          , suiteIndex = 5
          }
        , { name = "Five"
          , icon = "🃅"
          , suite = Diamonds
          , suiteIndex = 5
          }
        , { name = "Five"
          , icon = "🃕"
          , suite = Clubs
          , suiteIndex = 5
          }
        , { name = "Six"
          , icon = "🂦"
          , suite = Spades
          , suiteIndex = 6
          }
        , { name = "Six"
          , icon = "🂶"
          , suite = Hearts
          , suiteIndex = 6
          }
        , { name = "Six"
          , icon = "🃆"
          , suite = Diamonds
          , suiteIndex = 6
          }
        , { name = "Six"
          , icon = "🃖"
          , suite = Clubs
          , suiteIndex = 6
          }
        , { name = "Seven"
          , icon = "🂧"
          , suite = Spades
          , suiteIndex = 7
          }
        , { name = "Seven"
          , icon = "🂷"
          , suite = Hearts
          , suiteIndex = 7
          }
        , { name = "Seven"
          , icon = "🃇"
          , suite = Diamonds
          , suiteIndex = 7
          }
        , { name = "Seven"
          , icon = "🃗"
          , suite = Clubs
          , suiteIndex = 7
          }
        , { name = "Eight"
          , icon = "🂨"
          , suite = Spades
          , suiteIndex = 8
          }
        , { name = "Eight"
          , icon = "🂸"
          , suite = Hearts
          , suiteIndex = 8
          }
        , { name = "Eight"
          , icon = "🃈"
          , suite = Diamonds
          , suiteIndex = 8
          }
        , { name = "Eight"
          , icon = "🃘"
          , suite = Clubs
          , suiteIndex = 8
          }
        , { name = "Nine"
          , icon = "🂩"
          , suite = Spades
          , suiteIndex = 9
          }
        , { name = "Nine"
          , icon = "🂹"
          , suite = Hearts
          , suiteIndex = 9
          }
        , { name = "Nine"
          , icon = "🃉"
          , suite = Diamonds
          , suiteIndex = 9
          }
        , { name = "Nine"
          , icon = "🃙"
          , suite = Clubs
          , suiteIndex = 9
          }
        , { name = "Ten"
          , icon = "🂪"
          , suite = Spades
          , suiteIndex = 10
          }
        , { name = "Ten"
          , icon = "🂺"
          , suite = Hearts
          , suiteIndex = 10
          }
        , { name = "Ten"
          , icon = "🃊"
          , suite = Diamonds
          , suiteIndex = 10
          }
        , { name = "Ten"
          , icon = "🃚"
          , suite = Clubs
          , suiteIndex = 10
          }
        , { name = "Jack"
          , icon = "🂫"
          , suite = Spades
          , suiteIndex = 11
          }
        , { name = "Jack"
          , icon = "🂻"
          , suite = Hearts
          , suiteIndex = 11
          }
        , { name = "Jack"
          , icon = "🃋"
          , suite = Diamonds
          , suiteIndex = 11
          }
        , { name = "Jack"
          , icon = "🃛"
          , suite = Clubs
          , suiteIndex = 11
          }
        , { name = "Queen"
          , icon = "🂭"
          , suite = Spades
          , suiteIndex = 12
          }
        , { name = "Queen"
          , icon = "🂽"
          , suite = Hearts
          , suiteIndex = 12
          }
        , { name = "Queen"
          , icon = "🃍"
          , suite = Diamonds
          , suiteIndex = 12
          }
        , { name = "Queen"
          , icon = "🃝"
          , suite = Clubs
          , suiteIndex = 12
          }
        , { name = "King"
          , icon = "🂮"
          , suite = Spades
          , suiteIndex = 13
          }
        , { name = "King"
          , icon = "🂾"
          , suite = Hearts
          , suiteIndex = 13
          }
        , { name = "King"
          , icon = "🃎"
          , suite = Diamonds
          , suiteIndex = 13
          }
        , { name = "King"
          , icon = "🃞"
          , suite = Clubs
          , suiteIndex = 13
          }
        ]
    , Cmd.none
    )


type Suite
    = Spades
    | Hearts
    | Diamonds
    | Clubs


type alias Card =
    { name : String
    , icon : String
    , suite : Suite
    , suiteIndex : Int
    }



-- UPDATE


type Msg
    = Shuffle
    | ShuffledList (List Card)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Shuffle ->
            ( model, generate ShuffledList (shuffle model.cards) )

        ShuffledList shuffledList ->
            ( Model shuffledList, Cmd.none )



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


viewCard : Card -> Html Msg
viewCard card =
    div
        [ style "font-size" "12em"
        , style "color" "#074e67"
        ]
        [ text card.icon ]
