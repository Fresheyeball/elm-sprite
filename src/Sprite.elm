module Sprite (..) where


type alias Sprite a =
    { a
        | sheet : String
        , rows : Int
        , columns : Int
        , size : ( Int, Int )
        , frame : ( Int, Int )
    }
