defmodule Sesam do


   def mirror(:nill) do :nill end

    def mirror({:tree, a, l, r}) do
        {:tree, a, mirror(r), mirror(l)}
    end


    def calc(l, v) do
        [h|t] = reverse(l, [])
        h + calc(t, v, 1) 
        end

    def calc([], _, _) do 0 end
    def calc([h|t], v, n) do
        h*paw(v, n) + calc(t, v, n+1)    
    end

    def reverse([], l) do l end
    def reverse([h|t], l) do
        reverse(t, [h|l])
    end
    
    def paw(v, 0) do 1 end
    def paw(v, 1) do v end
    def paw(v, n) do
        v*paw(v, n-1)
    end

    def longlist(0, s) do s end
    def longlist(n, s) do
        longlist(n-1, [n|s])
    end

    def start(n) do
        spawn_link(fn -> proc(n) end)
        end
    
    def proc(n) do
        receive do
            {:add, k} ->
                proc(n+k)
            {:sub, k} ->
                proc(n-k)
            {:req, pid} ->
    
                send(pid, {:total, n})
        end
    end


        
    ##{"+",{"*", {"+", 1, 2}}, {"-", {"*", 2, 4}, 5}}

    def eval(l, bind) do
        case l do
         {:add, a, b} -> 
            eval(a, bind) + eval(b, bind)
         {:prod, a, b} -> 
            eval(a, bind) * eval(b, bind)
        {:const, a} ->
            a
        {:var, x} -> 
            lookup(x, bind)
        nil ->
            :fail
        end
    end

    def lookup(_, []) do nil end
    def lookup(h,[{h, a}|t]) do a end

    def lookup(h, [x|t]) do
        lookup(h, t)
    end

    def deriv({:const, _},  _) do 0 end
    def deriv({:var, x}, x) do 1 end
    def deriv({:var, _}, _) do 0 end
    
    def deriv({:add, a, b}, x) do
        {:add, deriv(a, x), deriv(b, x)}
    end

    def deriv({:prod, a, b}, x) do
        {:add, {:prod, deriv(a, x), b}, {:prod, a, deriv(b, x)}}
    end

    def cell(n) do
        receive do
            {:set, v} ->
                cell(v)
            {:get, pid} ->
                send(pid, {:ok, n})
                cell(n)
            {:free, pid} ->
                send(pid, {:ok, n})
        end
    end
end



