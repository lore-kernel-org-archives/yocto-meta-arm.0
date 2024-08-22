Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A7A8C54730
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 01:43:58 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.4157.1724291037964108699
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Aug 2024 18:43:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=aHXlwSls;
 spf=pass (domain: linaro.org, ip: 209.85.128.176, mailfrom: javier.tia@linaro.org)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6c0e22218d0so4363807b3.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 21 Aug 2024 18:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724291037; x=1724895837; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Sw6qgwfeoRcTz5HRF/e7ri5lXvqhu/5iyjFHNupvjw=;
        b=aHXlwSls4f/6VGyyUNCbv17SgWiuC/zUoasJjHYR7CrA5BDZWeI7YPaGQn2tKFmVSB
         jravTonZL7uHvRh+DRg5JkBNwixrYoHXOviE72SaA91nM8QcXoioElTLVso/vRq6huOb
         jKBIJUPZJhnFESTFG6so50mtljRWEAT98azE8ILb+LVRxFQeNaM/82uNnZgQEXhYG6b8
         IzmCIc+4t6ymUI/RcS5fdnS8a5ldQlhkEK8R1Of/ZA/7CIt/bKukDmYH4z0eHb2oRR78
         cq4A3H/RMth9nHE7pMDYQbFhYO2ONFYi0W5DYvF+rsigwWtjLUcdaDW0tKaGKsh6hH9i
         m9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724291037; x=1724895837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Sw6qgwfeoRcTz5HRF/e7ri5lXvqhu/5iyjFHNupvjw=;
        b=wYzAJtpp2Zs0cIG7VV+Jo6E+ayvIr2OO/2nFmL9lrF3HDbzxS7TwmoHVRieVD24TFk
         g86R8bGgTvYYlbbIFybBEacVXEa2evmwna/64vD+RWVYx1krakjFmTC0EFii7dCR+11Q
         pG2Jgor2XGoIawcvOh4fG3ME/yjFX9eZQWFM5XqCxPjKS+LsLUq21rhOfy5l1ahYp2Gr
         v9QEMId3PaeguJYG99C0QBI7qBWWEKmwpTEmlJ3kmYDyAy+QTawA8b9k6XFMbpHMJUem
         1leuKlUbcJPZ89ByQMJR0PCT/18SEkacU9xhwAzNVFb+7cXw+pQE92EydqQN1fNXd6Kc
         AivQ==
X-Gm-Message-State: AOJu0YxED8JUlC3nc4u15bcA43PvnsSlx3c6+ZGu4boksF+JhT5I735+
	x6hNr11qtRngegntwrU9s/D0reiCcb0Ut0Bo0mKOaXImzSw64a7E6LRx0pZTMqg7O9YrCJ6TRJy
	k
X-Google-Smtp-Source: AGHT+IHG39C9fVSOgxui66mxzIuMRERVEIUxSa+StlzHQfi015+h8zoIvIE+p8QvrfTvaPAnkgkQpA==
X-Received: by 2002:a05:690c:6305:b0:648:bca0:1e71 with SMTP id 00721157ae682-6c3d542f438mr4655827b3.35.1724291036855;
        Wed, 21 Aug 2024 18:43:56 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39e6eae07sm707757b3.145.2024.08.21.18.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 18:43:56 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v3 13/13] meta-arm: Add UEFI Secure Boot test
Date: Wed, 21 Aug 2024 19:43:35 -0600
Message-ID: <20240822014335.3394568-14-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240822014335.3394568-1-javier.tia@linaro.org>
References: <20240822014335.3394568-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Aug 2024 01:43:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6003

Add a test to verify UEFI Secure Boot is enabled

Run the test:

kas build 'ci/qemuarm64-secureboot.yml:ci/testimage.yml'

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 ci/qemuarm64-secureboot.yml                   |  2 ++
 .../core-image-base-uefi-secureboot.inc       |  6 +++-
 .../oeqa/runtime/cases/uefi_secure_boot.py    | 32 +++++++++++++++++++
 3 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm/lib/oeqa/runtime/cases/uefi_secure_boot.py

diff --git a/ci/qemuarm64-secureboot.yml b/ci/qemuarm64-secureboot.yml
index 958a1ff1..02341934 100644
--- a/ci/qemuarm64-secureboot.yml
+++ b/ci/qemuarm64-secureboot.yml
@@ -11,6 +11,8 @@ local_conf_header:
   optee: |
     IMAGE_INSTALL:append = " optee-test optee-client optee-os-ta"
     TEST_SUITES:append = " optee ftpm"
+  uefi_secure_boot: |
+    TEST_SUITES:append = " uefi_secure_boot"
 
 machine: qemuarm64-secureboot
 
diff --git a/meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc b/meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc
index e5cf7760..ce64b8b5 100644
--- a/meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc
+++ b/meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc
@@ -10,4 +10,8 @@ QB_DEFAULT_KERNEL = "none"
 
 KERNEL_IMAGETYPE = "Image"
 
-IMAGE_INSTALL += "systemd systemd-boot"
+IMAGE_INSTALL += "systemd systemd-boot util-linux coreutils efivar"
+
+inherit extrausers
+
+EXTRA_IMAGE_FEATURES += "allow-root-login empty-root-password"
diff --git a/meta-arm/lib/oeqa/runtime/cases/uefi_secure_boot.py b/meta-arm/lib/oeqa/runtime/cases/uefi_secure_boot.py
new file mode 100644
index 00000000..4a62b54c
--- /dev/null
+++ b/meta-arm/lib/oeqa/runtime/cases/uefi_secure_boot.py
@@ -0,0 +1,32 @@
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
+
+class UEFI_SB_TestSuite(OERuntimeTestCase):
+    """
+    Validate Secure Boot is Enabled
+    """
+
+    @OETimeout(1300)
+    def test_uefi_secure_boot(self):
+        # Validate Secure Boot is enabled by checking
+        # 8be4df61-93ca-11d2-aa0d-00e098032b8c-SecureBoot.
+        # The GUID '8be4df61-93ca-11d2-aa0d-00e098032b8c' is a well-known
+        # identifier for the Secure Boot UEFI variable. By checking the value of
+        # this variable, specifically
+        # '8be4df61-93ca-11d2-aa0d-00e098032b8c-SecureBoot', we can determine
+        # whether Secure Boot is enabled or not. This variable is set by the
+        # UEFI firmware to indicate the current Secure Boot state. If the
+        # variable is set to a value of '0x1' (or '1'), it indicates that Secure
+        # Boot is enabled. If the variable is set to a value of '0x0' (or '0'),
+        # it indicates that Secure Boot is disabled.
+        cmd = "efivar -d -n 8be4df61-93ca-11d2-aa0d-00e098032b8c-SecureBoot"
+        status, output = self.target.run(cmd, timeout=120)
+        self.assertEqual(output, "1", msg="\n".join([cmd, output]))
-- 
2.46.0


