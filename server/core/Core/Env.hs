{-# LANGUAGE FlexibleInstances #-}
module Core.Env where
import           Config

import           Core.Class
import           Core.Deps

import           Data.Default

class (HasConfig env) => HasApp env where
  getApp :: env -> AppEnv

data AppEnv = AppEnv
  { config :: Config
  }

instance Default (AppDeps -> AppEnv) where
  def deps = AppEnv
    { config = depConf deps
    }

instance HasConfig AppEnv where
  getConf = config

instance HasApp AppEnv where
  getApp = id
