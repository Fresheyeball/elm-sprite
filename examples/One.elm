module One exposing (..)

import Html exposing (..)
import Html.App as Html
import Time exposing (Time, millisecond)
import Html.Attributes as A
import Sprite exposing (..)
import Array

type Msg
  = Tick Time


dopeRow : Int -> List ( Int, Int )
dopeRow y =
    List.map (\x -> ( x, y )) [0..15]


idle : Dope
idle =
    dopeRow 0 |> Array.fromList


init : (Sprite {}, Cmd Msg)
init = (
  { sheet = "https://10firstgames.files.wordpress.com/2012/02/actionstashhd.png"
    , rows = 16
    , columns = 16
    , size = ( 2048, 2048 )
    , frame = 0
    , dope = idle
    } , Cmd.none)


update : Msg -> Sprite {} -> (Sprite {}, Cmd Msg)
update msg model =
    let
        s' =
            case msg of
                Tick _ ->
                    advance model
    in
        ( s', Cmd.none )


view : Sprite {} -> Html Msg
view s =
  div
      []
      [
        node
          "sprite"
          [ A.style (sprite s)]
          []
      ]


subs : Sprite {} -> Sub Msg
subs model =
  Time.every (millisecond * 33) Tick


main : Program Never
main =
  Html.program
    { init = init
    , update = update
    , view = view
    , subscriptions = subs
    }