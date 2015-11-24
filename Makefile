run: compile
	mpirun -np 8 --hostfile machinefile /shared/openmpi_demo
compile:
	mpicc openmpi_demo.c -o /shared/openmpi_demo
clean:
	rm -rf /shared/openmpi_demo
ex1: example1
	mpirun -np 2 --hostfile machinefile /shared/ex1
example1:
	mpicc mpiExample1.c -o /shared/ex1
ex2: example2
	mpirun -np 8 --hostfile machinefile /shared/ex2
example2:
	mpicc mpiExample2.c -o /shared/ex2
ex3: example3
	mpirun --mca btl_tcp_if_exclude lo,eth0 -np 2 --hostfile machinefile /shared/ex3
example3:
	mpicc mpiExample3.c -o /shared/ex3
ex4: example4
	mpirun --mca btl_tcp_if_exclude lo,eth0 -np 8 --hostfile machinefile /shared/ex4
example4:
	mpicc mpiExample4.c -o /shared/ex4
ex7: example7
	mpirun --mca btl_tcp_if_exclude lo,eth0 -np 8 --hostfile machinefile /shared/ex7
example7:
	mpicc mpiExample7.c -o /shared/ex7
ta1: tarea1
	mpirun --mca btl_tcp_if_exclude lo,eth0 -np 2 --hostfile machinefile /shared/ta1
tarea1:
	mpicc tarea1.c -o /shared/ta1
de1: dead1
	mpirun --mca btl_tcp_if_exclude lo,eth0 -np 2 --hostfile machinefile /shared/de1
dead1:
	mpicc dead1.c -o /shared/de1
de2: dead2
	mpirun --mca btl_tcp_if_exclude lo,eth0 -np 2 --hostfile machinefile /shared/de2
dead2:
	mpicc dead2.c -o /shared/de2
de3: dead3
	mpirun --mca btl_tcp_if_exclude lo,eth0 -np 2 --hostfile machinefile /shared/de3
dead3:
	mpicc dead3.c -o /shared/de3
