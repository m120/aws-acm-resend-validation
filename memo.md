# AWS ACM CLI Memo

[Reference: AWS CLI Command Reference: acm](https://docs.aws.amazon.com/cli/latest/reference/acm/index.html)

### CLI Memo
- "State: PENDING_VALIDATION" Certificate List
```Shell
$ aws --prof "{profile}" acm list-certificates --certificate-statuses PENDING_VALIDATION
```

-  resend-validation-email
```Shell
$ aws --prof "{profile}" acm resend-validation-email --certificate-arn "{CERT-ARN}" --domain "{DOMAIN}" --validation-domain "{DOMAIN}"
```
