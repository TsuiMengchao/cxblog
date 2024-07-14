export default{
	list:[{
			pagePath: '/pages/index/index',
			iconPath: '/static/tabbar/tab_1_s.png',
			selectedIconPath: '/static/tabbar/tab_1.png',
			text: '动态'
		},
		{
			pagePath: '/pages/more/more',
			iconPath: '/static/tabbar/tab_2_s.png',
			selectedIconPath: '/static/tabbar/tab_2.png',
			text: '发现'
		},
		{
			iconPath: '/static/tabbar/add.png',
			selectedIconPath: '/static/tabbar/add.png',
			midButton: true
		},
		{
			pagePath: '/pages/message/message',
			iconPath: '/static/tabbar/tab_4_s.png',
			selectedIconPath: '/static/tabbar/tab_4.png',
			text: '消息'
		},
		{
			pagePath: '/pages/my/my',
			iconPath: '/static/tabbar/tab_5_s.png',
			selectedIconPath: '/static/tabbar/tab_5.png',
			text: '我的'
		}
	],
	popup:[
		{
			icon:'/static/h_2.png',
			text:'图文',
			url:'/pages/post/add?type=1'
		},
		{
			icon:'/static/h_3.png',
			text:'视频',
			url:'/pages/post/add?type=2'
		},
		{
			icon:'/static/h_1.png',
			text:'投票',
			url:'/pages/post/vote'
		}
	]
	
}