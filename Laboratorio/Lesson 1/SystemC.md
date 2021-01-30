# SystemC

Design HW con una sintassi simile a C/C++ ma con alcune aggiunte:

implementare una definizione di segnali, circuiti;
supporta livelli di astrazione multipli;

sensitive: il mio processo è sensibile al segnale A (sensitive<<A;)

## Processi

Simili a funzioni C/C++. 

Sono di tre tipi:

- SC_METHOD

- SC_THREADS

- SC_CTHREAD (deprecati)

## Port e segnali

Usati per comunicare tra moduli/sottomoduli.

Port implementano metodi per leggere e scrivere su esse.

## Clock

Segnale che gestisce l'evoluzione del mio circuito.

**Suggerimento**: usare un clock definito manualmente, perché più efficiente in simulazione.

Thread sospeso ogni mezzo periodo di segnale (***T/2***). Cioè ogni *rising edge. 

## Data types

È meglio usare i tipi nativi, perché creati apposta per modellare hw. 

*sc_bit* è **più efficiente** di *sc_logic* nelle simulazioni.

## Register Transfer Level (RTL)

Livello più basso a cui utilizzare i livelli di definizione.

L'evoluzione del sistema è guidata da un *controller* e sincronizzata da un *clock*.

- FSM guida il prossimo stato; è un insieme di stati e le transizioni tra essi;

- Data Path guida l'elaborazione dei dati (calcoli); il DP è composto da elementi come mutiplexer, registri, ecc...

Flow:

- descrivi il comportamento del circuito con un modello ad alto livello (in genere Extended-FSM)

- determinare il datapath

- 

- 

### Procedimento

Rappresento FSMD come un modulo e processo singoli.

FSM è un processo, datapath è un altro processo e faccio interagire i due processi tra loro.

## ready queue

la coda di processi che possono essere eseguiti ma aspettano che il processo attuale finisca

## waiting queue

processi che aspettano eventi che possono essere notificati da altri processi, o un segnale nella loro sensitivity list che li triggeri

## running queue

processi che sono attualmente in esecuzione

Il primo processo che viene eseguito dalla ready queue è scelto casualmente dallo Scheduler SystemC tra quelli presenti nella queue.

Si tracciano i segnali nel main file: sc_trace(fp, div.STATE, "STATE");
