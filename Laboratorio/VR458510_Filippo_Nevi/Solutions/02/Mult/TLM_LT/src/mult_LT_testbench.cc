#include "mult_LT_testbench.hh"

void mult_LT_testbench::run() {
	sc_time local_time = m_qk.get_local_time();

	iostruct mult_packet;
	tlm::tlm_generic_payload payload;

	mult_packet.datain_a = (rand() % 256);
	mult_packet.datain_b = (rand() % 256);
	cout << "Operation: " << mult_packet.datain_a << " * " << mult_packet.datain_b << endl;
	payload.set_data_ptr((unsigned char*) &mult_packet);
	payload.set_address(0);
	payload.set_write();

	local_time = m_qk.get_local_time();

	initiator_socket->b_transport(payload, local_time);

	if (payload.get_response_status() == tlm::TLM_OK_RESPONSE) {
		cout <<"[TB] TLM protocol correcly implemented" << endl;
		cout <<"[TB] Result is: " << mult_packet.result << endl;
	}

	cout << "Time: " << sc_time_stamp() << " + " << local_time << endl;
	m_qk.set(local_time);
	if (m_qk.need_sync()) {
		m_qk.sync();
	}
	sc_stop();
}

mult_LT_testbench::mult_LT_testbench(sc_module_name name)
	: sc_module(name)
{
	initiator_socket(*this);

	SC_THREAD(run);

	m_qk.set_global_quantum(sc_time(500, SC_NS));
	m_qk.reset();
}

void mult_LT_testbench::invalidate_direct_mem_ptr(uint64 start_range, uint64 end_range) {}

tlm::tlm_sync_enum mult_LT_testbench::nb_transport_bw(tlm::tlm_generic_payload& trans, tlm::tlm_phase& phase, sc_time& t) {
	return tlm::TLM_COMPLETED;
}