import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)

import Cell exposing (..)
import Grid exposing (..)


main : Element
main =
  collage 300 300
    [
    simpleGrid
    ]
