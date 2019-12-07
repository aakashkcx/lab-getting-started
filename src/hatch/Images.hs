module Images where

import qualified Graphics.Gloss as Gloss 
    (blank, text, scale, 
        color, white, pictures
        , translate)
import Graphics.Gloss.Juicy
import System.IO.Unsafe
import Paths_hatch
import Layout
import Transforms

import Data.Maybe (fromMaybe)

loadImage :: String -> Image
loadImage name = scale 0.1 $ Leaf $ png 
            $ unsafePerformIO 
            $ getDataFileName $ name ++ ".png"

png fname = fromMaybe (Gloss.text "PNG ERROR")
            $ unsafePerformIO 
            $ loadJuicyPNG fname

cat :: Image
cat = loadImage "cat"

dog :: Image
dog = loadImage "dog"

duck :: Image
duck = loadImage "duck"

goose :: Image
goose = loadImage "goose"


blank :: Image
blank = Leaf $ Gloss.blank

text :: String -> Image
text t = Leaf $ Gloss.pictures [
            Gloss.translate x y 
                $ Gloss.color Gloss.white 
                $ Gloss.scale 0.5 0.5 
                $ Gloss.text t
            | x <- [-2..2]
            , y <- [-2..2]
        ]