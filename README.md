# PublicKeyEncrypt

Utility methods to ease the creation of encrypted strings.

## Usage

1. Add /PublicKeyEncrypt.playground/Sources/Encrypt/* to your project
2. Use it like this:

```swift
let publicKey = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA3J2wk8n6yI/M1CsJUtyRVJ1+cSzCH9OEUM4PspK8ci7LRrTujQcBtgs1jRW39rdljub994gysC9efJ4JcUWxGWB8G8CFnFoYgfhr27vFBEUX2Fj0Pfy9QwLCpXRzYrFJeEiyPR1hqPoz68850zTQ6vbFNPrekyP7AA0/LZva4H7RFR6KXwJwce9qqXdtmudQvF+VXDOufx+sLs6Bir79OpDw54YP5C0WEWkF3WkqjaQfi1/SMPzaCATu1aNAGsarIieKdzPDRFHYACWuYVXTv5STrLrwTfD6yS+vDKgX2nyhtJzQvek+2Z1OGgAxz+u++UDTC4/W7TGyo8hGRovUrQIDAQAB"
let message = "message"

print(publicKey.encrypt(message)!)
print(message.encrypt(with: publicKey)!)
```
