n = 10000000;
numprimes = 0;

function is_prime(n)
        if n == 0 | n == 1
                return 0
        elseif n == 2
                return 1
        end
        root_n = isqrt(n)
        for i = 2:root_n
                if n%i == 0
                        return 0
                end
        end
        return 1
end



function prime_main(n)
	for i = 1:n
		if is_prime(i) == 1
			global numprimes += 1
		end
        end
	println("Number of primes:")
	return numprimes
end


prime_main(n)


println(numprimes)

numprimes = 0;

