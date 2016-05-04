import Cell exposing (..)
import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)


main : Element
main =
  collage 300 300
    [ move (-120, 20) <| Cell.toForm c0
    , move (-100, 20)  <|Cell.toForm c1
    , move (-80, 20)   <|Cell.toForm c2
    , move (-60, 20)   <|Cell.toForm c3
    , move (-40, 20)  <| Cell.toForm c4
    , move (-20, 20)   <|Cell.toForm c5
    , move (0, 20)    <| Cell.toForm c6
    , move (20, 20)  <| Cell.toForm c7
    , move (40, 20)   <|Cell.toForm c8
    , move (60, 20)   <|Cell.toForm c9
    , move (80, 20)   <|Cell.toForm c10
    , move (100, 20)  <|Cell.toForm c11
    , move (120, 20)  <|Cell.toForm c12
    ]


c0 = { walls = [N], height = 10, width = 10 }
c1 = { walls = [E], height = 10, width = 10 }
c2 = { walls = [S], height = 10, width = 10 }
c3 = { walls = [W], height = 10, width = 10 }
c4 = { walls = [N,S], height = 10, width = 10 }
c5 = { walls = [S,E], height = 10, width = 10 }
c6 = { walls = [W,N], height = 10, width = 10 }
c7 = { walls = [N,E], height = 10, width = 10 }
c8 = { walls = [E,S], height = 10, width = 10 }
c9 = { walls = [S,W], height = 10, width = 10 }
c10 = { walls = [N,S], height = 10, width = 10 }
c11 = { walls = [E], height = 10, width = 10 }
c12 = { walls = [N,E,S,W], height = 10, width = 10 }
