#ifndef _div_AT4_TESTBENCH_H_
#define _div_AT4_TESTBENCH_H_

#include <systemc.h>
#include <tlm.h>
#include "define_AT4.hh"

class div_AT4_testbench
  : public sc_module
  , public virtual tlm::tlm_bw_transport_if<>
{

private:

  SC_HAS_PROCESS(div_AT4_testbench);

  virtual void invalidate_direct_mem_ptr(uint64 start_range, uint64 end_range);

  virtual tlm::tlm_sync_enum nb_transport_bw(tlm::tlm_generic_payload &  trans, tlm::tlm_phase &  phase, sc_time &  t);

  void run();

  sc_event available_response;

  bool response_pending;



public:

  tlm::tlm_initiator_socket<> initiator_socket;

  div_AT4_testbench(sc_module_name name);

};

#endif
