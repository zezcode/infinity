i18next.use(i18nextBrowserLanguageDetector).init({
    detection: {
      order: ['querystring', 'cookie', 'localStorage', 'navigator', 'htmlTag', 'path', 'subdomain'],
      caches: ['cookie']
    },
    fallbackLng: 'en',
    debug: false,
    resources: {
        en: {
          translation: {
            'copy success': 'Sao chép thành công',
            'monthly fee': 'Giá 1 tháng',
            'quarterly fee': 'Giá 3 tháng',
            'semi annua fee': 'Giá 6 tháng',
            'annual fee': 'Giá 1 năm',
            'biennial fee': 'Giá 2 năm',
            'onetime fee': 'Dài hạn',
            'insufficient permissions': 'Insufficient permissions',
            'confirm importing subscription link': 'Xác nhận đồng bộ máy chủ vào app',
            'the value is not a valid email address': 'The value is not a valid email address',
            'email address is required': 'Email address is required',
            'password is required': 'Password is required',
            'sorry looks like there are some errors detected, please try again': 'Sorry, looks like there are some errors detected, please try again.',
            'please enter valid password': 'Please enter valid password',
            'password confirmation is required': 'Password confirmation is required',
            'password and its confirm are not the same': 'Password and its confirm are not the same',
            'day': 'Ngày',
            'minute': 'Phút',
            'hour': 'Giờ',
            'second': "Giây",
            'language': "Ngôn ngữ"
          }
        },
        zh: {
          translation: {
            'copy success': '复制成功',
            'monthly fee': '月付',
            'quarterly fee': '季付',
            'semi annua fee': '半年付',
            'annual fee': '年付',
            'biennial fee': '两年付',
            'onetime fee': '一次性付',
            'insufficient permissions': 'Không có quyền làm việc này',
            'confirm importing subscription link': 'Xác nhận đồng bộ máy chủ vào app',
            'the value is not a valid email address': '该值不是有效的电子邮件地址',
            'email address is required': '电子邮件地址不能为空',
            'password is required': '密码不能为空',
            'sorry looks like there are some errors detected, please try again': '很抱歉，似乎检测到了一些错误，请重试。',
            'please enter valid password': '请输入有效的密码',
            'password confirmation is required': '确认密码不能为空',
            'password and its confirm are not the same': '密码和确认密码不匹配',
            'day': 'Ngày',
            'minute': '分钟',
            'hour': '小时',
            'second': "秒",
            'language': "语言"
          }
        }
      }
  });


if (getCookie('i18next') == 'zh-CN') {
  $(`[onclick="changeCurrentLanguage('zh-CN')"]`).addClass('active');
} else if (getCookie('i18next') == 'en-US') {
  $(`[onclick="changeCurrentLanguage('en-US')"]`).addClass('active');
} else {
  if (navigator.language == 'zh-CN') {
    $(`[onclick="changeCurrentLanguage('zh-CN')"]`).addClass('active');
  } else {
    $(`[onclick="changeCurrentLanguage('en-US')"]`).addClass('active');
  }
}

function changeCurrentLanguage(lng) {
  document.cookie = "i18next=" + lng;
  //$(`[onclick="changeCurrentLanguage(${lng})"]`).addClass('active');
  location.reload();
}