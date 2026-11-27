module Core where

import           Core.App
import           Core.Deps
import           Core.Env

import           Data.Default


runApp :: AppDeps -> App a -> IO a
runApp deps = runAppIO (def deps :: AppEnv)
