import header from './components/layout/header/zh'
import footer from './components/layout/footer/zh'
import sidebar from './components/layout/sidebar/zh'
import loading from './components/loading/loading/zh'
import home from './view/home/home/zh'

export default {
  webName: '辰雪博客',
  components: {
    layout: {
      header,
      footer,
      sidebar
    },
    loading: {
      loading
    }
  },
  view: {
    home: {
      home
    }
  }
}
