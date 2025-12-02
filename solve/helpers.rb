require 'debug'

def minidata(filename)
  IO.read "minidata/%".sub(/%/, filename)
end

def data(filename)
  IO.read "data/%".sub(/%/, filename)
end
