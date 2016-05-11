module Main exposing (..)

import Collage exposing (..)
import Element exposing (..)
import Grid exposing (..)
import Html exposing (..)


main : Html a
main =
    toHtml
        <| collage 300
            300
            [ simpleGrid
            ]
