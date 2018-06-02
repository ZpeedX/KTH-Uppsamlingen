defmodule Lists do
    def nth([x|xs], 1) do x end
    def nth([x|xs], n) do nth(xs, n-1) end
    
    def len([x]) do 1 end
    def len([x|xs]) do
        1 + len(xs)
    end

    def sum([]) do 0 end
    def sum([x|xs]) do
        x + sum(xs)
    end

    def duplicate([x]) do [x,x] end
    def duplicate([x|xs]) do
        [x,x | duplicate(xs)]
    end

    def add(x, []) do [x] end
    def add(x, [x|xs]) do
        [x|xs]
    end
    def add(x, [y|ys]) when x != y do
        [y | add(x, ys)]
    end

    def remove(_, []) do [] end
    def remove(x, [x|ys]) do
        remove(x, ys)
    end
    def remove(x, [y|ys]) when x != y do
        [y| remove(x, ys)]
    end

    def unique([]) do [] end
    def unique([x|xs]) do
    case remove(x, xs) do
        xs ->
        [x|unique(xs)]
        _ ->
        unique(xs)
        end
    end

    def pack(ys) do
        packAdd([], ys)  
    end

    def packAdd(xs, []) do xs end
    def packAdd(ys, [x|xs]) do
        packAdd(exists(x, ys), xs)
    end

    def exists(x, []) do [[x]] end
    def exists(x, [[y|ys]|xs]) when x !=y  do
        [[y|ys]|exists(x ,xs)]
    end
    def exists(x, [[x|xs]|ys]) do
        [[x,x|xs]|ys]
    end

    def reverse([]) do [] end
    def reverse([x|xs]) do
        reverse(xs, [x])
    end

    def reverse([], ys) do ys end
    def reverse([x|xs], ys) do
        reverse(xs, [x|ys])
    end
end