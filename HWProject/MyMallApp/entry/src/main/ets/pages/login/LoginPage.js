/**
 * 登录页面
 */
import CommonConstants from '../CommonConstants';
import prompt from '@ohos.promptAction';
import router from '@ohos.router';
/**
 * 自定义输入框的样式
 */
function inputStyle() {
    
  
        .placeholderColor(Color.Gray)
        .height(40)
        .fontSize(20)
        .width('90%')
        .margin({
        left: 20, bottom: 10, right: 20
    });
}
/**
 * 自定义文本样式
 */
function blueTextStyle() {
    
  
        .fontColor(Color.Blue)
        .fontSize(14)
        .fontWeight(400)
        .margin({ top: 12, left: 8, right: 8 });
}
struct LoginPage extends   {
    constructor(/**
     * 登录页面
     */ /**
 * 登录页面
 */
    /**
     * 登录页面
     */
    ) {
        /**
         * 登录页面
         */
    }
    build() {
        .width('100%')
            .height('100%');
    }
    imageBtn(img) {
        .height(50)
            .width(50)
            .backgroundColor(null);
    }
    login() {
        if (this.account === '' || this.password === '') {
            prompt.showToast({ message: "用户名、密码不能为空！" });
        }
        else {
            this.isShowProgress = true;
            if (this.timeOutId === -1) {
                // 设置一定两秒定时器
                this.timeOutId = setTimeout(() => {
                    // 两秒后执行
                    this.isShowProgress = false;
                    this.timeOutId = -1;
                    prompt.showToast({ message: '登录成功！页面即将跳转。' });
                    router.pushUrl({
                        url: 'pages/mine/MyPage'
                    });
                }, 2000);
            }
        }
    }
    aboutToDisappear() {
        // 取消定时器 回收资源
        clearTimeout(this.timeOutId);
    }
}
//# sourceMappingURL=LoginPage.js.map