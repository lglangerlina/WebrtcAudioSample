
#include "AudioMixHeper.h"
#include "modules/audio_mixer/audio_mixer_impl.h"
#include <thread>
#include <iostream>
#include <chrono>

#include "TestFile.h"

void testFileCopy()
{
	TestFileFunction function("D:/Down/audio/audio_long16noise.pcm", "copy_00.wav");
	function.copyData();
}

int main_testMix()
{
	rtc::scoped_refptr<webrtc::AudioMixerImpl> audioMixer = webrtc::AudioMixerImpl::Create();
	
	AudioMixHeper audioSrc1(1, SAMPLE_RATE, "D:/Down/audio/audio_16k_00.wav");
	AudioMixHeper audioSrc2(2, SAMPLE_RATE, "D:/Down/audio/audio_16k_01.wav");
	AudioMixHeper audioSrc3(3, SAMPLE_RATE, "D:/Down/audio/audio_16k_02.wav");
	AudioMixHeper audioSrc4(4, SAMPLE_RATE, "D:/Down/audio/audio_16k_03.wav");

	audioMixer.get()->AddSource(&audioSrc1);
	audioMixer.get()->AddSource(&audioSrc2);
	audioMixer.get()->AddSource(&audioSrc3);
	audioMixer.get()->AddSource(&audioSrc4);

	std::thread::id tid = std::this_thread::get_id();
	std::cout << "main thread id: ";
	tid._To_text(std::cout);
	std::cout << "  " << std::endl;

	webrtc::AudioFrame frame;
	FILE* fOut = nullptr;
	fopen_s(&fOut, "outmix.pcm", "wb");
	for (int i = 0; i < 100 * 10 *2; ++i) // only mix first 10 seconds audio
	{
		audioMixer.get()->Mix(1, &frame);
		if (fOut) {
			fwrite(frame.data(), 160*2, 1, fOut);
		}
		std::this_thread::sleep_for(std::chrono::milliseconds(10));
	}

	fclose(fOut);
	fOut = nullptr;
	audioMixer.get()->RemoveSource(&audioSrc1);
	audioMixer.get()->RemoveSource(&audioSrc2);
	audioMixer.get()->RemoveSource(&audioSrc3);
	audioMixer.get()->RemoveSource(&audioSrc4);
	tid = std::this_thread::get_id();

	std::cout << "exit main thread id: ";
	tid._To_text(std::cout);
	std::cout << std::endl;;


	return 0;
}