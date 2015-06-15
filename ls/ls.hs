import System.Environment
import System.Directory
import Data.List

stripHidden :: [String] -> [String]
stripHidden = filter (\name -> (head name) /= '.' )

getTargetDirectory :: [String] -> String
getTargetDirectory [] = "."
getTargetDirectory ["-a"] = getTargetDirectory []
getTargetDirectory a = last a

main :: IO ()
main = do
  args <- getArgs
  let targetDirectory = getTargetDirectory args

  let showHidden = "-a" `elem` args
  dirFiles <- getDirectoryContents targetDirectory

  let files = sort $ if showHidden then dirFiles else stripHidden dirFiles
  mapM_ putStrLn files
