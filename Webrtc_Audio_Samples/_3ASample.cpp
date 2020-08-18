#include "_3ASample.h"
#include "rtc_base/logging.h"
#include "absl/strings/string_view.h"
#include "rtc_base/ref_counted_object.h"

#include <iostream>


using namespace std;
//webrtc::AudioMixerImpl* 	_3ASample::m_apm = nullptr;

_3ASample::_3ASample()
{
	webrtc::Config conig;
	m_audioMixer = webrtc::AudioMixerImpl::Create();
	m_apm = new rtc::RefCountedObject<webrtc::AudioProcessingImpl>(conig);
	if (m_apm->Initialize() != webrtc::AudioProcessing::kNoError) {
		delete m_apm;
		m_apm = nullptr;
	}

	m_audioTransport = new webrtc::AudioTransportImpl(m_audioMixer, m_apm);
	m_audioDevice = webrtc::CreateAudioDeviceWithDataObserver(
		webrtc::AudioDeviceModule::AudioLayer::kPlatformDefaultAudio,
		nullptr);
}

_3ASample::~_3ASample()
{
}

int _3ASample::init()
{
	//log
	rtc::LogMessage::LogToDebug(rtc::LoggingSeverity::LS_VERBOSE);
	rtc::LogMessage::SetLogToStderr(true);

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

	m_audioDevice->RegisterAudioCallback(m_audioTransport);
	m_audioDevice->StartRecording();
	return 0;
}

bool _3ASample::setRecordingDevice(const char deviceId[MAX_DEVICE_ID_LEN])
{
	return false;
}
