#include "tm4c123gh6pm.h"
#include <stdint.h>

void PortF_Init(void){ volatile unsigned long delay;
  SYSCTL_RCGC2_R |= 0x00000020;     // 1) activate clock for Port F
  delay = SYSCTL_RCGC2_R;           // allow time for clock to start
  GPIO_PORTF_LOCK_R = 0x4C4F434B;   // 2) unlock GPIO Port F
  GPIO_PORTF_CR_R = 0x1F;           // allow changes to PF4-0
  // only PF0 needs to be unlocked, other bits can't be locked
  GPIO_PORTF_AMSEL_R = 0x00;        // 3) disable analog on PF
  GPIO_PORTF_PCTL_R = 0x00000000;   // 4) PCTL GPIO on PF4-0
  GPIO_PORTF_DIR_R = 0x0E;          // 5) PF4,PF0 in, PF3-1 out
  GPIO_PORTF_AFSEL_R = 0x00;        // 6) disable alt funct on PF7-0
  GPIO_PORTF_PUR_R = 0x11;          // enable pull-up on PF0 and PF4
  GPIO_PORTF_DEN_R = 0x1F;          // 7) enable digital I/O on PF4-0
}

void Delay(void){unsigned long volatile time;
  time = 145448;  // 0.1sec
  while(time){
		time--;
  }
}

int main(void){ 
unsigned long Switch, Switch1, Switch2;	
  PortF_Init();  // Initialize PF0 and PF4 i/p and PF1-PF3 o/p
  while(1){
		Switch=GPIO_PORTF_DATA_R&0x01; //Read PF0 and PF4
		Switch1 = GPIO_PORTF_DATA_R&0x10;  
        Switch2 = GPIO_PORTF_DATA_R&0x01;


		if (!Switch1 && !Switch2) { 
				GPIO_PORTF_DATA_R |= 0x04;		    // if both switch on or off => this will turn on blue led
			Delay();
		} else if (!Switch1) { 						// If switch 1 is on => this will turn on red led
				GPIO_PORTF_DATA_R |= 0x02;
			Delay();
		} else if (!Switch2) { 						// if switch 2 is one => this will turn on green led
				GPIO_PORTF_DATA_R |= 0x08;
			Delay();
		} else { 									// if both switiches are closed => all leds are switched off
				GPIO_PORTF_DATA_R |= 0x00;
		}
		GPIO_PORTF_DATA_R &= ~0x0E;  // deallocate all
		Delay();
	}

}
