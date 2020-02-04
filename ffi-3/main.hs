module Main where

import Foreign
import Foreign.C

foreign import ccall "doubleEach"
  c_doubleEach :: Ptr CInt -> CInt -> IO ()

doubleEach :: [CInt] -> IO [CInt]
doubleEach nums = withArrayLen nums $ \len p -> do
  c_doubleEach p (fromIntegral len)
  peekArray len p

main :: IO ()
main = doubleEach [12, 34, 56, 78] >>= print
