import media from '@ohos.multimedia.media'
import { songItemType } from '../models/songModel'
export class PlayManager {
  //   属性
  static AVPlayer: media.AVPlayer = Object()

  // ================================
  //   方法
  /**
   * 初始化AVPlayer
   * */
  static async init() {
    // 创建 播放器方法
    PlayManager.AVPlayer = await media.createAVPlayer()
    console.log('mylog->初始化完成')

    PlayManager.AVPlayer.on('stateChange', (state) => {
      console.log('mylog->状态:', JSON.stringify(state))
      if (state === 'initialized') {
        PlayManager.AVPlayer.prepare()
      }

      if (state === 'prepared') {
        PlayManager.AVPlayer.play()
      }
    })
  }

  static async playMusic(song: songItemType) {
    await PlayManager.AVPlayer.reset()//切换歌曲要先将播放对象状态重置
    PlayManager.AVPlayer.url = song.url
    console.log('mylog->设置播放源完成', song.url)
  }

  // 暂停
  static async pauseMusic() {
    PlayManager.AVPlayer.pause()
  }
  // 暂停后重新唤起
  static async warkupMusic() {
    PlayManager.AVPlayer.play()
  }

  // 设置当前播放进度
  static async seekMusic(timeMS:number) {
    PlayManager.AVPlayer.seek(timeMS)
  }
}