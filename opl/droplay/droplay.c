#include <stdio.h>
#include <stdlib.h>

#include <unistd.h>
#include <sys/io.h>

#define HEADER_STRING "DBRAWOPL"
#define ADLIB_PORT 0x388

void write_reg(unsigned int reg, unsigned int val)
{
    int i;

    outb(reg, ADLIB_PORT);

    for (i=0; i<6; ++i)
    {
        inb(ADLIB_PORT);
    }

    outb(val, ADLIB_PORT + 1);

    for (i=0; i<35; ++i)
    {
        inb(ADLIB_PORT);
    }
}

void clear_all_regs(void)
{
    int i;

    for (i=0; i<=0xff; ++i)
    {
	write_reg(i, 0x00);
    }
}

void init(void)
{
    if (ioperm(ADLIB_PORT, 2, 1) != 0)
    {
        fprintf(stderr, "Failed to get IO permissions\n");
        exit(-1);
    }

    write_reg(4, 0x60);
    write_reg(4, 0x80);
    int val1 = inb(ADLIB_PORT) & 0xe0;
    write_reg(2, 0xff);
    write_reg(4, 0x21);
    usleep(50);
    int val2 = inb(ADLIB_PORT) & 0xe0;
    write_reg(4, 0x60);
    write_reg(4, 0x80);

    if (val1 != 0 || val2 != 0xc0)
    {
        fprintf(stderr, "Adlib not detected\n");
        exit(-1);
    }
}

void play_file(char *filename)
{
    FILE *stream;
    char buf[8];

    stream = fopen(filename, "rb");

    fread(buf, 1, 8, stream);

    if (strncmp(buf, HEADER_STRING, 8) != 0)
    {
        fprintf(stderr, "Raw OPL header not found\n");
        exit(-1);
    }

    fseek(stream, 28, SEEK_SET);

    while (!feof(stream))
    {
        int reg, val;

        reg = fgetc(stream);
        val = fgetc(stream);

        // Delay?

        if (reg == 0x00)
        {
            usleep(val * 1000);
        }
        else if (reg == 0x01)
        {
            val |= (fgetc(stream) << 8);
            usleep(val * 1000);
        }
        else
        {
            write_reg(reg, val);
        }
    }

    fclose(stream);
}

int main(int argc, char *argv[])
{
    if (argc < 2)
    {
        printf("Usage: %s <filename>\n", argv[0]);
        exit(-1);
    }

    init();
    clear_all_regs();
    sleep(1);

    play_file(argv[1]);

    clear_all_regs();
}

