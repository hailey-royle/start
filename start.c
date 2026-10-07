#include <stdint.h>

struct array {
	int8_t* data;
	int64_t count;
};

struct arguments {
	struct array* data;
	int64_t count;
};

void exit_syscall( int8_t code );
void write_syscall( int32_t fd, int8_t* buf, int64_t count );

void start( struct arguments argument ){
	int32_t i = 0;
	while( i < argument.count ){
		write_syscall( 1, argument.data[ i ].data, argument.data[ i ].count );
		i += 1;
	}
	exit_syscall( 0 );
}
