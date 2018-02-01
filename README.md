# aws-acm-resend-validation

:us: Execute "Resend validation email" on the certificate with "Renewal status" "Pending validation" in AWS ACM

:jp: ACMで更新ステータスが検証保留中の証明書に対して検証Eメールの再送信を実行する

## Usage
*Shell* or *Docker*

### Execute Shell :shell:
```
$ bash ./acm-resend-validation.bash
```

### Docker :whale:
#### Build/Run
```Shell
$ docker build -t acm-resend-validation .

$ docker run --rm -v ~/.aws:/root/.aws:ro acm-resend-validation
```

