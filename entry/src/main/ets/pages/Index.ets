@Entry
@Component
struct Index {
  @State message: string = 'Welcome';

  build() {
    Column() {
      Text(this.message)
        .width('100%')
        .fontSize(24)
        .lineHeight(33)
        .fontFamily('HarmonyHeiTi-Bold')
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .padding({left: 16, top: 10, bottom: 10})
      Scroll() {
        Column() {
          Banner()
          EnablementView()
          TutorialView()
        }
      }
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#F1F3F5')
  }
}

interface BannerItem {
  id: string
  imgSrc: ResourceStr
  linkUrl?: string
}

@Component
struct Banner {
  @State bannerList: BannerItem[] = [
    {id: 'pic_0',imgSrc: $r('app.media.banner_pic0'), linkUrl: 'https://developer.huawei.com/consumer/cn/training/course/video/C101718352529709527' },
    {id: 'pic_1',imgSrc: $r('app.media.banner_pic1'), linkUrl: 'https://developer.huawei.com/consumer/cn/' },
    {id: 'pic_2',imgSrc: $r('app.media.banner_pic2'), linkUrl: 'https://developer.huawei.com/consumer/cn/deveco-studio/' },
    {id: 'pic_3',imgSrc: $r('app.media.banner_pic3'), linkUrl: 'https://developer.huawei.com/consumer/cn/arkts/' },
    {id: 'pic_4',imgSrc: $r('app.media.banner_pic4'), linkUrl: 'https://developer.huawei.com/consumer/cn/arkui/' },
    {id: 'pic_5',imgSrc: $r('app.media.banner_pic5'), linkUrl: 'https://developer.huawei.com/consumer/cn/sdk' },
  ]
  build() {
    Swiper() {
      ForEach(this.bannerList,(item: BannerItem, index: number)=> {
        Image(item.imgSrc)
          .width('100%')
          .objectFit(ImageFit.Contain)
          .padding({ left: 16, right: 16, top: 6 })
          .borderRadius(16)
      },(item: BannerItem, index: number)=> item.id)
    }
    .autoPlay(true)
    .loop(true)
    .indicator(
      new DotIndicator().color('#1a000000').selectedColor('#0A59F7')
    )
  }
}


interface ArticleItem {
  id: string
  imgSrc: ResourceStr
  title: string
  brief: string
  linkUrl: string
}

@Component
struct EnablementItem {
  @Prop enablementItem: ArticleItem;

