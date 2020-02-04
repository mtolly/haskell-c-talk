module Main where

import Foreign.C

#include "stuff.h"

-- straight binding

{#fun doubleMe
  { `CInt'
  } -> `CInt'
#}

-- binding with type conversions

{#fun doubleMe as doubleFloat
  { round `Float'
  } -> `Float' fromIntegral
#}

-- defined enums as separate values

newtype Color = Color { unColor :: CInt }

red, yellow, green :: Color
red    = Color {#const RED    #}
yellow = Color {#const YELLOW #}
green  = Color {#const GREEN  #}

{#fun getFruit
  { unColor `Color'
  } -> `CString'
#}

-- defined enums as Enum type

{#enum define ColorEnum
  { RED    as RED
  , YELLOW as YELLOW
  , GREEN  as GREEN
  } deriving (Eq, Ord)
#}

{#fun getFruit as getFruitEnum
  { `ColorEnum'
  } -> `CString'
#}

main :: IO ()
main = do
  doubleMe 25 >>= print
  doubleFloat 12.4 >>= print
  getFruit yellow >>= peekCString >>= putStrLn
  getFruitEnum GREEN >>= peekCString >>= putStrLn
