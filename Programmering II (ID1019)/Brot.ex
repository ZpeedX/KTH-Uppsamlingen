defmodule Brot do
    def mandelbrot(c, m) do
         z0 = Cmplx.new(0, 0)
         i = 0
         test(i, z0, c, m)
    end

    def test(m, _, _, m) do 0 end
    def test(i, z, c, m) do
        case Cmplx.abs1(z) do
            z1 when z1 > 2 ->
                i
            _->
            zn = Cmplx.add(Cmplx.sqr(z), c)
            test(i+1, zn, c , m)
        end
        

    end
end