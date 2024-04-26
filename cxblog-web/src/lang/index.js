import Vue from 'vue';
import VueI18n from 'vue-i18n';
Vue.use(VueI18n);
import en from './en'
import zh from './zh'

const messages = {
  en: {
    ...en
  },
  zh: {
    ...zh
  }
}
export function getLanguage () {
  const chooseLanguage = sessionStorage.getItem('language')
  if (chooseLanguage) return chooseLanguage
  // if has not choose language
  const language = (navigator.language || navigator.browserLanguage).toLowerCase()
  const locales = Object.keys(messages)
  for (const locale of locales) {
    if (language.indexOf(locale) > -1) {
      return locale
    }
  }
  return 'zh'
}

const localeData = {
  globalInjection: true, // 如果设置true, $t() 函数将注册到全局
  legacy: false, // 如果想在composition api中使用需要设置为false
  // 默认语言
  // locale: settings.defaultLanguage,
  locale: getLanguage(),
  messages // set locale messages
}

export default new VueI18n(localeData)
