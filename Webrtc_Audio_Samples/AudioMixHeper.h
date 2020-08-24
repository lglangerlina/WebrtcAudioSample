#pragma once

#include "modules/audio_mixer/audio_mixer_impl.h"
#define SAMPLE_RATE 48000
#define CHANNELS	2
#define BIT			16

class AudioMixHeper : public webrtc::AudioMixer::Source
{
public:
	AudioMixHeper(int ssrc, int sample, const std::string &fileName);
	~AudioMixHeper();

protected:
	virtual AudioFrameInfo GetAudioFrameWithInfo(int sample_rate_hz,
		webrtc::AudioFrame* audio_frame) override;

	virtual int Ssrc() const override;

	virtual int PreferredSampleRate() const override;

private:
	int			m_ssrc;
	std::string m_fileName;
	int			m_sample;
	FILE		*m_file = nullptr;
	int			m_samplePerChannel;
};

