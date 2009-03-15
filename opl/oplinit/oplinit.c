
// plays a tone via the OPL chip
// this will not work if you don't have an OPL chip.

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/io.h>

#define PORT 0x388

void write_reg(int reg, int val)
{
	int i;

	outb(reg, PORT);

	for (i=0; i<6; ++i) {
		inb(PORT);
	}

	outb(val, PORT + 1);

	for (i=0; i<35; ++i) {
		inb(PORT);
	}
}

int main(int argc, char *argv[])
{
	char buf[64];

	if (ioperm(PORT, 4, 1) != 0)
	{
		printf("Failed to get permissions\n");
		exit(-1);
	}

	printf("got permissions\n");

	write_reg(4, 0x60);
	write_reg(4, 0x80);
	int val1 = inb(PORT) & 0xe0;
	write_reg(2, 0xff);
	write_reg(4, 0x21);
	sleep(1);
	int val2 = inb(PORT) & 0xe0;
	write_reg(4, 0x60);
	write_reg(4, 0x80);

	if (val1 == 0 && val2 == 0xc0)
	{
		printf("OPL detected\n");
	}
	else
	{
		printf("not detected - %i, %i\n", val1, val2);
		exit(-1);
	}

	// program a sound

	write_reg(0x20, 0x01);
	write_reg(0x40, 0x10);
	write_reg(0x60, 0xf0);
	write_reg(0x80, 0x77);
	write_reg(0xa0, 0x98);
	write_reg(0x23, 0x01);
	write_reg(0x43, 0x00);
	write_reg(0x63, 0xf0);
	write_reg(0x83, 0x77);
	write_reg(0xb0, 0x31);

	gets(buf);

	// turn the sound off

	write_reg(0xb0, 0x11);

	return 0;
}

