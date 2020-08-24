# WebrtcAudioSample

基于webrtc - m76分支进行改动， 抽取了webrtc  adm(win)、 audioprocessing、 3A等完整模块
模拟rtc中多流真人互动场景， 从本地文件读取file1进行pcm数据播放， 同时播放的数据经过3a模块，分析渲染数据；
麦克风采集音频pcm数据， 经过3a模块分析采集数据；
收集采集的原始数据和收集3a处理后的数据进行对比， 会发现经过3a处理的音频数据不含有扬声器播放的声音
