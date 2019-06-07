import Browser
import Html exposing (div, Html, text, Attribute, input, label)
import Html.Attributes exposing (placeholder, value)
import Html.Events exposing (onInput)

main = Browser.sandbox { init = init, update = update, view = view }

type alias Model = { content: String }

type Msg = Replace String

init: Model
init = { content = "" }

update: Msg -> Model -> Model 
update msg model = case msg of Replace str -> { model | content = str }

view: Model -> Html Msg
view model =
    div[][
        input[ placeholder "Type a text", value model.content, onInput Replace ][],
        div [][
            label [] [ text "Text reversed -> "], 
            text (String.reverse model.content) ]
    ]