import Browser
import Html exposing (Html, div, input, text)
import Html.Events exposing (onInput)
import Html.Attributes exposing (style, placeholder, value, type_)

main =
    Browser.sandbox {init = init, update = update, view = view}

type alias Model =
    {
    name: String,
    password: String,
    repeat: String
    }

init: Model
init =
    {
    name = "",
    password = "",
    repeat = ""
    }

type Msg =
    Name String |
    Password String |
    Repeat String 

update: Msg -> Model -> Model
update msg model =
    case msg of 
        
        Name nname -> { model | name = nname }

        Password ppass -> { model | password = ppass }

        Repeat rrepeat  -> { model | repeat = rrepeat }

view: Model -> Html Msg 
view model =
    div [][
        customInput "text" "Name" model.name Name,
        customInput "password" "Password" model.password Password,
        customInput "password" "Repeat Password" model.repeat Repeat,
        chkpass model
    ]

customInput: String -> String -> String -> (String -> msg) -> Html msg
customInput ttype pplace vvalue str2msg =
    input [ type_ ttype, placeholder pplace, value vvalue, onInput str2msg ] []

chkpass: Model -> Html msg 
chkpass model =

    if model.password == model.repeat then
        div[ style "color" "#2ce050" ] [text "OK"]
    else
        div [ style "color" "#e50b3e" ] [ text "The passwords are different" ]