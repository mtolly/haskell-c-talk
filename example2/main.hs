module Main where

import Foreign
import Foreign.C

foreign import ccall "doubleMe"
  c_doubleMe :: Ptr CInt -> Ptr CInt -> IO ()

doubleMeSimple :: CInt -> IO CInt
doubleMeSimple n = do
  pin <- malloc
  poke pin n
  pout <- malloc
  c_doubleMe pin pout
  out <- peek pout
  free pin
  free pout
  return out

doubleMeBetter :: CInt -> IO CInt
doubleMeBetter n = with n $ \pin -> do
  alloca $ \pout -> do
    c_doubleMe pin pout
    peek pout

main :: IO ()
main = doubleMe 25 >>= print
