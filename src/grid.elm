module Grid exposing (..)

import Color exposing (..)
import Collage exposing (..)
import Element exposing (..)
import Cell exposing (..)


type alias LGrid a =
    List a


type alias Grid a =
    List (List a)


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
        n =
            List.length grid

        moveByXY =
            List.map (toFloat << (\n -> n * 8)) [0..n]

        formList =
            toLForm grid

        o =
            List.map (\row -> List.map2 moveY moveByXY row) formList

        r =
            List.map (\row -> List.map (\cell -> moveX 52 cell) row) o
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


simpleGrid : Form
simpleGrid =
    draw <| defaultGrid defaultCell
