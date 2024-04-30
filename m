Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BABA2C10F16
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 12:37:58 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.14056.1714480673303558215
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 05:37:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=jGDmm7gW;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-516d3a470d5so6975409e87.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 05:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714480671; x=1715085471; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tnd3M0PwMZ6yQVhaLKIucZLwmfXvKhyl9thsZed0y/U=;
        b=jGDmm7gWjVP+dJb3VKg6fdsXRQYCB/N5qj2o/QMFLYDxXEMqQ0ddyOZZgtceomWa/m
         Jin2U/gi6bf3zDD0G4hqQrBH2MivkL0kMhi7KASd6mJ6gdCDOJUmIK/gFRGXDSTW+Lwk
         lB1pfIhyq3qnG5Zef3BK2BCrr+6PaVZDNo3+tG6vGLZFpxzweBh1VrdT+H0A0MCJajBu
         EGguUDKtfcDCaccsc4yuI7C2MqTO3K6HR+AyqYKJAQZxJvGW+DCGW/+pSsjAKP1tj9hY
         FKF/Rr/BrAayxy5n9OI1072HSs5daL/fDxuz0m0+pW8NXmXOVyM3rjbCpmDUpSlUz4bE
         OeAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714480671; x=1715085471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tnd3M0PwMZ6yQVhaLKIucZLwmfXvKhyl9thsZed0y/U=;
        b=nWWBd5XrQSf/wU4v6gbWYFTyTd+rGNWf+y/8FknyPiI37hoOrRuAwer+xNfnOH0k4M
         jM7XMkNEvQHaGH0nCdniDcvhOeJ31xwsmjHa1i8iZL3z0x1vQVfuFNB+aEP0AzrGnfTM
         vsNSVeGGngG2arGYR92xvxA7JHcL6cZecMJn9YvgtPXWhQmeG8d/uvyqWpUhzFCluUCT
         KBvso401JewtP6zQXkzcC0fg7EdqwVVftLsY3QlfM+w+5gK8Fzholi5QefgA65vThny2
         LfyW5gbbvFz8Fud+qUXmUK4oMAyMCxSNIAQ6OGVq8Y2965u6+9WcY7TRt+tgCggOKwvW
         6pCw==
X-Gm-Message-State: AOJu0YxN3En05ZJUy8ongJZLiQX1nIjWqax4ex0Mt50W1E0eK12wOhG5
	ujyeG5O5QGEnpArvxlcCg52NDRhJQcJ+z88/P7qjEy8H1rScqAs8WQahRmXxVARsl8iI3yFtLNS
	c6q8=
X-Google-Smtp-Source: AGHT+IGCXu8vUoe2G8ta4KZRUV88uGjTmXPl1Y3bLXTFw0Qp2vDCHIDOdfJlimtSpCNpNqJcH22fAg==
X-Received: by 2002:a05:6512:448:b0:519:6e94:9b4d with SMTP id y8-20020a056512044800b005196e949b4dmr9265868lfk.48.1714480671633;
        Tue, 30 Apr 2024 05:37:51 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id cf12-20020a056512280c00b0051b41844048sm3011149lfb.285.2024.04.30.05.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 05:37:51 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 3/6] oeqa runtime: add optee.py test
Date: Tue, 30 Apr 2024 15:37:29 +0300
Message-Id: <20240430123732.534277-4-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240430123732.534277-1-mikko.rapeli@linaro.org>
References: <20240430123732.534277-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 12:37:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5644

The test runs xtest test suite from optee-tests package.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta-arm/lib/oeqa/runtime/cases/optee.py | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-arm/lib/oeqa/runtime/cases/optee.py

diff --git a/meta-arm/lib/oeqa/runtime/cases/optee.py b/meta-arm/lib/oeqa/runtime/cases/optee.py
new file mode 100644
index 00000000..0a0bc31e
--- /dev/null
+++ b/meta-arm/lib/oeqa/runtime/cases/optee.py
@@ -0,0 +1,24 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+import os
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.runtime.decorator.package import OEHasPackage
+from oeqa.core.decorator.oetimeout import OETimeout
+
+class OpteeTestSuite(OERuntimeTestCase):
+    """
+    Run OP-TEE tests (xtest).
+    """
+    @OETimeout(800)
+    @OEHasPackage(['optee-test'])
+    def test_opteetest_xtest(self):
+        # clear storage before executing tests
+        cmd = "xtest --clear-storage || true"
+        status, output = self.target.run(cmd, timeout=60)
+        self.assertEqual(status, 0, msg='\n'.join([cmd, output]))
+        cmd = "xtest"
+        status, output = self.target.run(cmd, timeout=600)
+        self.assertEqual(status, 0, msg='\n'.join([cmd, output]))
-- 
2.34.1


