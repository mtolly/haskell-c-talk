module Main where

import Foreign.C

foreign import ccall "doubleMe"
  doubleMe :: CInt -> IO CInt

main :: IO ()
main = doubleMe 25 >>= print
