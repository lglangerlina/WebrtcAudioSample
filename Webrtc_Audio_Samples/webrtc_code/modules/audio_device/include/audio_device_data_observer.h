/*
 *  Copyright (c) 2017 The WebRTC project authors. All Rights Reserved.
 *
 *  Use of this source code is governed by a BSD-style license
 *  that can be found in the LICENSE file in the root of the source
 *  tree. An additional intellectual property rights grant can be found
 *  in the file PATENTS.  All contributing project authors may
 *  be found in the AUTHORS file in the root of the source tree.
 */

#ifndef MODULES_AUDIO_DEVICE_INCLUDE_AUDIO_DEVICE_DATA_OBSERVER_H_
#define MODULES_AUDIO_DEVICE_INCLUDE_AUDIO_DEVICE_DATA_OBSERVER_H_

#include <stddef.h>
#include <stdint.h>

#include "api/scoped_refptr.h"
#include "api/task_queue/task_queue_factory.h"
#include "modules/audio_device/include/audio_device.h"
#include "rtc_base/deprecation.h"
#include "audio/remix_resample.h"

namespace webrtc {

// This interface will capture the raw PCM data of both the local captured as
// well as the mixed/rendered remote audio.
class AudioDeviceDataObserver {
 public:
  virtual void OnCaptureData(const void* audio_samples,
                             const size_t num_samples,
                             const size_t bytes_per_sample,
                             const size_t num_channels,
                             const uint32_t samples_per_sec) = 0;

  virtual void OnRenderData(const void* audio_samples,
                            const size_t num_samples,
                            const size_t bytes_per_sample,
                            const size_t num_channels,
                            const uint32_t samples_per_sec) = 0;

  AudioDeviceDataObserver() = default;
  virtual ~AudioDeviceDataObserver() = default;
};

// A wrapper over AudioDeviceModule that registers itself as AudioTransport
// callback and redirects the PCM data to AudioDeviceDataObserver callback.
class ADMWrapper : public AudioDeviceModule, public AudioTransport {
 public:
  ADMWrapper(AudioLayer audio_layer,
             TaskQueueFactory* task_queue_factory,
             AudioDeviceDataObserver* observer);
  ~ADMWrapper() override;

  // Make sure we have a valid ADM before returning it to user.
  bool IsValid();

  // AudioTransport methods overrides.
  int32_t RecordedDataIsAvailable(const void* audioSamples,
                                  const size_t nSamples,
                                  const size_t nBytesPerSample,
                                  const size_t nChannels,
                                  const uint32_t samples_per_sec,
                                  const uint32_t total_delay_ms,
                                  const int32_t clockDrift,
                                  const uint32_t currentMicLevel,
                                  const bool keyPressed,
                                  uint32_t& newMicLevel) override;

  int32_t NeedMorePlayData(const size_t nSamples,
                           const size_t nBytesPerSample,
                           const size_t nChannels,
                           const uint32_t samples_per_sec,
                           void* audioSamples,
                           size_t& nSamplesOut,
                           int64_t* elapsed_time_ms,
                           int64_t* ntp_time_ms) override;

  void PullRenderData(int bits_per_sample,
                      int sample_rate,
                      size_t number_of_channels,
                      size_t number_of_frames,
                      void* audio_data,
                      int64_t* elapsed_time_ms,
                      int64_t* ntp_time_ms) override;

  // Override AudioDeviceModule's RegisterAudioCallback method to remember the
  // actual audio transport (e.g.: voice engine).
  int32_t RegisterAudioCallback(AudioTransport* audio_callback) override;

