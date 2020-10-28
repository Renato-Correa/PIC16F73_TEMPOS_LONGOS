# PIC16F73_TEMPOS_LONGOS
Cria um timer para tempos longos usando o PIC 16F73


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
