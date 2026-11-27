{-# LANGUAGE DerivingStrategies         #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE FlexibleInstances          #-}
module Core.App where
import           Control.Monad.Reader

import           Core.Env

newtype App a
  = App { unApp :: ReaderT AppEnv IO a }
  deriving newtype (Applicative, Functor, Monad, MonadIO, MonadReader AppEnv)

runAppIO :: HasApp env => env -> App a -> IO a
runAppIO env act =
  runReaderT (unApp act) (getApp env)