  // AudioDeviceModule pass through method overrides.
  int32_t ActiveAudioLayer(AudioLayer* audio_layer) const override;
  int32_t Init() override;
  int32_t Terminate() override;
  bool Initialized() const override;
  int16_t PlayoutDevices() override;
  int16_t RecordingDevices() override;
  int32_t PlayoutDeviceName(uint16_t index,
                            char name[kAdmMaxDeviceNameSize],
                            char guid[kAdmMaxGuidSize]) override;
  int32_t RecordingDeviceName(uint16_t index,
                              char name[kAdmMaxDeviceNameSize],
                              char guid[kAdmMaxGuidSize]) override;
  int32_t SetPlayoutDevice(uint16_t index) override;
  int32_t SetPlayoutDevice(WindowsDeviceType device) override;
  int32_t SetRecordingDevice(uint16_t index) override;
  int32_t SetRecordingDevice(WindowsDeviceType device) override;
  int32_t PlayoutIsAvailable(bool* available) override;
  int32_t InitPlayout() override { return impl_->InitPlayout(); }
  bool PlayoutIsInitialized() const override;
  int32_t RecordingIsAvailable(bool* available) override;
  int32_t InitRecording() override;
  bool RecordingIsInitialized() const override;
  int32_t StartPlayout() override;
  int32_t StopPlayout() override;
  bool Playing() const override;
  int32_t StartRecording() override;
  int32_t StopRecording() override;
  bool Recording() const override;
  int32_t InitSpeaker() override;
  bool SpeakerIsInitialized() const override;
  int32_t InitMicrophone() override;
  bool MicrophoneIsInitialized() const override;
  int32_t SpeakerVolumeIsAvailable(bool* available) override;
  int32_t SetSpeakerVolume(uint32_t volume) override;
  int32_t SpeakerVolume(uint32_t* volume) const override;
  int32_t MaxSpeakerVolume(uint32_t* max_volume) const override;
  int32_t MinSpeakerVolume(uint32_t* min_volume) const override;
  int32_t MicrophoneVolumeIsAvailable(bool* available) override;
  int32_t SetMicrophoneVolume(uint32_t volume) override;
  int32_t MicrophoneVolume(uint32_t* volume) const override;
  int32_t MaxMicrophoneVolume(uint32_t* max_volume) const override;
  int32_t MinMicrophoneVolume(uint32_t* min_volume) const override;
  int32_t SpeakerMuteIsAvailable(bool* available) override;
  int32_t SetSpeakerMute(bool enable) override;
  int32_t SpeakerMute(bool* enabled) const override;
  int32_t MicrophoneMuteIsAvailable(bool* available) override;
  int32_t SetMicrophoneMute(bool enable) override;
  int32_t MicrophoneMute(bool* enabled) const override;
  int32_t StereoPlayoutIsAvailable(bool* available) const override;
  int32_t SetStereoPlayout(bool enable) override;
  int32_t StereoPlayout(bool* enabled) const override;
  int32_t StereoRecordingIsAvailable(bool* available) const override;
  int32_t SetStereoRecording(bool enable) override;
  int32_t StereoRecording(bool* enabled) const override;
  int32_t PlayoutDelay(uint16_t* delay_ms) const override;
  bool BuiltInAECIsAvailable() const override;
  bool BuiltInAGCIsAvailable() const override;
  bool BuiltInNSIsAvailable() const override;
  int32_t EnableBuiltInAEC(bool enable) override;
  int32_t EnableBuiltInAGC(bool enable) override;
  int32_t EnableBuiltInNS(bool enable) override;
  virtual void EnableExternalAudioInput(bool enable) override;
  virtual int32_t SendRecordedBuffer(const uint8_t* audio_data,
                                     uint32_t data_len,
                                     int bits_per_sample,
                                     int sample_rate,
                                     size_t number_of_channels) override;
  void SetRecordedSampleRate(uint32_t fsHz);
  void SetRecordedChannels(size_t channels);
  void RegisterObserver(AudioDeviceDataObserver* recorded_data_observer);
  void RegisterDeviceStateCallBack(AudioDeviceState* deviceCallBack) override;

// Only supported on iOS.
#if defined(WEBRTC_IOS)
  int GetPlayoutAudioParameters(AudioParameters* params) const override {
    return impl_->GetPlayoutAudioParameters(params);
  }
  int GetRecordAudioParameters(AudioParameters* params) const override {
    return impl_->GetRecordAudioParameters(params);
  }

  //gxm gamestreaming
  int setEnableSoftwareAudioProcessing(bool enable) override{
    return impl_->setEnableSoftwareAudioProcessing(enable);
  }

  bool isEnableSoftwareAudioProcessing() override{
    return impl_->isEnableSoftwareAudioProcessing();
  }
#endif  // WEBRTC_IOS

 protected:
  rtc::scoped_refptr<AudioDeviceModule> impl_;
  AudioDeviceDataObserver* observer_ = nullptr;
  AudioTransport* audio_transport_ = nullptr;
  bool is_valid_ = false;
  uint32_t sample_rate_ = 0;
  size_t num_channels_ = 0;
  PushResampler<int16_t> capture_resampler_;
  std::unique_ptr<AudioFrame> audio_frame_;
};

// TODO(bugs.webrtc.org/10284): Remove when unused.
rtc::scoped_refptr<AudioDeviceModule> CreateAudioDeviceWithDataObserver(
    const AudioDeviceModule::AudioLayer audio_layer,
    AudioDeviceDataObserver* observer);

// Creates an ADM instance with AudioDeviceDataObserver registered.
rtc::scoped_refptr<AudioDeviceModule> CreateAudioDeviceWithDataObserver(
    const AudioDeviceModule::AudioLayer audio_layer,
    TaskQueueFactory* task_queue_factory,
    AudioDeviceDataObserver* observer);

}  // namespace webrtc

#endif  // MODULES_AUDIO_DEVICE_INCLUDE_AUDIO_DEVICE_DATA_OBSERVER_H_
