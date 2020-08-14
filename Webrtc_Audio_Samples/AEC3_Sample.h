#pragma once

#include "modules/audio_processing/aec3/echo_canceller3.h"

using namespace webrtc;
class AEC3_Sample
{
public:
	AEC3_Sample();
	~AEC3_Sample();


	void init();

private:
	std::unique_ptr<EchoControl> echo_controller;
};

