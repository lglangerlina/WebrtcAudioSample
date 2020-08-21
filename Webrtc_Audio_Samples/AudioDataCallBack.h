#pragma once
#include "modules/audio_device/include/audio_device_data_observer.h"

#include <iostream>

class AudioDataCallBack : public webrtc::AudioDeviceDataObserver
{
private:
	FILE *m_captureFile = nullptr;
	FILE *m_renderFile = nullptr;

public:
	AudioDataCallBack()
	{
		errno_t error_c = fopen_s(&m_captureFile, "captured.pcm", "wb");
		errno_t error_r = fopen_s(&m_renderFile, "renderd.pcm", "wb");

		if (error_c != 0 || error_r != 0) {
			std::cout << "open file failed" << std::endl;
		}
	}

	~AudioDataCallBack()
	{
	}

	virtual void OnCaptureData(const void* audio_samples,
		const size_t num_samples,
		const size_t bytes_per_sample,
		const size_t num_channels,
		const uint32_t samples_per_sec) override 
	{
		std::cout << "capture audio data arrived" << std::endl;
		if (m_captureFile) {
			fwrite(audio_samples, num_samples, bytes_per_sample, m_captureFile);
		}
	}

	virtual void OnRenderData(const void* audio_samples,
		const size_t num_samples,
		const size_t bytes_per_sample,
		const size_t num_channels,
		const uint32_t samples_per_sec) override 
	{
		if (m_renderFile) {
			fwrite(audio_samples, num_samples, bytes_per_sample, m_renderFile);
		}
	}
};

