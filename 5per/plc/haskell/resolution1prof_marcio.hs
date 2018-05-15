inserirPost :: Post -> Thread -> Thread
inserirPost p Nil = (T p  Nil)
inserirPost p (T p1 th) = (T p (T p1 th))

threadToList :: Thread -> [Post]
threadToList Nil = []
threadToList (T p th) = [p] ++ threadToList th

listToThread :: [Post] -> Thread
listToThread [] = Nil
listToThread (x:xs) = (T x) (listToThread xs)

removerPost :: (Id, DataHoraPub) -> Thread -> Thread
removerPost (id, dhp) Nil = Nil
removerPost (id, dhp) thr = 
  listToThread (filter(\(Post (n,d) st) -> (n,d) /= (id,dhp)) (threadToList thr))

  