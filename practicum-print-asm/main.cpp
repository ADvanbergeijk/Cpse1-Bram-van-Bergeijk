#include "hwlib.hpp"

extern "C" void uart_put_char( char c ){
   hwlib::cout << c;
}

extern "C" void print_asciz( const char * s );

extern "C" void application();
//{
  // print_asciz( "Hello world\n" );	
//}

void print_ascizz( const char * s ){
   while( *s != '\0'){
      uart_put_char( *s );
      ++s;
   }
}
/*
extern "C" char toggle(char s){
	if(s >= 'a' && s <= 'z'){
		s -= 32;
	}
	else if(s >= 'A' && s <= 'Z'){
		s += 32;
	}
	 return s;
}
*/
int main( void ){	
   
   namespace target = hwlib::target;   
    
      // wait for the PC console to start
   hwlib::wait_ms( 2000 );
   /*const char* a = "hello";
   const char* b = toggle(a);
   print_asciz(a);
   print_asciz(b);*/
	application();
   
}