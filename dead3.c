#include <stdio.h>
#include "mpi.h"
#include <ctype.h>

int main(){//int argc,char *argv[]){
	int size, rank, dest, source, count, tag=1;
	char inmsg, outmsg='a';
	MPI_Status Stat;

	MPI_Init(NULL,NULL);//&argc,&argv);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);

	if (rank == 0) {
	  dest = 1;
	  source = 1;
	  //MPI_Recv(&inmsg, 1, MPI_CHAR, source, tag, MPI_COMM_WORLD, &Stat);
	  //MPI_Send(&outmsg, 1, MPI_CHAR, dest, tag, MPI_COMM_WORLD);
	  MPI_Sendrecv (&outmsg, 1,  MPI_CHAR, dest, tag,
		&inmsg, 1, MPI_CHAR, source, tag, MPI_COMM_WORLD, &Stat);
	}else if (rank == 1) {
	  dest = 0;
	  source = 0;
	  MPI_Sendrecv (&outmsg, 1,  MPI_CHAR, dest, tag,
		&inmsg, 1, MPI_CHAR, source, tag, MPI_COMM_WORLD, &Stat);
	 }

	MPI_Get_count(&Stat, MPI_CHAR, &count);
	printf("Task %d: Received %d char(s) from task %d with tag %d \n",
		   rank, count, Stat.MPI_SOURCE, Stat.MPI_TAG);

	MPI_Finalize();
}
