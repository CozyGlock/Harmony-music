@Entry
@Component
struct Song {
  @State angle:number = 0
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
         Text('00:00')
           .fontColor('#fff')
           .fontSize(12)
         Slider({
           value: 1,
           min: 0,
           max: 5
         })
           .blockColor('#fff')
           .trackColor('#fff')
           .selectedColor('#fff')
           .trackThickness(2)


         Text('05:30')
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

      Scroll(){
        Column({space:20}){
          Text('播放列表(16)')
            .fontColor('#b44365')
            .margin(10)
          Row(){
            Text('1')
              .fontSize(20)
              .margin({right:10})
              .fontColor('#b6b6b6')
              .fontWeight(700)
            Image($r('app.media.icon'))
              .margin({right:10})
              .width(40)
            Column(){
              Text('直到世界尽头')
                .fontColor('#b6b6b6')
                .fontSize(18)
              Text('WANDS')
                .fontSize(14)
                .fontColor('#5d5b5c')
            }
            .layoutWeight(1)
            .alignItems(HorizontalAlign.Start)
            // Image($r('app.media.ic_playing'))
            //   .width(20)
            // Image($r('app.media.ic_paused'))
            //   .width(20)
            Image($r('app.media.ic_play'))
              .width(20)
          }
          Row(){
            Text('1')
              .fontSize(20)
              .margin({right:10})
              .fontColor('#b6b6b6')
              .fontWeight(700)
            Image($r('app.media.icon'))
              .margin({right:10})
              .width(40)
            Column(){
              Text('直到世界尽头')
                .fontColor('#b6b6b6')
                .fontSize(18)
              Text('WANDS')
                .fontSize(14)
                .fontColor('#5d5b5c')
            }
            .layoutWeight(1)
            .alignItems(HorizontalAlign.Start)
            // Image($r('app.media.ic_playing'))
            //   .width(20)
            // Image($r('app.media.ic_paused'))
            //   .width(20)
            Image($r('app.media.ic_play'))
              .width(20)
          }
          Row(){
            Text('1')
              .fontSize(20)
              .margin({right:10})
              .fontColor('#b6b6b6')
              .fontWeight(700)
            Image($r('app.media.icon'))
              .margin({right:10})
              .width(40)
            Column(){
              Text('直到世界尽头')
                .fontColor('#b6b6b6')
                .fontSize(18)
              Text('WANDS')
                .fontSize(14)
                .fontColor('#5d5b5c')
            }
            .layoutWeight(1)
            .alignItems(HorizontalAlign.Start)
            // Image($r('app.media.ic_playing'))
            //   .width(20)
            // Image($r('app.media.ic_paused'))
            //   .width(20)
            Image($r('app.media.ic_play'))
              .width(20)
          }
          Row(){
            Text('1')
              .fontSize(20)
              .margin({right:10})
              .fontColor('#b6b6b6')
              .fontWeight(700)
            Image($r('app.media.icon'))
              .margin({right:10})
              .width(40)
            Column(){
              Text('直到世界尽头')
                .fontColor('#b6b6b6')
                .fontSize(18)
              Text('WANDS')
                .fontSize(14)
                .fontColor('#5d5b5c')
            }
            .layoutWeight(1)
            .alignItems(HorizontalAlign.Start)
            // Image($r('app.media.ic_playing'))
            //   .width(20)
            // Image($r('app.media.ic_paused'))
            //   .width(20)
            Image($r('app.media.ic_play'))
              .width(20)
          }
          Row(){
            Text('1')
              .fontSize(20)
              .margin({right:10})
              .fontColor('#b6b6b6')
              .fontWeight(700)
            Image($r('app.media.icon'))
              .margin({right:10})
              .width(40)
            Column(){
              Text('直到世界尽头')
                .fontColor('#b6b6b6')
                .fontSize(18)
              Text('WANDS')
                .fontSize(14)
                .fontColor('#5d5b5c')
            }
            .layoutWeight(1)
            .alignItems(HorizontalAlign.Start)
            // Image($r('app.media.ic_playing'))
            //   .width(20)
            // Image($r('app.media.ic_paused'))
            //   .width(20)
            Image($r('app.media.ic_play'))
              .width(20)
          }
          Row(){
            Text('1')
              .fontSize(20)
              .margin({right:10})
              .fontColor('#b6b6b6')
              .fontWeight(700)
            Image($r('app.media.icon'))
              .margin({right:10})
              .width(40)
            Column(){
              Text('直到世界尽头')
                .fontColor('#b6b6b6')
                .fontSize(18)
              Text('WANDS')
                .fontSize(14)
                .fontColor('#5d5b5c')
            }
            .layoutWeight(1)
            .alignItems(HorizontalAlign.Start)
            // Image($r('app.media.ic_playing'))
            //   .width(20)
            // Image($r('app.media.ic_paused'))
            //   .width(20)
            Image($r('app.media.ic_play'))
              .width(20)
          }
          Row(){
            Text('1')
              .fontSize(20)
              .margin({right:10})
              .fontColor('#b6b6b6')
              .fontWeight(700)
            Image($r('app.media.icon'))
              .margin({right:10})
              .width(40)
            Column(){
              Text('直到世界尽头')
                .fontColor('#b6b6b6')
                .fontSize(18)
              Text('WANDS')
                .fontSize(14)
                .fontColor('#5d5b5c')
            }
            .layoutWeight(1)
            .alignItems(HorizontalAlign.Start)
            // Image($r('app.media.ic_playing'))
            //   .width(20)
            // Image($r('app.media.ic_paused'))
            //   .width(20)
            Image($r('app.media.ic_play'))
              .width(20)
          }
          Row(){
            Text('1')
              .fontSize(20)
              .margin({right:10})
              .fontColor('#b6b6b6')
              .fontWeight(700)
            Image($r('app.media.icon'))
              .margin({right:10})
              .width(40)
            Column(){
              Text('直到世界尽头')
                .fontColor('#b6b6b6')
                .fontSize(18)
              Text('WANDS')
                .fontSize(14)
                .fontColor('#5d5b5c')
            }
            .layoutWeight(1)
            .alignItems(HorizontalAlign.Start)
            // Image($r('app.media.ic_playing'))
            //   .width(20)
            // Image($r('app.media.ic_paused'))
            //   .width(20)
            Image($r('app.media.ic_play'))
              .width(20)
          }
          Row(){
            Text('1')
              .fontSize(20)
              .margin({right:10})
              .fontColor('#b6b6b6')
              .fontWeight(700)
            Image($r('app.media.icon'))
              .margin({right:10})
              .width(40)
            Column(){
              Text('直到世界尽头')
                .fontColor('#b6b6b6')
                .fontSize(18)
              Text('WANDS')
                .fontSize(14)
                .fontColor('#5d5b5c')
            }
            .layoutWeight(1)
            .alignItems(HorizontalAlign.Start)
            // Image($r('app.media.ic_playing'))
            //   .width(20)
            // Image($r('app.media.ic_paused'))
            //   .width(20)
            Image($r('app.media.ic_play'))
              .width(20)
          }

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