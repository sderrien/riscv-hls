#include<stdint.h>


enum t_cmd {
	RESET = '!',
	HALT = 'H',
	READ_MEM = 'M',
	WRITE_MEM = 'W',
	READ_REG = 'R',
	WRITE_REG = 'X',
	SET_BKPT= 'B',
	UNSET_BKPT= 'U',
	STEP = 'S',
	RUN = 'P',
	INFO = 'I',
	STATUS = 'T'
};

#define OK 'O'
#define NOK 'N'
