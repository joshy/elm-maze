module Grid where

import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)

import Cell exposing (..)

type alias Grid a = List a


defaultGrid = List.repeat 2 >> List.repeat 2

init : Grid Cell
init = List.repeat 5 defaultCell


toListForm : Grid Cell -> List Form
toListForm g = List.map Cell.toForm g

draw : Grid Cell -> Form
draw grid =
  let
    n = List.length grid
    s = [0..n]
    moveByX = List.map toFloat <| List.map (\n -> n * 10) s
    formList = toListForm grid
    moved = List.map2 moveX moveByX formList
  in
    group moved

simpleGrid : Form
simpleGrid = draw init
