import http from '@ohos.net.http'

@Entry
@Component
struct HttpReq {
  @State text:string = "123"
  aboutToAppear() {
    let httpReq = http.createHttp()
    httpReq.request('https://api.apiopen.top/api/sentences', { method: http.RequestMethod.GET },
      (err, data) => {
        if (!err) {
          this.text = JSON.parse(`${data.result}`).result.name
          console.log(this.text);
        } else {
          this.text = err.name
        }
      })
  }

  build() {
    Row() {
      Column() {
        Text(this.text)
      }
      .width('100%')
    }
    .height('100%')
  }
}