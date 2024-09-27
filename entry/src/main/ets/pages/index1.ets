// 导入
import {muiscLists,songItemType} from '../models/songModel'
import { PlayManager } from '../utils/playManager'
@Entry
@Component
struct Index {
  @State currentSong:songItemType = {} as any
  @State playing:boolean = false
  @State totelTime: number = 0 //总时长
  @State currentTime: number = 0 //当前时长
  // 当程序跑的时候自动加载
  async  aboutToAppear(){
    // 初始化
    await PlayManager.init()
    // 上来就要调用一下  获取总时长
    await this.onTime()
  }

  // 根据毫秒格式化时间 01:02  3600000
  formatTime(milliseconds: number) {
    let totalSeconds = Math.ceil(milliseconds / 1000) // 得到秒数
    let minuts = Math.floor(totalSeconds / 60) //得到分钟
    let seconds = totalSeconds % 60 //得到秒
    // 返回 00:00这种格式
    return minuts.toString().padStart(2, '0') + ':' + seconds.toString().padStart(2, '0')
  }
  async onTime(){
    // 这个音乐总时长
    PlayManager.AVPlayer.on('durationUpdate',(time)=>{
      this.totelTime = time
    })
    // 实时更新
    PlayManager.AVPlayer.on('timeUpdate',(currentTime)=>{
      this.currentTime = currentTime
    })
  }


  build() {
    // 大容器
    Column(){
      // 大容器中的上区域
      Column(){
        Text(this.currentSong.name||'未知')
          .fontColor('#fff')
          .fontSize(20)
        Text(this.currentSong.author||"未知")
          .fontColor('#707070')
        Image($r('app.media.ic_cd'))
          .width(150)
        Row(){
          Text(this.formatTime(this.currentTime))
            .fontColor('#fff')
            .fontSize(12)
          Slider({
            value: this.currentTime,
            min: 0,
            max: this.totelTime
          })
            .blockColor('#fff')
            .trackColor('#fff')
            .selectedColor('#fff')
            .trackThickness(2)
          Text(this.formatTime(this.totelTime))
            .fontColor('#fff')
            .fontSize(12)
        }
        .padding({left:20,right:70})
      }
      .radialGradient({
        // 渐变的位置
        center:['50%','50%'],
        // 渐变的范围
        radius:'60%',
        // 颜色范围
        colors:[['#875d13',0],['#875d13',0.5],[Color.Transparent,1]]
      })
      .width('100%')
      .layoutWeight(1)
      // 大容器中的下区域
      Column(){
        Text('播放列表('+muiscLists.length+')')
          .fontColor('#f54f82')
            // margin是容器与容器之间的距离
          .margin({left:15,top:15,bottom:25})
        // 下区域
        Column({space:20}){
          ForEach(muiscLists,(item,index)=>{
            Row(){
              Text(index+1+"")
                .width(50)
                  // 字体颜色
                .fontColor('#bfbfbf')
                  // 字体大小
                .fontSize(20)
                  // 文字居中
                .textAlign(TextAlign.Center)
                  // 文字加粗
                .fontWeight(700)
              Image(item.img)
                .width(40)
                .margin({right:10})
              Column(){
                Text(item.name)
                  .fontSize(20)
                  .fontColor('#bfbfbf')
                Text(item.author)
                  .fontColor('#707070')
              }
              .width('100%')
              .alignItems(HorizontalAlign.Start)
              // 占剩余的大小  剩下的大小都给我
              .layoutWeight(1)
              if(this.playing==true){
                // 判断当前单机的是哪一个 就让哪一个的暂停图片显示
                if(this.currentSong.id==item.id){
                  Image($r('app.media.ic_playing'))
                    .width(20)
                  Image($r('app.media.ic_paused'))
                    .width(20)
                    .onClick(()=>{
                      PlayManager.pauseMusic()
                      this.playing = false
                    })
                }else{
                  Image($r('app.media.ic_play'))
                    .width(20)
                    .margin({right:20})
                    .onClick(()=>{
                      // 单机谁把哪一个对象信息展示到页面
                      this.currentSong = item
                      // 开始播放
                      PlayManager.playMusic(item)
                      // 让当前的playing 改成true
                      this.playing = true
                    })
                }
                // else{
                //   Image($r('app.media.ic_play'))
                //     .width(20)
                //     .margin({right:20})
                //     .onClick(()=>{
                //       // 单机谁把哪一个对象信息展示到页面
                //       this.currentSong = item
                //       // 开始播放
                //       PlayManager.playMusic(item)
                //       // 让当前的playing 改成true
                //       this.playing = true
                //     })
                // }
              }

              if(this.playing==false){
                Image($r('app.media.ic_play'))
                  .width(20)
                  .margin({right:20})
                  .onClick(()=>{
                    // 单机谁把哪一个对象信息展示到页面
                    this.currentSong = item
                    // 开始播放
                    PlayManager.playMusic(item)
                    // 让当前的playing 改成true
                    this.playing = true
                  })
              }

            }
          })



        }
      }
      .borderRadius({topLeft:20,topRight:20})
      .alignItems(HorizontalAlign.Start)
      .width('100%')
      .layoutWeight(2)
      .backgroundColor('#333333')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#000000')
  }
}