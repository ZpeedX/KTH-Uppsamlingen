defmodule Cmplx do
    def new(r, i) do
        {r, i}
    end

    def add({r1, i1},{r2, i2}) do
        {r1+r2, i1+i2}
    end

    def sqr({r,i}) do
        {r*r - i*i, 2*r*i}
    end

    def abs1({r, i}) do
        :math.sqrt(r*r + i*i)
    end
end