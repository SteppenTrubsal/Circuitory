module Main (main) where

import           Config

import           Control.Lens

import           Server       (launch)

main :: IO ()
main = do
  conf <- loadConf
  putStrLn $ conf ^. common . temp
  launch
