//
// Copyright(C) Simon Howard
//
// Permission to use, copy, modify, and/or distribute this software for any
// purpose with or without fee is hereby granted, provided that the above
// copyright notice and this permission notice appear in all copies.
//
// THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
// WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
// MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
// SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
// WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
// ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR
// IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
//
//
// UDP bouncer
//

#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>

#include <netdb.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <unistd.h>

// read buffer size
#define BUFSIZE 128

void hexdump(char *bytes, int len)
{
	int i;

	for (i = 0; i < len; ++i) {
		printf("%02x", bytes[i] & 0xff);
		if ((i % 16) == 15) {
			printf("\n");
		} else if ((i % 4) == 3) {
			printf(" ");
		}
	}
	if ((len % 16) != 0) {
		printf("\n");
	}
}

int main(int argc, char *argv[])
{
    struct hostent *hent;
    struct sockaddr_in in;
    struct sockaddr_in client, server;
    int sock;

    if (argc < 4)
    {
        printf("usage: %s <listening port> <host> <portnum>\n", argv[0]);
        exit(-1);
    }

    // resolve the destination address now before
    // we start waiting for connections

    if(!(hent = gethostbyname(argv[2])))
    {
        perror("cant resolve destination address");
        exit(-1);
    }

    server.sin_family = AF_INET;
    server.sin_addr.s_addr = ((struct in_addr *) hent->h_addr)->s_addr;
    server.sin_port = htons(atoi(argv[3]));

    // set up listening socket and wait for a connection

    sock = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);

    memset ( &in, 0, sizeof ( struct sockaddr_in ) );

    in.sin_family = AF_INET;
    in.sin_addr.s_addr = INADDR_ANY;
    in.sin_port = htons(atoi(argv[1]));

    if(bind(sock, (struct sockaddr *) &in, sizeof (struct sockaddr_in)) < 0)
    {
        perror("cant bind socket");
        exit(-1);
    }

    while(1)
    {
        int bytes;
        struct sockaddr_in src;
        socklen_t addrlen;
        char buf[1500];

        addrlen = sizeof(struct sockaddr_in);

        bytes = recvfrom(sock, buf, sizeof(buf), 0, (struct sockaddr *) &src, &addrlen);

        if (bytes <= 0)
        {
            continue;
        }

        // did this come from the server?

        if (src.sin_addr.s_addr == server.sin_addr.s_addr
         && src.sin_port == server.sin_port)
        {
            // yes, so send to the client

            addrlen = sizeof(struct sockaddr_in);

            sendto(sock, buf, bytes, 0, (struct sockaddr *) &client, addrlen);
	    printf("<-\n");
        }
        else
        {
            // this came from another machine
            // - assume this other machine is the client. save the
            // client address

            memcpy(&client, &src, sizeof(struct sockaddr_in));

            // forward to the server

            addrlen = sizeof(struct sockaddr_in);

            sendto(sock, buf, bytes, 0, (struct sockaddr *) &server, addrlen);
	    printf("->\n");
        }
	hexdump(buf, bytes);
    }
}

