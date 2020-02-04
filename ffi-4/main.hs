module Main where

import Foreign
import Foreign.C

newtype Box = Box (Ptr Box)

foreign import ccall "makeBox"
  makeBox :: IO Box

foreign import ccall "destroyBox"
  destroyBox :: Box -> IO ()

foreign import ccall "getVal"
  getVal :: Box -> IO CInt

foreign import ccall "setVal"
  setVal :: Box -> CInt -> IO ()

main :: IO ()
main = do
  b <- makeBox
  setVal b 123
  getVal b >>= print
  setVal b 456
  getVal b >>= print
  destroyBox b
