#!/opt/sw/julia-1.1.1/bin/julia

using Distributed
using Printf
n = 10000000;
numprimes = 0;
perProc = n/(nprocs()-1)

function is_prime(n)
        if n == 0 || n == 1
                return 0
        elseif n == 2
                return 1
        end
        root_n = sqrt(n)
        for i = 2:root_n
                if n%i == 0
                        return 0
                end
        end
        return 1
end

function prime_main()
	temp = 0;
	mystart = (myid()-2)*perProc
	myend = (myid()-1)*perProc
	@printf "worker %d has start %d and end %d\n" myid() mystart myend
	for i = mystart:myend
                if is_prime(i) == 1
			global numprimes += 1
			temp += 1
		end
	end
	println("Number of primes within prime_main:")
	println(temp)
    return temp
end


#temp = prime_main(n)
#@printf "temp in worker %d: %d\n" myid() temp

sum = 0

if(myid() == 1)
	#sum up primes from other workers
	futures = Array{Future, 1}(undef, (nprocs()-1))
	calcstart = time()
	for i = 2:nprocs()
<<<<<<< HEAD
		# global sum .+= remotecall_fetch(prime_main, i)
		global sum = remotecall(prime_main, nprocs()-1)
=======
		futures[i-1] = remotecall(prime_main, i)
	end
	for i = 2:nprocs()
		global sum += fetch(futures[i-1])
>>>>>>> 0c2444458ab4fddfd3927e66aada761add60f49b
	end
	fetch(sum)
	println("Number of Primes: ")
	# println(sum)
	calcend = time()
	# @printf "total time taken: %f\n" (calcend - calcstart)
end

# println("Number of Primes outside prime_main: ")
# println(sum)

numprimes = 0;
