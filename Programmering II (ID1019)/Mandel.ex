defmodule Mandel do
    def mandelbrot(width, height, x, y, k, depth) do
        trans = fn(w, h) ->
            Cmplx.new(x + k * (w - 1), y - k * (h - 1))
        end
        rows(width, height, trans, depth, [])
    end

    def rows(_,-1, _, _, list) do list end 
    def rows(width, height, trans, depth, list)  do
        row = row(width, height, trans, depth, [])
        rows(width, height-1, trans, depth, [row|list])
    end
    def row(-1, _, _,_, list) do list end
    def row(width, height, trans, depth, list) do
        i = trans.(width, height)
        d = Brot.mandelbrot(i, depth)
        c = Color.convert(d, depth)
        row(width-1, height, trans, depth, [c|list])
    end

    def demo() do
        small(-2.6, 1.2, 1.2)
    end
    def small(x0, y0, xn) do
        width = 1920
        height = 1080
        depth = 64
        k = (xn - x0) / width
        image = mandelbrot(width, height, x0, y0, k, depth)
        PPM.write("small.ppm", image)
    end

end