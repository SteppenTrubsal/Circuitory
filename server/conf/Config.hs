module Config
  ( Config
  , common
  , temp
  , loadConf
  ) where

import           Config.Common

import           Control.Lens  (makeLenses)

import           Data.Aeson.TH
import qualified Data.Yaml     as Y

import           System.Exit   (die)

confPath :: FilePath
confPath = "server.yaml"

data Config = Config
  { _common :: CommonConf
  }
makeLenses ''Config
$(deriveJSON defaultOptions {fieldLabelModifier = drop 1} ''Config)

loadConf :: IO Config
loadConf = do
  errs <- Y.decodeFileEither confPath
  case errs of
    Left err  -> die (Y.prettyPrintParseException err)
    Right cfg -> pure cfg
