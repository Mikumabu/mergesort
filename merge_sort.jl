function merge(x, inicio, mid, fin)
    left = x[inicio:mid]
    right = x[(mid+1):fin]
	pivote = typemax(eltype(x))
    push!(left, pivote)
    push!(right, pivote)
    L, R = 1, 1
    for i in inicio:fin
      if left[L] <= right[R]
          x[i] = left[L]
          L += 1
      else
          x[i] = right[R]
          R += 1
      end
    end
end

function merge_sort!(x, inicio = 1, fin = length(x))
    if inicio < fin
        mid = div(inicio+fin, 2)
        merge_sort!(x, inicio, mid)
        merge_sort!(x, mid+1, fin)
        merge(x, inicio, mid, fin)
    end
    return x
end

size=1000000
list = [rem(rand(Int32),(2^62)) for i =1:size]
@time merge_sort!(list)