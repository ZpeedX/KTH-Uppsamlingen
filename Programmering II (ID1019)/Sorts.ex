defmodule Sorts do
    
    def insert(x, []) do [x] end
    def insert(y, [x|xs]) do
        case x < y do
        true ->
            [x|insert(y, xs)]
        false -> 
            [y, x | xs]
        end
    end

    def isort(ls) do
        isort(ls, [])
    end
    def isort([], l) do l end
    def isort([x|xs], []) do
        isort(xs, [x])
    end
    def isort([x|xs], ls) do
        isort(xs, insert(x, ls))
        end
        
    def isort1(ls) do
        isort1(ls, [])
    end

    def isort1(x, l) do
        case x do 
             [] ->
                l
            [h|t] ->
                isort1(t, insert(h,l))
        end
    end

    def msort(l) do
        case l do
            [x] -> 
                [x]
            [h|t] ->
                {l1, l2} = msplit(l, [], [])
                merge(msort(l1), msort(l2))
        end
    end

    def merge([],x) do x end
    def merge(x, []) do x end
    def merge([h|t], [h1|t1]) do
        if h < h1 do
            [h|merge(t, [h1|t1])]
        else
            [h1|merge([h|t], t1)]
        end
    end

    def msplit(l, xs, ys) do
        case l do
            [h,x|t] -> 
                msplit(t, [h|xs], [x|ys])
            [h] ->
                {xs, [h|ys]}
            [] ->
                {xs, ys}
        end
    end


    def qsort([]) do  [] end
    def qsort([p | l])  do
        {s,l} = qsplit(p,l,[],[])
        small = qsort(s)
        large = qsort(l)
        append(small, [p|large])
    end

    def qsplit(_, [], small, large) do {small, large} end
    def qsplit(p, [h|t], small, large) do
        if p < h do
            qsplit(p, t, small, [h|large])
        else
            qsplit(p, t, [h|small], large)
        end
    end


    def append(ls, ys) do
        case ls do
            [] ->
                ys
            [h | t] -> 
                [h|append(t, ys)]
        end
    end
end

