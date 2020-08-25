#include "_3ASample.h"
#include "rtc_base/logging.h"
#include "absl/strings/string_view.h"
#include "rtc_base/ref_counted_object.h"
#include "AudioMixHeper.h"
#include "AudioDataCallBack.h"
#include "Utils.h"

#include <iostream>


using namespace std;

_3ASample::_3ASample()
{
	//log
	//rtc::LogMessage::LogToDebug(rtc::LoggingSeverity::LS_VERBOSE);
	//rtc::LogMessage::SetLogToStderr(true);
}

_3ASample::~_3ASample()
{
	if (m_audioDevice) {
		m_audioDevice->StopRecording();
		m_audioDevice->StopPlayout();
	}

	if (m_audioMixer) {
		m_audioMixer.get()->RemoveSource(m_audioSrc1);
		m_audioMixer.get()->RemoveSource(m_audioSrc2);
	}

	if (m_audioTransport) {
		delete m_audioTransport;
		m_audioTransport = nullptr;
	}
}

int _3ASample::init()
{
	initApm();
	m_audioDevice = webrtc::CreateAudioDeviceWithDataObserver(
		webrtc::AudioDeviceModule::AudioLayer::kPlatformDefaultAudio,
		nullptr);

	if (initRecordAudioDevice() < 0) {
		return -1;
	}

	if (initPlayoutAudioDevice() < 0) {
		return -1;
	}
	
	return 0;
}

bool _3ASample::setRecordingDevice(const char deviceId[MAX_DEVICE_ID_LEN])
{
	return false;
}

void _3ASample::initApm()
{
	webrtc::AudioProcessing::Config audioConfig;
	audioConfig.pre_amplifier.enabled = false;

	audioConfig.gain_controller1.enabled = true;
	audioConfig.gain_controller1.mode = audioConfig.gain_controller1.kAdaptiveAnalog;
	audioConfig.gain_controller1.analog_level_minimum = 0;
	audioConfig.gain_controller1.analog_level_maximum = 255;
	audioConfig.gain_controller1.enable_limiter = true;
	audioConfig.gain_controller1.compression_gain_db = 9;
	audioConfig.gain_controller1.target_level_dbfs = 3;

	audioConfig.high_pass_filter.enabled = true;
	audioConfig.residual_echo_detector.enabled = true;
	audioConfig.voice_detection.enabled = true;

	audioConfig.echo_canceller.enabled = true;
	audioConfig.echo_canceller.mobile_mode = false;
	audioConfig.echo_canceller.legacy_moderate_suppression_level = false;
	audioConfig.echo_canceller.use_legacy_aec = false;

	audioConfig.noise_suppression.enabled = true;
	audioConfig.noise_suppression.level = audioConfig.noise_suppression.kHigh;

	audioConfig.gain_controller2.enabled = false;
	audioConfig.level_estimation.enabled = false;


	std::string exePath;
	Utils::GetProjectExecuteDir(exePath);
	std::string stdSrc0 = exePath + "res\\audio_file\\pcm\\pcm_48k_2c_00.pcm";
	std::string stdSrc1 = exePath + "res\\audio_file\\pcm\\pcm_48k_2c_01.pcm";
	std::string stdSrc2 = exePath + "res\\audio_file\\pcm\\pcm_48k_2c_02.pcm";
	std::string stdSrc3 = exePath + "res\\audio_file\\pcm\\pcm_48k_2c_03.pcm";

	webrtc::Config conig;
	m_audioMixer = webrtc::AudioMixerImpl::Create();
	m_audioSrc1 = new AudioMixHeper(1, 48000, 2, stdSrc0);
	m_audioSrc2 = new AudioMixHeper(2, 48000, 2, stdSrc1);

	m_audioMixer.get()->AddSource(m_audioSrc1);
	m_audioMixer.get()->AddSource(m_audioSrc2);
	m_apm = new rtc::RefCountedObject<webrtc::AudioProcessingImpl>(conig);
	if (m_apm->Initialize() != webrtc::AudioProcessing::kNoError) {
		delete m_apm;
		m_apm = nullptr;
	}

	m_apm->ApplyConfig(audioConfig);
	m_audioTransport = new webrtc::AudioTransportImpl(m_audioMixer, m_apm);
}

int _3ASample::initRecordAudioDevice()
{
	if (m_audioDevice == nullptr) {
		cout << "audio device = nullptr";
		return -1;
	}
	int32_t ret = m_audioDevice->Init();

	if (ret < 0) {
		cout << "init failed" << endl;
		return -1;
	}

	if (m_audioDevice->RecordingDevices() > 0) {
		m_audioDevice->SetRecordingDevice(0);
	}

	ret = m_audioDevice->InitRecording();
	if (ret < 0) {
		cout << "InitRecording failed" << endl;
		return -1;
	}

	ret = m_audioDevice->InitMicrophone();
	if (ret < 0) {
		cout << "InitMicrophone failed" << endl;
		return -1;
	}

	
	if (m_audioDevice->StartRecording() < 0) {
		cout << "StartRecording failed" << endl;
		return -1;
	}

	m_audioDevice->RegisterAudioCallback(m_audioTransport);
	AudioDataCallBack *audioDataCallback = new AudioDataCallBack;
	((webrtc::ADMWrapper*)m_audioDevice.get())->RegisterObserver(audioDataCallback);
	return 0;
}

int _3ASample::initPlayoutAudioDevice()
{
	if (m_audioDevice == nullptr) {
		cout << "audio device = nullptr";
		return -1;
	}
	int32_t ret = m_audioDevice->Init();

	if (ret < 0) {
		cout << "init failed" << endl;
		return -1;
	}

	if (m_audioDevice->PlayoutDevices() > 0) {
		m_audioDevice->SetPlayoutDevice(0);
	}

	ret = m_audioDevice->InitPlayout();
	if (ret < 0) {
		cout << "InitRecording failed" << endl;
		return -1;
	}

	ret = m_audioDevice->InitSpeaker();
	if (ret < 0) {
		cout << "InitSpeaker failed" << endl;
		return -1;
	}

	if (m_audioDevice->StartPlayout() < 0) {
		cout << "StartRecording failed" << endl;
		return -1;
	}

	//m_audioDevice->RegisterAudioCallback(m_audioTransport);
	return 0;
}
