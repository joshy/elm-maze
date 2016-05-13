module Grid exposing (..)

import Collage exposing (..)
import Cell exposing (..)


type alias LGrid a =
    List a


type alias Grid a =
    List (List a)


defaultGrid : a -> List (List a)
defaultGrid =
    List.repeat 5 >> List.repeat 5


toLForm : Grid Cell -> List (List Form)
toLForm grid =
    List.map (\row -> List.map Cell.toForm row) grid


toListForm : LGrid Cell -> List Form
toListForm grid =
    List.map Cell.toForm grid


draw : Grid Cell -> Form
draw grid =
    let
        formList =
            toLForm grid

        r =
            List.indexedMap
                (\rowIndex row ->
                    List.indexedMap
                        (\columnIndex cell ->
                            move ( toFloat rowIndex * 10, toFloat columnIndex * 10 ) cell
                        )
                        row
                )
                formList
    in
        group <| List.concat r


drawL : LGrid Cell -> Form
drawL grid =
    let
        n =
            List.length grid

        moveByX =
            List.map (toFloat << (\n -> n * 10)) [0..n]

        formList =
            toListForm grid

        moved =
            List.map2 moveX moveByX formList
    in
        group moved


columnGrid : Form
columnGrid =
    drawL <| List.repeat 5 defaultCell


simpleGrid : Form
simpleGrid =
    draw <| defaultGrid defaultCell
