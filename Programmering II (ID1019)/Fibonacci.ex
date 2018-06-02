defmodule Fibonacci do
    
    def fib(0) do 0 end
    def fib(1) do 1 end
    def fib(n) do
        fib(n-1) + fib(n-2)
    end

    def bench_fib() do
        ls = [8,10,12,14,16,18,20,22,24,26,28,30,32, 34, 29]
        n = 10
        bench = fn(l) ->
            t = time(n, fn() -> fib(l) end)
            :io.format("n: ~4w fib(n) calculated in: ~8w us~n", [l, t])
        end
        Enum.each(ls, bench)
    end

    def time(n, fun) do
        start = System.monotonic_time(:milliseconds)
        loop(n, fun)
        stop = System.monotonic_time(:milliseconds)
        stop - start
    end
    def loop(n, fun) do
        if n == 0 do
            :ok
        else
            fun.()
            loop(n - 1, fun)
        end
    end
    def calculate_time(29) do 250 end
    def calculate_time(30) do 296 end
    def calculate_time(n) do
        2.7 * calculate_time(n-1)
    end
end