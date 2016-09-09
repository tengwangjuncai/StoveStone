//
//  Define.h
//  StoveStone
//
//  Created by qianfeng0 on 16/3/10.
//  Copyright © 2016年 Jane. All rights reserved.
//

#ifndef Define_h
#define Define_h


//屏幕属性
#define kScreenFrame [UIScreen mainScreen].bounds
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
//基础背景颜色
#define kBaseBgColor [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1]

#define UIColorWithRGBA(r,g,b,a)        [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define NavTabbarColor                  UIColorWithRGBA(240.0f, 230.0f, 230.0f, 1.0f)
//加载图片占位符
#define kPicNamePlaceHolder @"炉石加载占位图@2x"
//动态页面占位符
//性别占位符
#define kGenderManPlaceHolder @"动态-头像-性别-男"
#define kGenderWomanPlaceHolder @"动态-头像-性别-女"
//头像占位符
#define kIconPlaceHolder @"动态-小默认头@2x"

//base路径，%@传API
#define baseUrl @"http://lscs.service.zhangyoubao.com/service/rest?%@&game=lscs&userid=17809496&platformVersion=2.2.2"

//推荐-->最新API
#define recommendAPI @"api=recommend.list"

#define recommendMarkAPI @"api=news.getposts"

//卡组-->卡组攻略API
#define cardGroupTopicAPI @"api=topic.cardsgrouptopiclist"


//广场-->广场API
#define dynamicAPI @"api=dynamic.getlist"

//广场-->评论API
#define dynamicCommentAPI @"api=dynamic.getcommentslist"

//详情页面API
#define detailAPI @"api=news.getbyid"

//详情评论API
#define detailCommentAPI @"api=news.gethotcomment"



#endif /* Define_h */
