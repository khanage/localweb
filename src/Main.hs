{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
module Main where

import Data.Semigroup                 ((<>))
import Network.Wai.Application.Static (defaultFileServerSettings, staticApp)
import Network.Wai.Handler.Warp       (Port, run)
import Options.Applicative

main :: IO ()
main = do
  ServerOptions{..} <- execParser serverOptionsInfo
  putStrLn $ "Running on http://localhost:" <> show port <> "/ serving `" <> path <> "`."
  run port $ staticApp $ defaultFileServerSettings path

data ServerOptions = ServerOptions
  { port :: Port
  , path :: FilePath
  }

serverOptionsInfo
  :: ParserInfo ServerOptions
serverOptionsInfo = info (serverOptionsParser <**> helper)
             ( fullDesc
               <> progDesc "Run a local web server to serve static files"
               <> header "localweb - an HTTP server for local files."
             )

serverOptionsParser
  :: Parser ServerOptions
serverOptionsParser = ServerOptions
  <$> option auto
        ( long "port"
          <> short 'p'
          <> metavar "PORT"
          <> help "Port to run on"
          <> showDefault
          <> value 8080
        )
  <*> strOption
        ( long "directory"
          <> short 'd' -- haha
          <> metavar "DIRECTORY"
          <> help "Base directory whence to serve"
          <> showDefault
          <> value "."
        )
