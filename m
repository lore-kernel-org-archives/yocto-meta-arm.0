Return-Path: <leo.yan@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A91CC433EF
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 12:06:28 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.6458.1655985985463452605
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Jun 2022 05:06:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=HArf2GmY;
 spf=pass (domain: linaro.org, ip: 209.85.216.53,
 mailfrom: leo.yan@linaro.org)
Received: by mail-pj1-f53.google.com with SMTP id cv13so15924814pjb.4
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Jun 2022 05:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uf5iX9DILyq4FLwdcR/HkZmAw4QHY+B29w7J8RxGyIc=;
        b=HArf2GmYY13pw0un5kKURYjK1MMfkQGY+R+8libx9waEOV/sx8NL1Dio6ovxnnhPKW
         s4spTQRHaYqlf/l8tTbIHsxzWbT78pS2udmKFn/GSzpSXAyHoRuFJAgG41bF0Yzsfd74
         DacWvDd+dMJpPhIXO9J9mSUo4q/t3ddDqEF8HfqMVZQ34+e6bS1olt3QcheXIAw8yLkT
         zx7eogyaUHt3+Q9EDN2Zagp+rqBtI/OfbABnnpe4kdoSnuZ7rD/tr7sm+tHPkcHJVKtW
         dKxy7bfuhu9m0KSv77JvsfHFrCdBnChSZoaHtKL9qVSt57C2OStwqeQMmIH4iX4XzAHF
         6ODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uf5iX9DILyq4FLwdcR/HkZmAw4QHY+B29w7J8RxGyIc=;
        b=tSGauA0MZztZRYKzCS5yrJ98UM73moFhrFEHQOWgyy9E7p8JNeDLsKn421c8qrRh9G
         bV/HFmlSzTgsLkobcUtkzWLRvsvaAHpyJOLN4gOy8+0hXnvEZuyp9kCrQ79T2hcT1aEg
         TpvoW3lFFGO1wH275GuZ0gUQu1TldZbc1kjjwHdEArsfgEPeNW5mPbiIrJ+KoLO4FJXG
         +8aEm2AdScnEtxihp8p4Arr9j6D9oeZRiQc2gnzYIlLBfXHYb/OqHx890fY6UyaiKWCp
         S3VYz2FJr1I3y8W/GsfeRGu1HmH/09iai2xHjwxDqfQP7P504ZxaZJHH5iylupQcEh/X
         m7mQ==
X-Gm-Message-State: AJIora+pNRV5nDuhjAlp2WjU24kyB5LmFQSr0jKmx765ITY3m9M9V8e0
	z32o2yorAwUsxqTjtmVtfX3udNLb4tGG2Qt4inFzmQ==
X-Google-Smtp-Source: 
 AGRyM1vCjArnfDaxRmCoxqyECI4YZI2tsjbKVtydNSBXjHXW7HdpYSKfyBMlFfeBMOUYPYnAYVZSEw==
X-Received: by 2002:a17:90b:2248:b0:1ea:8403:d81c with SMTP id
 hk8-20020a17090b224800b001ea8403d81cmr3768876pjb.97.1655985984839;
        Thu, 23 Jun 2022 05:06:24 -0700 (PDT)
Received: from leo-build-box.lan
 (ec2-54-193-69-205.us-west-1.compute.amazonaws.com. [54.193.69.205])
        by smtp.gmail.com with ESMTPSA id
 d2-20020a056a00198200b0051b9ecb53e6sm15390682pfl.105.2022.06.23.05.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 05:06:24 -0700 (PDT)
From: Leo Yan <leo.yan@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Leo Yan <leo.yan@linaro.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Jerome Forissier <jerome.forissier@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH] optee-ftpm: Update to "main" branch
Date: Thu, 23 Jun 2022 20:06:16 +0800
Message-Id: <20220623120616.210153-1-leo.yan@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 23 Jun 2022 12:06:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3533

Since the github repository doesn't contain a "master" branch bu has the
"main" branch now, this patch updates to the "main" branch so can
download the repository successfully.

CC: Ilias Apalodimas <ilias.apalodimas@linaro.org>
CC: Jerome Forissier <jerome.forissier@linaro.org>
CC: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
index d282c25..3b4eb5c 100644
--- a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
+++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
@@ -19,7 +19,7 @@ DEPENDS = "python3-pyelftools-native optee-os-tadevkit python3-cryptography-nati
 
 FTPM_UUID="bc50d971-d4c9-42c4-82cb-343fb7f37896"
 
-SRC_URI = "gitsm://github.com/Microsoft/ms-tpm-20-ref;branch=master;protocol=https \
+SRC_URI = "gitsm://github.com/Microsoft/ms-tpm-20-ref;branch=main;protocol=https \
            file://0001-add-enum-to-ta-flags.patch"
 
 SRCREV = "d638536d0fe01acd5e39ffa1bd100b3da82d92c7"
-- 
2.25.1


