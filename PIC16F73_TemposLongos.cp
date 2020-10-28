#line 1 "L:/Microcontroladores/PIC/Projetos/PIC16F73_TemposLongos/PIC16F73_TemposLongos.c"
#line 49 "L:/Microcontroladores/PIC/Projetos/PIC16F73_TemposLongos/PIC16F73_TemposLongos.c"
unsigned delay_s = 3;
unsigned delay_m = 1;

void segundos(unsigned seg)
{
 unsigned cont;
 for(cont = 0; cont < seg; cont++)
 {
 delay_ms(1000);
 }
}

void minutos(unsigned minut)
{
 unsigned cont;
 for(cont = 0; cont < minut; cont++)
 {
 delay_ms(60000);
 }
}

void ini()
{
 unsigned char cont;
 for(cont = 0; cont < 10; cont++)
 {
  RC3_bit  = 1;
 delay_ms(80);
  RC3_bit  = 0;
 delay_ms(300);
 }
}



void main()
 {
 TRISA = 0xFF;
 TRISB = 0b11111111;

 TRISC = 0b11100111;
 OPTION_REG = 0x03;

 ini();
 delay_ms(1000);
  RC4_bit  = 0;

 while(1)
 {



 if( RB5_bit  == 0)
 {
 delay_s = 5;
 delay_m = 1;
 }
 if( RB4_bit  == 0)
 {
 delay_s = 60;
 delay_m = 5;
 }

 if( RB2_bit  == 0)
 {
 delay_s = 60;
 delay_m = 30;
 }
 if( RB1_bit  == 0)
 {
 delay_s = 60;
 delay_m = 60;
 }
#line 128 "L:/Microcontroladores/PIC/Projetos/PIC16F73_TemposLongos/PIC16F73_TemposLongos.c"
  RC3_bit  = 1;
  RC4_bit  = 1;
 segundos(delay_s);
  RC3_bit  = 0;
  RC4_bit  = 0;
 minutos(delay_m);

 delay_ms(500);
 }
}
