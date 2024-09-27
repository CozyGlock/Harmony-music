// 导入 songModel的内
import {muiscLists,songItemType} from '../models/songModel'
import { PlayManager } from '../utils/playManager'

@Entry
@Component
struct Index {
  @State angle: number = 0
  @State currentSong: songItemType = {} as songItemType //当前播放的歌曲
  @State isPlaying: boolean = false //是否播放
  @State totelTime: number = 0 //总时长
  @State currentTime: number = 0 //当前时长
  async aboutToAppear() {
    await PlayManager.init()
    await this.onTime()
  }
  // 根据毫秒格式化时间 01:02
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
  // 数组 一组数据的集合
  // 定义一个数组（数据）数组里面是字符串类型
  // @State arr:string[] = ['jack','rose','jerry','2','3','4','5']
  build() {
    // 外侧整个大容器
    Column(){
      // 上容器
      Column({space:10}){
        Text(this.currentSong.name)
          .fontColor('#fff')
          .fontSize(20)
          .fontWeight(700)
        Text(this.currentSong.author)
          .fontColor('#fff')
        Image($r('app.media.cd'))
          .width(150)
        Row(){
          Text(this.formatTime(this.currentTime))
            .fontSize(12)
            .fontColor(Color.White)
          Slider({
            value: this.currentTime,
            min: 0,
            max: this.totelTime
          })
            .blockColor(Color.White)
            .trackColor('#c5c5c5')
            .selectedColor(Color.White)
            .trackThickness(2)
            .onChange((time)=>{
              // console.log('mylog->当前时间：',time)
              PlayManager.seekMusic(time)
            })
          Text(this.formatTime(this.totelTime))
            .fontSize(12)
            .fontColor(Color.White)
        }

        .padding({left:20,right:70})
      }
      .width('100%')
      .layoutWeight(1)
      .radialGradient({
        center:['50%','52%'],
        radius:'60%',
        colors:[['#865d13',0],['#865d13',0.5],[Color.Transparent,1]]
      })
      // 下容器
      Column(){
        // 下容器中的上区域
        Text('播放列表（'+muiscLists.length+'）')
          // 字体颜色
          .fontColor('#ef4d7e')
            // 外边距
          .margin({top:15,left:20,bottom:20})
          .fontSize(18)

        // 列表区域
        Column({space:20}){
          ForEach(muiscLists,(item,index)=>{
            Row(){
              Text(index+1+'')
                .width('50')
                  // 字体的颜色
                .fontColor('#bfbfbf')
                  // 字体的大小
                .fontSize(20)
                  // 字体的加粗 700  400不加粗
                .fontWeight(700)
                  // 让 文字居中
                .textAlign(TextAlign.Center)

              Image(item.img)
                .width(50)
                .margin({right:15})

              Column(){
                Text(item.name)
                  .fontSize(18)
                  .fontColor('#bfbfbf')
                Text(item.author)
                  .fontSize(14)
                  .fontColor('#6a6a6a')
              }
              .layoutWeight(1)
              .alignItems(HorizontalAlign.Start)

              if(this.isPlaying==false&&this.currentSong.id==undefined){
                Image($r('app.media.ic_play'))
                  .width(20)
                  .margin({right:20})
                  .onClick(()=>{
                    this.currentSong=item
                    PlayManager.playMusic(item)
                    this.isPlaying = true
                  })
              }
              if(this.isPlaying==true&&this.currentSong.id){
                if(this.currentSong.id==item.id){
                  Image($r('app.media.ic_playing'))
                    .width(30)
                    .height(30)
                    .margin({ right: 26 })
                  // 显示暂停按钮
                  Image($r('app.media.ic_paused'))
                    .width(20)
                    .height(20)
                    .margin({ right: 16 })
                    .fillColor(Color.White)
                    .onClick(()=>{
                      PlayManager.pauseMusic()
                      this.isPlaying = false
                    })

                }else{
                  Image($r('app.media.ic_play'))
                    .width(20)
                    .margin({right:20})
                    .onClick(()=>{
                      this.currentSong=item
                      PlayManager.playMusic(item)
                      this.isPlaying = true
                    })
                }

              }
              if(this.isPlaying==false&&this.currentSong.id){
                Image($r('app.media.ic_play'))
                  .width(20)
                  .height(20)
                  .margin({ right: 16 })
                  .onClick(()=>{
                    this.isPlaying=true
                    PlayManager.warkupMusic()
                  })

              }
            }
          })
        }


        // 下容器中的下区域
        // Text('111')
        // 数组+循环 鸿蒙里面需要指定类型
        // ForEach(this.arr,(item:string,index:number)=>{
        //  // item是代表数组中的每一项
        //   Text(item)
        //   // index是数组默认的下标（索引） 是0开始的
        //   // Text(index+'')
        //   // // 访问数组的第2项
        //   // Text(this.arr[1])
        // })

      }
      .width('100%')
      .layoutWeight(2)
      .backgroundColor('#333')
      .borderRadius({topLeft:25,topRight:25})
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#000')
  }
}

