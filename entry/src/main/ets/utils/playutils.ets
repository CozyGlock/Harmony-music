// 0.导入音乐播放器的文件
import media from '@ohos.multimedia.media'
import { songItemType } from '../models/songModel'

export class PlayManager{
    // 定义变量
  static  AVPlayer:media.AVPlayer = Object()

  static  async  init(){
    // 1.创建音乐的播放器  把播放器赋值给变量
    PlayManager.AVPlayer = await media.createAVPlayer()
    // 2.监听播放器的状态
    PlayManager.AVPlayer.on('stateChange', (state) => {
      console.log('mylog->状态:', JSON.stringify(state))
      if (state === 'initialized') {
        PlayManager.AVPlayer.prepare()
      }

      if (state === 'prepared') {
        // 此时意味着当前的音乐可以播放了
        PlayManager.AVPlayer.play()
      }
    })
  }
  // 封装音乐的方法  播放的方法
  static async playMusic(song: songItemType) {
    // 先重置
    await PlayManager.AVPlayer.reset()//切换歌曲要先将播放对象状态重置
    // 把要播放的音乐地址 赋值给 PlayManager.AVPlayer这个变量
    PlayManager.AVPlayer.url = song.url
    console.log('mylog->设置播放源完成', song.url)
  }
  // 暂停
  static async pauseMusic() {
    // 调用音乐暂停的方法  我是看官网
    PlayManager.AVPlayer.pause()
  }
  // 暂停后重新唤起
  static async warkupMusic() {
    // play再去重新播放
    PlayManager.AVPlayer.play()
  }
}
