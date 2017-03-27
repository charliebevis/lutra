module HomepageCss exposing (css, CssClasses(..))

import Css exposing (..)
import Css.Namespace exposing (namespace)
import Css.Elements exposing (a, body, h3, input)


type CssClasses
    = HeaderLinks
    | PageWrapper
    | Header
    | PageContent
    | CardBackground
    | LutraLogo
    | ContactForm
    | CenteredCard


css =
    (stylesheet << namespace "lutra")
        [ class Header []
        , class HeaderLinks
            [ displayFlex
            , children
                [ a
                    [ padding (px 20)
                    , verticalAlign middle
                    ]
                ]
            ]
        , class LutraLogo
            [ maxHeight (px 100)
            , padding (px 10)
            ]
        , class PageWrapper
            [ backgroundColor (rgb 155 0 0)
            ]
        , class PageContent
            [ padding2 zero (px 30) ]
        , notAPhone
            [ class CardBackground
                [ backgroundImage (url "assets/city1.jpg")
                , backgroundSize cover
                ]
            ]
        , class CardBackground
            [ padding2 (px 10) zero
            , boxSizing borderBox
            , minHeight <| pct 100
            ]
        , class CenteredCard
            [ margin2 (px 10) auto
            , minWidth (px 400)
            , padding (px 20)
            ]
        , class ContactForm
            [ boxShadow5 zero zero (px 15) (px 10) (rgba 0 0 0 0.1)
            , margin2 zero auto
            ]
        , input
            [ margin (px 15)
            , backgroundColor (rgb 245 245 245)
            , boxShadow none
            , border3 (px 1) solid (rgb 200 200 200)
            , height (px 40)
            , width (px 260)
            , padding (px 10)
            ]
        , body
            [ margin (px 0)
            , fontFamilies [ qt ("Quicksand"), "Helvetica", .value sansSerif ]
            ]
        , h3
            [ fontFamilies [ qt ("Rubik"), "Helvetica", .value sansSerif ]
            ]
        ]


notAPhone =
    mediaQuery "screen and ( min-width: 600px )"


phoneOnly =
    mediaQuery "screen and ( max-width: 600px )"
