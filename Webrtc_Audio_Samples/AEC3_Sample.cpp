#include "AEC3_Sample.h"

AEC3_Sample::AEC3_Sample()
{
}

AEC3_Sample::~AEC3_Sample()
{
}

void AEC3_Sample::init()
{
	echo_controller = absl::make_unique<EchoCanceller3>(
		EchoCanceller3Config(), 16000, true);
}
