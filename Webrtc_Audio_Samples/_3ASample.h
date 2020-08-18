#pragma once

#define MAX_DEVICE_ID_LEN 512

#include "modules/audio_device/win/audio_device_core_win.h"
#include "modules/audio_device/audio_device_buffer.h"
#include "rtc_base/task_queue_win.h"
#include "audio/audio_transport_impl.h"
#include "modules/audio_device/include/audio_device_data_observer.h"
#include "modules/audio_mixer/audio_mixer_impl.h"
#include "modules/audio_processing/audio_processing_impl.h"

class _3ASample
{
public:
	_3ASample();
	~_3ASample();

	int init();
	bool setRecordingDevice(const char deviceId[MAX_DEVICE_ID_LEN]);

private:
	rtc::scoped_refptr<webrtc::AudioDeviceModule> m_audioDevice = nullptr;
	webrtc::AudioTransportImpl	*m_audioTransport = nullptr;

	rtc::scoped_refptr<webrtc::AudioMixerImpl> m_audioMixer;
	webrtc::AudioProcessingImpl*	m_apm = nullptr;
};