  build() {
    Column() {
      Image(this.enablementItem.imgSrc).width(160).height(96).objectFit(ImageFit.Cover).borderRadius({topLeft:16,topRight:16})
      Text(this.enablementItem.title)
        .width('100%').height(19).fontSize(14).fontWeight(400)
        .maxLines(1).textAlign(TextAlign.Start).textOverflow({ overflow: TextOverflow.Ellipsis })
        .margin({top:8}).padding({left:12,right:12})
      Text(this.enablementItem.brief)
        .width('100%').height(32).fontSize(12).fontWeight(400).fontColor('rgba(0,0,0,0.6)')
        .maxLines(2).textAlign(TextAlign.Start).textOverflow({ overflow: TextOverflow.Ellipsis })
        .margin({top:2}).padding({left:12,right:12})
    }.width(160).height(169).borderRadius(16).backgroundColor(Color.White)
  }
}

@Component
struct EnablementView {
  @State enablementList: ArticleItem[] = [
    {
      id: '1',
      imgSrc: $r('app.media.enablement_pic1'),
      title: 'HarmonyOS第一课',
      brief: '基于真实的开发场景，提供向导式学习，多维度融合课程等内容，给开发者提供全新的学习体验。',
      linkUrl: 'https://developer.huawei.com/consumer/cn/doc/harmonyos-video-courses/video-tutorials-0000001443535745'
    },
    {
      id: '2',
      imgSrc: $r('app.media.enablement_pic2'),
      title: '开发指南',
      brief: '提供系统能力概述、快速入门，用于指导开发者进行场景化的开发。指南涉及到的知识点包括必要的背景知识、符合开发者实际开发场景的操作任务流（开发流程、开发步骤、调测验证）以及常见问题等。',
      linkUrl: 'https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/application-dev-guide-0000001630265101'
    },
    {
      id: '3',
      imgSrc: $r('app.media.enablement_pic3'),
      title: '最佳实践',
      brief: '针对新发布特性及热点特性提供详细的技术解析和开发最佳实践。',
      linkUrl: 'https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/topic-architecture-0000001678045510'
    },
    {
      id: '4',
      imgSrc: $r('app.media.enablement_pic4'),
      title: 'Codelabs',
      brief: '以教学为目的的代码样例及详细的开发指导，帮助开发者一步步地完成指定场景的应用开发并掌握相关知识。Codelabs将最新的鸿蒙生态应用开发技术与典型场景结合，让开发者快速地掌握开发高质量应用的方法。同时支持互动式操作，通过文字、代码和效果联动为开发者带来更佳的学习体验。',
      linkUrl: 'https://developer.huawei.com/consumer/cn/doc/harmonyos-codelabs/codelabs-0000001443855957'
    },
    {
      id: '5',
      imgSrc: $r('app.media.enablement_pic5'),
      title: 'Sample',
      brief: '面向不同类型的开发者提供的鸿蒙生态应用开发优秀实践，每个Sample Code都是一个可运行的工程，为开发者提供实例化的代码参考。',
      linkUrl: 'https://developer.huawei.com/consumer/cn/doc/harmonyos-samples/samples-0000001162414961'
    },
    {
      id: '6',
      imgSrc: $r('app.media.enablement_pic6'),
      title: 'API参考',
      brief: '面向开发者提供鸿蒙系统开放接口的全集，供开发者了解具体接口使用方法。API参考详细地描述了每个接口的功能、使用限制、参数名、参数类型、参数含义、取值范围、权限、注意事项、错误码及返回值等。',
      linkUrl: 'https://developer.huawei.com/consumer/cn/doc/harmonyos-references/development-intro-0000001580026066'
    },
    {
      id: '7',
      imgSrc: $r('app.media.enablement_pic7'),
      title: 'FAQ',
      brief: '开发者常见问题的总结，开发者可以通过FAQ更高效地解决常见问题。FAQ会持续刷新，及时呈现最新的常见问题。',
      linkUrl: 'https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-development-0000001753952202'
    },
    {
      id: '8',
      imgSrc: $r('app.media.enablement_pic8'),
      title: '开发者论坛',
      brief: '和其他应用开发者交流技术、共同进步',
      linkUrl: 'https://developer.huawei.com/consumer/cn/forum/home?all=1'
    }
  ]
  build() {
    Column() {
      Text('赋能套件')
        .fontColor('#182431')
        .fontSize(16)
        .fontWeight(500)
        .fontFamily('HarmonyHeiTi-medium')
        .textAlign(TextAlign.Start)
        .padding({ left: 16 })
        .margin({ bottom: 8.5 })
      Grid(){
        ForEach(this.enablementList,(item: ArticleItem, index: number)=> {
          GridItem() {
            EnablementItem({enablementItem: item})
          }
        }, (item: ArticleItem)=> item.id)
      }
      .rowsTemplate('1fr')
      .columnsGap(8)
      .height(169)
      .padding({top:2, left:16, right:16 })
      .scrollBar(BarState.Off)
    }.margin({top: 18}).alignItems(HorizontalAlign.Start)
  }
}


@Component
struct TutorialItem {
  @Prop tutorialItem: ArticleItem;
  build() {
    Row() {
      Column() {
        Text(this.tutorialItem.title)
          .height(19)
          .width('100%')
          .fontSize(14)
          .textAlign(TextAlign.Start)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(1)
          .fontWeight(400)
          .margin({ top: 4 })
        Text(this.tutorialItem.brief)
          .height(32)
          .width('100%')
          .fontSize(12)
          .textAlign(TextAlign.Start)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(2)
          .fontWeight(400)
          .fontColor('rgba(0, 0, 0, 0.6)')
          .margin({ top: 5 })
      }.height('100%')
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
      .margin({ right: 12 })
      Image(this.tutorialItem.imgSrc)
        .height(64)
        .width(108)
        .objectFit(ImageFit.Cover)
        .borderRadius(16)
    }
    .width('100%')
    .height(88)
    .borderRadius(16)
    .backgroundColor(Color.White)
    .padding(12)
  }
}

@Component
struct TutorialView {
  @State tutorialList: ArticleItem[] = [
    {
      id: '1',
      imgSrc: $r('app.media.tutorial_pic1'),
      title: 'Step1 环境的搭建',
      brief: '本篇教程实现了快速入门——一个用于了解和学习HarmonyOS的应用程序。',
      linkUrl: 'https://developer.huawei.com/consumer/cn/forum/home?all=1'
    },
    {
      id: '2',
      imgSrc: $r('app.media.tutorial_pic2'),
      title: 'Step2 使用Swiper构建运营广告位',
      brief: 'Swiper组件提供滑动轮播显示的能力。Swiper本身是一个容器组件，当设置了多个子组件后，可以对这些子组件进行轮播显示。',
      linkUrl: 'https://developer.huawei.com/consumer/cn/forum/home?all=1'
    },
    {
      id: '3',
      imgSrc: $r('app.media.tutorial_pic3'),
      title: 'Step3 创建和组合视图',
      brief: 'Item定义子组件相关特征。相关组件支持使用条件渲染、循环渲染、懒加载等方式生成子组件。',
      linkUrl: 'https://developer.huawei.com/consumer/cn/forum/home?all=1'
    },
    {
      id: '4',
      imgSrc: $r('app.media.tutorial_pic4'),
      title: 'Step4 网格和列表组建的使用',
      brief: '网格和列表组件中，当Item达到一定数量，内容超过屏幕大小时，可以自动提供滚动功能，适合用于呈现同类数据类型或数据类型集',
      linkUrl: 'https://developer.huawei.com/consumer/cn/forum/home?all=1'
    },
    {
      id: '5',
      imgSrc: $r('app.media.tutorial_pic5'),
      title: 'Step5 应用架构设计基础——MVVM模式',
      brief: 'ArkUI采取MVVM = Model + View + ViewModel模式，将数据与视图绑定在一起，更新数据的时候直接更新视图。',
      linkUrl: 'https://developer.huawei.com/consumer/cn/forum/home?all=1'
    },
    {
      id: '6',
      imgSrc: $r('app.media.tutorial_pic6'),
      title: 'Step6 应用架构设计基础——三层架构',
      brief: '为了更好地适配复杂应用的开发，建议采用三层架构的方式对整个应用的功能进行模块化，实现高内聚、低耦合开发。',
      linkUrl: 'https://developer.huawei.com/consumer/cn/forum/home?all=1'
    },
    {
      id: '7',
      imgSrc: $r('app.media.tutorial_pic7'),
      title: 'Step6 ArkWeb页面适配',
      brief: 'ArkWeb（方舟Web）提供了Web组件，用于在应用程序中显示Web页面内容，为开发者提供页面加载、页面交互、页面调试等能力。',
      linkUrl: 'https://developer.huawei.com/consumer/cn/forum/home?all=1'
    },
    {
      id: '8',
      imgSrc: $r('app.media.tutorial_pic8'),
      title: 'Step7 数据驱动UI更新',
      brief: '数据更新的同时会直接驱动UI的改变',
      linkUrl: 'xxx'
    },
    {
      id: '9',
      imgSrc: $r('app.media.tutorial_pic9'),
      title: 'Step8 设置组件导航',
      brief: 'Navigation组件适用于模块内页面切换，一次开发，多端部署场景。通过组件级路由能力实现更加自然流畅的转场体验，并提供多种标题栏样式来呈现更好的标题和内容联动效果。',
      linkUrl: 'https://developer.huawei.com/consumer/cn/forum/home?all=1'
    },
    {
      id: '10',
      imgSrc: $r('app.media.tutorial_pic10'),
      title: 'Step9 原生智能：AI语音朗读',
      brief: '文本转语音服务提供将文本信息转换为语音并进行播报的能力，便于用户与设备进行互动，实现实时语音交互，文本播报。',
      linkUrl: 'https://developer.huawei.com/consumer/cn/forum/home?all=1'
    },
    {
      id: '11',
      imgSrc: $r('app.media.tutorial_pic11'),
      title: 'Step10 原生互联：分布式流转',
      brief: '流转能力打破设备界限，多设备联动，使用户应用程序可分可合、可流转，实现如邮件跨设备编辑、多设备协同健身、多屏游戏等分布式业务。',
      linkUrl: 'https://developer.huawei.com/consumer/cn/forum/home?all=1'
    },
    {
      id: '12',
      imgSrc: $r('app.media.tutorial_pic12'),
      title: 'Step11 一次开发，多端部署',
      brief: '一套代码工程，一次开发上架，多端按需部署。支撑开发者快速高效的开发支持多种终端设备形态的应用，实现对不同设备兼容的同时，提供跨设备的流转、迁移和协同的分布式体验。',
      linkUrl: 'https://developer.huawei.com/consumer/cn/forum/home?all=1'
    }
  ]
  build() {
    Column() {
      Text('入门教程')
        .fontColor('#182431')
        .fontSize(16)
        .fontWeight(500)
        .fontFamily('HarmonyHeiTi-medium')
        .textAlign(TextAlign.Start)
        .padding({ left: 16 })
        .margin({ bottom: 8.5 })
      List({space: 12}) {
        ForEach(this.tutorialList,(item: ArticleItem, index: number )=> {
          ListItem() {
            TutorialItem({tutorialItem: item})
          }
        }, (item: ArticleItem) => item.id)
      }.scrollBar(BarState.Off).padding({left:16,right:16})
    }
    .margin({ top: 18, bottom: 80 })
    .alignItems(HorizontalAlign.Start)
  }
}