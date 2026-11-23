module Main (main) where

import           Config

import           Control.Lens

import qualified MyLib        (someFunc)

main :: IO ()
main = do
  conf <- loadConf
  putStrLn $ conf ^. common . temp
  MyLib.someFunc
