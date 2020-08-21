#include "AudioMixHeper.h"
#include <thread>
#include <iostream>

#include "modules/audio_mixer/audio_mixer_impl.h"


int16_t s_buf[960] = { 0 };
AudioMixHeper::AudioMixHeper(int ssrc, int sample, const std::string &fileName)
	: m_ssrc(ssrc)
	, m_fileName(fileName)
	, m_sample(sample)
{
	errno_t error =  fopen_s(&m_file, fileName.c_str(), "rb");
	if (m_file) {
		fseek(m_file, 44, SEEK_SET);
	}
}

AudioMixHeper::~AudioMixHeper()
{
	if (m_file) {
		fclose(m_file);
		m_file = nullptr;
	}
}

webrtc::AudioMixer::Source::AudioFrameInfo AudioMixHeper::GetAudioFrameWithInfo(int sample_rate_hz, webrtc::AudioFrame * audio_frame)
{
	size_t readSize = 0;
	if (m_file) {
		readSize = fread(s_buf, 160 * 2, 1, m_file);
		/*if (readSize != 1) {
			std::cout << "maybe read all file" << std::endl;
			return webrtc::AudioMixer::Source::AudioFrameInfo::kError;
		}*/
	}
	else {
		return webrtc::AudioMixer::Source::AudioFrameInfo::kError;
	}
	
	std::thread::id thread_id = std::this_thread::get_id();
	std::cout << "this thread id=";
	thread_id._To_text(std::cout);
	std::cout << std::endl;
	audio_frame->UpdateFrame(0, s_buf, 160, SAMPLE_RATE, 
		webrtc::AudioFrame::SpeechType::kNormalSpeech, 
		webrtc::AudioFrame::VADActivity::kVadUnknown, 1);

	printf(",ssrc %d get audio frame, muted: %d, n %d, s %d\n", m_ssrc, 
		int(audio_frame->muted()), audio_frame->num_channels_, audio_frame->sample_rate_hz_);

	return webrtc::AudioMixer::Source::AudioFrameInfo::kNormal;
}

int AudioMixHeper::Ssrc() const
{
	return m_ssrc;
}

int AudioMixHeper::PreferredSampleRate() const
{
	return m_sample;
}
