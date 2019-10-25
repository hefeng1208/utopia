module.exports = {
  base: '/utopia/',
  title: 'Utopia',
  description: 'Vuepress blog demo',
  themeConfig: {
    repo: 'https://github.com/hefeng1208/utopia',
    repoLabel: 'My GitHub',
    nav: [
      { text: 'Home', link: '/' },
      { text: 'Guide', link: '/guide/' },
    ],
    sidebar: [
      ['/', '首页'],
      ['/blog/FirstBlog.md', '我的第一篇博客']
    ]
  }
}