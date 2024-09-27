import { muiscLists, songItemType } from '../models/songModel'
import { PlayManager } from '../utils/playManager'
@Entry
@Component
struct Song {
  @State angle:number = 0
  @State flag:boolean = false
  @State currentSong:songItemType = {} as any
  @State totelTime: number = 0 //总时长
  @State currentTime: number = 0 //当前时长
  // 当加载当前文件的时候执行完毕触发
 async aboutToAppear(){
    // 先去创建播放器 等待音乐 死等
   await PlayManager.init()

   this.onTime()
  }

  // 根据毫秒格式化时间 01:02  3600000
  formatTime(milliseconds: number) {
    let totalSeconds = Math.ceil(milliseconds / 1000) // 得到秒数
    let minuts = Math.floor(totalSeconds / 60) //得到分钟
    let seconds = totalSeconds % 60 //得到秒
    // 返回 00:00这种格式
    // 2:00
    return minuts.toString().padStart(2, '0') + ':' + seconds.toString().padStart(2, '0')
  }
  // 监听状态
  async onTime(){
    // 这个音乐总时长
    PlayManager.AVPlayer.on('durationUpdate',(time)=>{
      this.totelTime = time
    })
    // 实时更新
    PlayManager.AVPlayer.on('timeUpdate',(currentTime)=>{
      // 00 01 02 03
      this.currentTime = currentTime
    })
  }

  build() {
    Column(){
      // 上
      Column({space:5}){
        Text('直到世界尽头')
          .fontColor('#fff')
        Text('WANDS')
          .fontColor('#666')
          .fontSize(14)
        Image($r('app.media.cd'))
          .width(150)
        // 0-360度
        //   .rotate({ angle: this.angle })
        //
        // .onAppear(() => {
        //   this.angle = 360
        // })
        // .animation({
        //   // 花费的时间
        //   duration: 5000,
        //   // 无限循环
        //   iterations: -1,
        //   // 匀速
        //   curve: Curve.Linear
        // })
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
      .padding({left:20,right:20})
      .height('33%')
      .width('100%')
      .radialGradient({
        center:['50%','50%'],
        radius:'60%',
        colors:[['#875d13',0],['#875d13',0.5],[Color.Transparent,1]]
      })
      // 下

      Column(){
        Column({space:20}){
          Text(`播放列表(${muiscLists.length})`)
            .fontColor('#b44365')
            .margin(10)
          
         ForEach(muiscLists,(item:songItemType,index:number)=>{
           Row(){
             Text(index+1+'')
               .fontSize(20)
               .margin({right:10})
               .fontColor('#b6b6b6')
               .fontWeight(700)
             Image(item.img)
               .margin({right:10})
               .width(40)
             Column(){
               Text(item.name)
                 .fontColor('#b6b6b6')
                 .fontSize(18)
               Text(item.author)
                 .fontSize(14)
                 .fontColor('#5d5b5c')
             }
             .layoutWeight(1)
             .alignItems(HorizontalAlign.Start)


              // 只要是true就让播放的图片显示
              if(this.flag==true){
                if(this.currentSong.id==item.id){
                  Image($r('app.media.ic_playing'))
                    .width(20)
                  Image($r('app.media.ic_paused'))
                    .width(20)
                    .onClick(()=>{
                      PlayManager.pauseMusic()
                      this.flag = false
                    })
                }else{
                  Image($r('app.media.ic_play'))
                    .width(20)
                }
              }else{
                Image($r('app.media.ic_play'))
                  .width(20)
                  .onClick(()=>{
                    // 把当前单机的复制给currentSong
                    this.currentSong = item
                    // @ts-ignore
                    PlayManager.playMusic(item)
                    // 只要一点击就变成true
                    this.flag = true
                  })
              }








             // else{
             //   Image($r('app.media.ic_playing'))
             //     .width(20)
             //   Image($r('app.media.ic_paused'))
             //     .width(20)
             // }

           }
         })

        }

        .alignItems(HorizontalAlign.Start)
        .width('100%')
      }
      .layoutWeight(1)
      // .height('66%')
      .width('100%'
      )
      .backgroundColor('#333333')
      .borderRadius({topLeft:20,topRight:20})
      .padding(10)
      // .alignItems(HorizontalAlign.Start)

    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Black)
  }
}