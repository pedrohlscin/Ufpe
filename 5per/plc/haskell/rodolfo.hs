module Teste where

import Control.Concurrent
import Control.Concurrent.MVar
import Control.Concurrent.STM

type Buffer = [Int]

createBuffer :: IO (Buffer a)
createBuffer = do
    atomically (newTVarIO Buffer a)

putBuffer::Buffer a->a->STM()
putBuffer buffer a = do
    atomically( do
        putTVar buffer a
                )

getBuffer::Buffer a -> STM(a)
getBuffer buffer = do
    atomically(do
        t<-readTVar buffer
        return (t)
              )