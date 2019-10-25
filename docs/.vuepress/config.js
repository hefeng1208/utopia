module.exports = () => {
  return {
    base: '/utopia/',
    title: 'Utopia',
    description: 'Vuepress blog demo',
    markdown: {
      lineNumbers: true
    },
    evergreen: true,
    activeHeaderLinks: true,
    plugins:[
      ['@vuepress/back-to-top', true],
      ['@vuepress/active-header-links', true],
      ['@vuepress/register-components', true]
    ],
    themeConfig: {
      repo: 'https://github.com/hefeng1208',
      repoLabel: 'GitHub',
      nav: [
        { text: 'Home', link: '/' },
        { text: 'Blog', link: '/guide/' },
        { text: 'About Me', link: '/about.md' }
      ],
      sidebar: [
        ['/blog/FirstBlog.md', '我的第一篇博客']
      ]
    }
  }
}