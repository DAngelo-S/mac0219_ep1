if [ "$#" -ne 1 ]; then
	echo "Por favor, digite um único argumento, na forma:
	        .\create_data.sh <num_testes>"
	exit
fi

if [ $1 -lt 10 ]; then
	echo "O numero minimo de testes é 10"
	NUM_TESTS=10
else
	NUM_TESTS=$1
fi

SIZE=("16"
      "32"
      "64"
      "128"
      "256"
      "512"
      "1024"
      "2048"
      "4096"
      "8192"
)

N_THREADS=("1"
           "2"
	   "4"
	   "8"
	   "16"
	   "32"
)

i=0
while [ $i -ne ${SIZE[@]} ]; do
	S=${SIZE[$i]}
	j=0
	while [ $j -ne ${N_THREADS[@]} ]; do
		T=${N_THREADS[$j]}
		./report_generator.sh $NUM_TESTS $T $S
		mv Reports Data/Reports_T"$T"_S"$S"
		let "j=j+1"
	done
	let "i=i+1"
done
