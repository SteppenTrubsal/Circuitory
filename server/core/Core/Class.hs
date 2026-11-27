module Core.Class where
import           Config

class HasConfig env where
  getConf :: env -> Config
