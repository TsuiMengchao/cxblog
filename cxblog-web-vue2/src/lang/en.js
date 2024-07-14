import header from './components/layout/header/en'
import footer from './components/layout/footer/en'
import sidebar from './components/layout/sidebar/en'
import loading from './components/loading/loading/en'
import home from './view/home/home/en'

export default {
  webName: 'CXBLOG',
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
