 /*********************************************************
 * Projeto.: Temporizador para tempos longos ua          *
 *-------------------------------------------------------*
 * SUMARIO DO PROJETO.:                                  *
 * Gera tempos longos para ser testado com MQTT          *
 * Gerando tempos no intervalo de 1 min ate 1 hora atraves *
 * da programacao de chaves (4 ao todos)                 *
 * ------------------------------------------------------*
 * CLIENTE.:   Prototipo                                 *
 * AUTOR  .:   Renato Correa                             *
 * DATA   .:   20201027                                  *
 * Mod.PIC.:   16F73                                     *
 * Arquivo.:   16F73_TemposLongos.c                      *
 * Versoes.:                                             *
 * VER  |DESCRICAO                            | DATA     *
 *  1.00|INICIAL                              | 20201027 *
 *                                                       *
 *                                                       *
 * CLK.: Oscillator RC                                   *
 * FREQ.: Indeterminda R= 10K e C = 22nF                 *
 *                                                       *
 * Portas utilizadas (SAIDAS).:                          *
 * RC3 = LED                                             *
 * RC4 = RELE                                            *
 *                                                       *
 * Portas utilizadas (ENTRADAS).:                        *
 * RB5 = CH1                                             *
 * RB4 = CH2                                             *
 * RB2 = CH3                                             *
 * RB1 = CH4                                             *
 *                                                       *
 * CONFIG.:  $2007 : 0x001B                              *
 *                                                       *
 * OBS.:                                                 *
 *                                                       *
 *                                                       *
 *                                                       *
 *                                                       *
 *********************************************************/

#define LED RC3_bit
#define RELE RC4_bit
#define CH1 RB5_bit
#define CH2 RB4_bit
#define CH3 RB2_bit
#define CH4 RB1_bit


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
        LED = 1;
        delay_ms(80);
        LED = 0;
        delay_ms(300);
   }
}



void main()
 {
     TRISA      = 0xFF;
     TRISB      = 0b11111111;  // Todas PORT.B usadas como entrada
     //    bits =   76543210
     TRISC      = 0b11100111;  // Usa PORTC.3 e PORTC.4 como saida
     OPTION_REG = 0x03;       //Resistores de pull-up internos habilitados

     ini();
     delay_ms(1000);
     RELE = 0;

     while(1)
     {

      //Verifica qual chave esta acionada para definir a temporizacao:

      if(CH1 == 0)//CH1 foi ativada
      {
       delay_s = 5;
       delay_m = 1;
      }
      if(CH2 == 0)//CH1 foi ativada
      {
       delay_s = 60;
       delay_m = 5;
      }
      
      if(CH3 == 0)//CH1 foi ativada
      {
       delay_s = 60;
       delay_m = 30;
      }
      if(CH4 == 0)//CH1 foi ativada
      {
       delay_s = 60;
       delay_m = 60;
      }
     /*else  // Nenhuma chave foi ativada
      {
       delay_s = 5;
       delay_m = 1;
      }*/
      
      LED = 1;
      RELE = 1;
      segundos(delay_s);
      LED = 0;
      RELE = 0;
      minutos(delay_m);

      delay_ms(500);
     }
}