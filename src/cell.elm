module Cell exposing (Cell, Wall(..), toForm, defaultCell)

import Color exposing (..)
import Collage exposing (..)


type Wall
    = N
    | E
    | S
    | W


type alias Cell =
    { walls : List Wall
    , height : Float
    , width : Float
    }


defaultCell =
    { walls = [ N, E, S, W ], height = 10, width = 10 }


toForm : Cell -> Form
toForm c =
    group <| List.map (wall black) (wallSegment c)


wallSegment : Cell -> List Path
wallSegment cell =
    List.map (singleWall cell) cell.walls


singleWall : Cell -> Wall -> Path
singleWall cell w =
    let
        hw =
            cell.width / 2

        hh =
            cell.height / 2
    in
        case w of
            N ->
                segment ( 0 - hw, hh ) ( hw, hh )

            E ->
                segment ( hw, hh ) ( hw, 0 - hh )

            S ->
                segment ( hw, 0 - hh ) ( 0 - hw, 0 - hh )

            W ->
                segment ( 0 - hw, 0 - hh ) ( 0 - hw, hh )


wall : Color -> Path -> Form
wall color =
    traced (gridLine color)


gridLine : Color -> LineStyle
gridLine c =
    { defaultLine
        | color = c
        , cap = Padded
    }
