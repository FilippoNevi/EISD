 #include "mult_LT.hh"

mult_LT::mult_LT(sc_module_name name_)
	: sc_module(name_)
	, target_socket("target_socket")
	, pending_transaction(NULL)
{
	target_socket(*this);
}

void mult_LT::b_transport(tlm::tlm_generic_payload& trans, sc_time& t) {
	timing_annotation = SC_ZERO_TIME;

	ioDataStruct = *((iostruct*) trans.get_data_ptr());

	if (trans.is_write()) {
		mult_function();
		ioDataStruct.result = tmp_result;
		*((iostruct*) trans.get_data_ptr()) = ioDataStruct;
		trans.set_response_status(tlm::TLM_OK_RESPONSE);
	}
	else if(trans.is_read()) {
		ioDataStruct.result = tmp_result;
		*((iostruct*) trans.get_data_ptr()) = ioDataStruct;
	}

	t += timing_annotation;
}

bool mult_LT::get_direct_mem_ptr(tlm::tlm_generic_payload& trans, tlm::tlm_dmi& dmi_data) {
	return false;
}

unsigned int mult_LT::transport_dbg(tlm::tlm_generic_payload& trans) {
	return 0;
}

void mult_LT::mult_function() {
	tmp_result = (ioDataStruct.datain_a) * (ioDataStruct.datain_b);
	timing_annotation += sc_time(100, SC_NS);
}

void mult_LT::end_of_elaboration() {}

void mult_LT::reset() {}

tlm::tlm_sync_enum mult_LT::nb_transport_fw(tlm::tlm_generic_payload& trans, tlm::tlm_phase& phase, sc_time& t) {
	return tlm::TLM_COMPLETED;
}