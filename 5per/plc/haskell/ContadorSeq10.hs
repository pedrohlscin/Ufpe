module Main where 
import Control.Concurrent 
import Control.Concurrent.MVar
  
oper :: (Int->Int->Int) -> MVar Int -> MVar Int -> Int -> IO () 
oper op cont fim 0 
  = do v <- takeMVar cont
       putStrLn (show v)
       putMVar cont v
       f <- takeMVar fim
       putMVar fim (f-1)
oper op cont fim num
  = do v <- takeMVar cont
       putMVar cont (op v 1)
       oper op cont fim (num-1)

waitThreads :: MVar Int -> IO ()
waitThreads fim = 
  do f <- takeMVar fim
     if (f > 0) then
         do putMVar fim f
            waitThreads fim
       else 
         return ()

main :: IO ()
main 
  = do contador <- newMVar 0 
       fim <- newMVar 10
       forkIO(waitThreads fim)       
       oper (+) contador fim 100000 
       oper (-) contador fim 100000 
       oper (+) contador fim 100000 
       oper (-) contador fim 100000 
       oper (+) contador fim 100000 
       oper (-) contador fim 100000 
       oper (+) contador fim 100000 
       oper (-) contador fim 100000 
       oper (+) contador fim 100000 
       oper (-) contador fim 100000 
        