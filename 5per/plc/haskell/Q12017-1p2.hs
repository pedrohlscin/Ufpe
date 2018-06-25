module Main where

import Control.Concurrent
import Control.Concurrent.STM
import Control.Concurrent.MVar

atomRead = atomically . readTVar

waitThreads fim =
  do f <- takeMVar fim
     if (f > 0) then
       do putMVar fim f
          waitThreads fim
     else
        return ()

produtorBulbo :: TVar Int -> MVar Int -> IO()
produtorBulbo bulbos fim = do
                            f <- takeMVar fim
                            atomically (
                              do
                                b <- readTVar bulbos
                                writeTVar bulbos (b + 1)
                                       )
                            putMVar fim (f - 1)
                            produtorBulbo bulbos fim

produtorSoquetes :: TVar Int -> MVar Int -> IO()
produtorSoquetes soquetes fim = do
                                f <- takeMVar fim
                                atomically (do
                                              b <- readTVar soquetes
                                              writeTVar soquetes (b + 1)
                                          )
                                putMVar fim (f - 1)
                                produtorSoquetes soquetes fim


produtorEmbalagens :: TVar Int -> MVar Int -> IO()
produtorEmbalagens embalagens fim = do
                                      f <- takeMVar fim
                                      atomically (do
                                                    b <- readTVar embalagens
                                                    writeTVar embalagens (b + 1)
                                                )
                                      putMVar fim (f - 1)
                                      produtorEmbalagens embalagens fim

consumidor :: TVar Int -> TVar Int -> TVar Int -> MVar Int -> MVar Int -> IO()
consumidor bulbos soquetes embalagens lampadas fim = do
                                                    f <- takeMVar fim
                                                    l <- takeMVar lampadas
                                                    atomically (do
                                                                  b <- readTVar bulbos
                                                                  s <- readTVar soquetes
                                                                  e <- readTVar embalagens
                                                                  writeTVar bulbos (b - 1)
                                                                  writeTVar soquetes (s - 1)
                                                                  writeTVar embalagens (e - 1)
                                                                  )
                                                    putMVar lampadas (l + 1)
                                                    putMVar fim (f - 1)
                                                    consumidor bulbos soquetes embalagens lampadas fim

contador :: MVar Int -> MVar Int -> IO()
contador i_count fim = do
  c <- takeMVar i_count
  putMVar i_count (c + 1)
  f <- takeMVar fim
  putMVar fim (f-1)
  contador i_count fim

main = do 
  fim <- newTVar 100
  count <- newEmptyTVar
  forkIO(contador count fim)
  waitThreads fim
  c <- readTVar count
  putStrLn "Hello"
        -- bulbos <- MVar
        -- soquetes <- atomically (newTVar 0)
        -- embalagens <- atomically (newTVar 0)
        -- lampadas <- newMVar 0
        -- fim <- newMVar 100
        -- forkIO(produtorBulbo bulbos fim)
        -- forkIO(produtorBulbo bulbos fim)
        -- forkIO(produtorEmbalagens embalagens fim)
        -- forkIO(produtorSoquetes soquetes fim)
        -- forkIO(consumidor bulbos soquetes embalagens lampadas fim)
        -- forkIO(consumidor bulbos soquetes embalagens lampadas fim)
        -- waitThreads fim
        -- l <- takeMVar lampadas
        -- b <- atomRead bulbos
        -- putStrLn ("Bulbos: " ++ show b)
        -- putStrLn "Terminou" 

-- main = do
--   fim <- atomically(newMVar 10)
--   putStrLn "Hell"
  -- bulbos <- atomically (newTVar 0)
  -- forkIO(produtorBulbo bulbos fim)
  -- waitThreads fim
  -- b <- atomically(readTVar bulbos)
  -- putStrLn ("Bulbos: " ++ show b)