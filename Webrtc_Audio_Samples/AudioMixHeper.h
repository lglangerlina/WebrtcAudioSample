#pragma once

#include "modules/audio_mixer/audio_mixer_impl.h"

class AudioMixHeper : public webrtc::AudioMixer::Source
{
public:
	AudioMixHeper(int ssrc, int sample, int channel, const std::string &fileName);
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
	int			m_channel;
	FILE		*m_file = nullptr;
	int			m_samplePerChannel;
};

