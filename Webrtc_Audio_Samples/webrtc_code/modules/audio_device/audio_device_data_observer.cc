/*
 *  Copyright (c) 2017 The WebRTC project authors. All Rights Reserved.
 *
 *  Use of this source code is governed by a BSD-style license
 *  that can be found in the LICENSE file in the root of the source
 *  tree. An additional intellectual property rights grant can be found
 *  in the file PATENTS.  All contributing project authors may
 *  be found in the AUTHORS file in the root of the source tree.
 */

#include "modules/audio_device/include/audio_device_data_observer.h"

#include "api/task_queue/global_task_queue_factory.h"
#include "modules/audio_device/include/audio_device_defines.h"
#include "rtc_base/checks.h"
#include "rtc_base/ref_counted_object.h"
#include "audio/utility/audio_frame_operations.h"
#include "rtc_base/task_queue_win.h"

#include "rtc_base/logging.h"

namespace webrtc {

ADMWrapper::ADMWrapper(AudioLayer audio_layer,
                       TaskQueueFactory* task_queue_factory,
                       AudioDeviceDataObserver* observer)
    : impl_(AudioDeviceModule::Create(audio_layer, task_queue_factory)),
      observer_(observer) {
  if (!impl_.get())
    return;
  // Register self as the audio transport callback for underlying ADM impl.
  auto res = impl_->RegisterAudioCallback(this);
  is_valid_ = (impl_.get() != nullptr) && (res == 0);
}

bool ADMWrapper::IsValid() {
  return is_valid_;
}

int32_t ADMWrapper::RecordedDataIsAvailable(const void* audioSamples,
                                            const size_t nSamples,
                                            const size_t nBytesPerSample,
                                            const size_t nChannels,
                                            const uint32_t samples_per_sec,
                                            const uint32_t total_delay_ms,
                                            const int32_t clockDrift,
                                            const uint32_t currentMicLevel,
                                            const bool keyPressed,
                                            uint32_t& newMicLevel) {
  int32_t res = 0;
  // Capture PCM data of locally captured audio.

  if (observer_) {

    if ((sample_rate_ != 0 && sample_rate_ != samples_per_sec) || (num_channels_ != 0 && num_channels_ != nChannels)) {
        
      if (!audio_frame_) {
          audio_frame_.reset(new AudioFrame());
      }

      audio_frame_->sample_rate_hz_ = sample_rate_;
      audio_frame_->num_channels_ = num_channels_;
      voe::RemixAndResample(static_cast<const int16_t*>(audioSamples), nSamples,
                            nChannels, samples_per_sec, &capture_resampler_,
                            audio_frame_.get());

      observer_->OnCaptureData(audio_frame_->data(),
                                audio_frame_->samples_per_channel_,
                                nBytesPerSample, audio_frame_->num_channels_,
                                audio_frame_->sample_rate_hz_);

    } else {
        observer_->OnCaptureData(audioSamples, nSamples, nBytesPerSample,
                                        nChannels, samples_per_sec);
    }
  }

  // Send to the actual audio transport.
  if (audio_transport_) {
    res = audio_transport_->RecordedDataIsAvailable(
        audioSamples, nSamples, nBytesPerSample, nChannels, samples_per_sec,
        total_delay_ms, clockDrift, currentMicLevel, keyPressed, newMicLevel);
  }

  return res;
}

ADMWrapper::~ADMWrapper() {
  audio_transport_ = nullptr;
  observer_ = nullptr;
}

int32_t ADMWrapper::NeedMorePlayData(const size_t nSamples,
                                     const size_t nBytesPerSample,
                                     const size_t nChannels,
                                     const uint32_t samples_per_sec,
                                     void* audioSamples,
                                     size_t& nSamplesOut,
                                     int64_t* elapsed_time_ms,
                                     int64_t* ntp_time_ms) {
  int32_t res = 0;
  // Set out parameters to safe values to be sure not to return corrupted
  // data.
  nSamplesOut = 0;
  *elapsed_time_ms = -1;
  *ntp_time_ms = -1;
  // Request data from audio transport.
  if (audio_transport_) {
    res = audio_transport_->NeedMorePlayData(
        nSamples, nBytesPerSample, nChannels, samples_per_sec, audioSamples,
        nSamplesOut, elapsed_time_ms, ntp_time_ms);
  }

  // Capture rendered data.
  if (observer_) {
    observer_->OnRenderData(audioSamples, nSamples, nBytesPerSample, nChannels,
                            samples_per_sec);
  }

  return res;
}

void ADMWrapper::PullRenderData(int bits_per_sample,
                                int sample_rate,
                                size_t number_of_channels,
                                size_t number_of_frames,
                                void* audio_data,
                                int64_t* elapsed_time_ms,
                                int64_t* ntp_time_ms) {
  RTC_NOTREACHED();
}

int32_t ADMWrapper::RegisterAudioCallback(AudioTransport* audio_callback) {
  // Remember the audio callback to forward PCM data
  audio_transport_ = audio_callback;
  return 0;
}

int32_t ADMWrapper::ActiveAudioLayer(AudioLayer* audio_layer) const {
  return impl_->ActiveAudioLayer(audio_layer);
}

int32_t ADMWrapper::Init() {
  return impl_->Init();
}

int32_t ADMWrapper::Terminate() {
  return impl_->Terminate();
}

bool ADMWrapper::Initialized() const {
  return impl_->Initialized();
}

int16_t ADMWrapper::PlayoutDevices() {
  return impl_->PlayoutDevices();
}

int16_t ADMWrapper::RecordingDevices() {
  return impl_->RecordingDevices();
}

int32_t ADMWrapper::PlayoutDeviceName(uint16_t index,
                                      char name[kAdmMaxDeviceNameSize],
                                      char guid[kAdmMaxGuidSize]) {
  return impl_->PlayoutDeviceName(index, name, guid);
}

int32_t ADMWrapper::RecordingDeviceName(uint16_t index,
                                        char name[kAdmMaxDeviceNameSize],
                                        char guid[kAdmMaxGuidSize]) {
  return impl_->RecordingDeviceName(index, name, guid);
}

int32_t ADMWrapper::SetPlayoutDevice(uint16_t index) {
  return impl_->SetPlayoutDevice(index);
}

int32_t ADMWrapper::SetPlayoutDevice(WindowsDeviceType device) {
  return impl_->SetPlayoutDevice(device);
}

int32_t ADMWrapper::SetRecordingDevice(uint16_t index) {
  return impl_->SetRecordingDevice(index);
}

int32_t ADMWrapper::SetRecordingDevice(WindowsDeviceType device) {
  return impl_->SetRecordingDevice(device);
}

int32_t ADMWrapper::PlayoutIsAvailable(bool* available) {
  return impl_->PlayoutIsAvailable(available);
}

bool ADMWrapper::PlayoutIsInitialized() const {
  return impl_->PlayoutIsInitialized();
}

int32_t ADMWrapper::RecordingIsAvailable(bool* available) {
  return impl_->RecordingIsAvailable(available);
}

int32_t ADMWrapper::InitRecording() {
  return impl_->InitRecording();
}

bool ADMWrapper::RecordingIsInitialized() const {
  return impl_->RecordingIsInitialized();
}

int32_t ADMWrapper::StartPlayout() {
  return impl_->StartPlayout();
}

int32_t ADMWrapper::StopPlayout() {
  return impl_->StopPlayout();
}

bool ADMWrapper::Playing() const {
  return impl_->Playing();
}

int32_t ADMWrapper::StartRecording() {
  return impl_->StartRecording();
}

int32_t ADMWrapper::StopRecording() {
  return impl_->StopRecording();
}

bool ADMWrapper::Recording() const {
  return impl_->Recording();
}

int32_t ADMWrapper::InitSpeaker() {
  return impl_->InitSpeaker();
}

bool ADMWrapper::SpeakerIsInitialized() const {
  return impl_->SpeakerIsInitialized();
}

int32_t ADMWrapper::InitMicrophone() {
  return impl_->InitMicrophone();
}

bool ADMWrapper::MicrophoneIsInitialized() const {
  return impl_->MicrophoneIsInitialized();
}

int32_t ADMWrapper::SpeakerVolumeIsAvailable(bool* available) {
  return impl_->SpeakerVolumeIsAvailable(available);
}

int32_t ADMWrapper::SetSpeakerVolume(uint32_t volume) {
  return impl_->SetSpeakerVolume(volume);
}

int32_t ADMWrapper::SpeakerVolume(uint32_t* volume) const {
  return impl_->SpeakerVolume(volume);
}

int32_t ADMWrapper::MaxSpeakerVolume(uint32_t* max_volume) const {
  return impl_->MaxSpeakerVolume(max_volume);
}

int32_t ADMWrapper::MinSpeakerVolume(uint32_t* min_volume) const {
  return impl_->MinSpeakerVolume(min_volume);
}

int32_t ADMWrapper::MicrophoneVolumeIsAvailable(bool* available) {
  return impl_->MicrophoneVolumeIsAvailable(available);
}

int32_t ADMWrapper::SetMicrophoneVolume(uint32_t volume) {
  return impl_->SetMicrophoneVolume(volume);
}

int32_t ADMWrapper::MicrophoneVolume(uint32_t* volume) const {
  return impl_->MicrophoneVolume(volume);
}

int32_t ADMWrapper::MaxMicrophoneVolume(uint32_t* max_volume) const {
  return impl_->MaxMicrophoneVolume(max_volume);
}

int32_t ADMWrapper::MinMicrophoneVolume(uint32_t* min_volume) const {
  return impl_->MinMicrophoneVolume(min_volume);
}

int32_t ADMWrapper::SpeakerMuteIsAvailable(bool* available) {
  return impl_->SpeakerMuteIsAvailable(available);
}

int32_t ADMWrapper::SetSpeakerMute(bool enable) {
  return impl_->SetSpeakerMute(enable);
}

int32_t ADMWrapper::SpeakerMute(bool* enabled) const {
  return impl_->SpeakerMute(enabled);
}

int32_t ADMWrapper::MicrophoneMuteIsAvailable(bool* available) {
  return impl_->MicrophoneMuteIsAvailable(available);
}

int32_t ADMWrapper::SetMicrophoneMute(bool enable) {
  return impl_->SetMicrophoneMute(enable);
}

int32_t ADMWrapper::MicrophoneMute(bool* enabled) const {
  return impl_->MicrophoneMute(enabled);
}

int32_t ADMWrapper::StereoPlayoutIsAvailable(bool* available) const {
  return impl_->StereoPlayoutIsAvailable(available);
}

int32_t ADMWrapper::SetStereoPlayout(bool enable) {
  return impl_->SetStereoPlayout(enable);
}

int32_t ADMWrapper::StereoPlayout(bool* enabled) const {
  return impl_->StereoPlayout(enabled);
}

int32_t ADMWrapper::StereoRecordingIsAvailable(bool* available) const {
  return impl_->StereoRecordingIsAvailable(available);
}

int32_t ADMWrapper::SetStereoRecording(bool enable) {
  return impl_->SetStereoRecording(enable);
}

int32_t ADMWrapper::StereoRecording(bool* enabled) const {
  return impl_->StereoRecording(enabled);
}

int32_t ADMWrapper::PlayoutDelay(uint16_t* delay_ms) const {
  return impl_->PlayoutDelay(delay_ms);
}

bool ADMWrapper::BuiltInAECIsAvailable() const {
  return impl_->BuiltInAECIsAvailable();
}

bool ADMWrapper::BuiltInAGCIsAvailable() const {
  return impl_->BuiltInAGCIsAvailable();
}

bool ADMWrapper::BuiltInNSIsAvailable() const {
  return impl_->BuiltInNSIsAvailable();
}

int32_t ADMWrapper::EnableBuiltInAEC(bool enable) {
  return impl_->EnableBuiltInAEC(enable);
}

int32_t ADMWrapper::EnableBuiltInAGC(bool enable) {
  return impl_->EnableBuiltInAGC(enable);
}

int32_t ADMWrapper::EnableBuiltInNS(bool enable) {
  return impl_->EnableBuiltInNS(enable);
}


void ADMWrapper::EnableExternalAudioInput(bool enable) {
  return impl_->EnableExternalAudioInput(enable);
}

int32_t ADMWrapper::SendRecordedBuffer(const uint8_t* audio_data,
                                       uint32_t data_len,
                                       int bits_per_sample,
                                       int sample_rate,
                                       size_t number_of_channels) {
  return impl_->SendRecordedBuffer(audio_data,data_len,bits_per_sample,sample_rate,number_of_channels);
}

void ADMWrapper::SetRecordedSampleRate(uint32_t fsHz) {
  sample_rate_ = fsHz;
}

void ADMWrapper::SetRecordedChannels(size_t channels) {
  num_channels_ = channels;
}

void ADMWrapper::RegisterObserver(AudioDeviceDataObserver* recorded_data_observer) {
  observer_ = recorded_data_observer;
}

void ADMWrapper::RegisterDeviceStateCallBack(AudioDeviceState* deviceCallBack) {

	impl_->RegisterDeviceStateCallBack(deviceCallBack);
}

rtc::scoped_refptr<AudioDeviceModule> CreateAudioDeviceWithDataObserver(
    const AudioDeviceModule::AudioLayer audio_layer,
    AudioDeviceDataObserver* observer) {
  return CreateAudioDeviceWithDataObserver(audio_layer,
	  CreateTaskQueueWinFactory().release(), observer);
}

rtc::scoped_refptr<AudioDeviceModule> CreateAudioDeviceWithDataObserver(
    AudioDeviceModule::AudioLayer audio_layer,
    TaskQueueFactory* task_queue_factory,
    AudioDeviceDataObserver* observer) {
  rtc::scoped_refptr<ADMWrapper> audio_device(
      new rtc::RefCountedObject<ADMWrapper>(audio_layer, task_queue_factory,
                                            observer));

  if (!audio_device->IsValid()) {
    return nullptr;
  }

  return audio_device;
}

}  // namespace webrtc
