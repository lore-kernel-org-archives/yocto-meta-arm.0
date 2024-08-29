Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67043C87FC3
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 16:32:36 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.24080.1724949148515633324
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Aug 2024 09:32:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=SYZub/i9;
 spf=pass (domain: linaro.org, ip: 209.85.128.181, mailfrom: javier.tia@linaro.org)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6b8f13f28fbso7917307b3.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 29 Aug 2024 09:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724949147; x=1725553947; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r048M551uetY0q1BuW2zCSzxBwWhWQ4Zf1IPFDak7rM=;
        b=SYZub/i9NTgGxjZtBfIRfo1ZMFIkOQQescy2lzO4Z6P9aaAMjTQB9Y8FC749LgXQlX
         T0ya0yrJjRV2Vjndsyig6d8oXjh31206jTOMyXNhNTUOIvaf9ttDGD5basbkIaxY/9Tf
         M9IcGsuoCMV29zQvRF2b6jBH3REsoIk0ZXlnVqLyjFV1+GQS/Ah4/oB2ITS4YzkwXv3B
         wwVtDIo0HU7DCAKPFoyTLxAjBBL9MgkOwnMMJBZn+oN8dCGqai+oBEwEiXelxn4igspu
         RvuJCUGafV1vGuFY17eSMUmc8Maj+tQL2vMGcVf0VFRVhFWDrmlOnDoCpqR+DjJeqnM9
         6Hng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724949147; x=1725553947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r048M551uetY0q1BuW2zCSzxBwWhWQ4Zf1IPFDak7rM=;
        b=gIdM8JDwwfpN1mTzt4bbm7a4HP/ICucf32G8ybLfCRyuX5m9E86RRq0p1+50u2KRF4
         +TOvVsElY5FCwZlxBpSCpNif75FvF75tQa3Cf2xTZBaMl6sG9aiLRUzDpI4UTG9ARRBN
         WLhJ1z8EYxaSuz5HyQ8rzIfvPVaMsLZeIm8lEEFbjCKOoTXSCd2xsismgjDAT2W5qZXQ
         wzqBI+/CxD1/neT36ryXdYkB/05u8p6BaKWB9Vr8gvUhARfvRXSygOuIsVFdNMm/mKvU
         9fAgRrhZ3bApSfFCjmWReBf4mX5PwldYkisqQkZWKLvmrBwdJee/ek08+yM0MrRE0O7/
         mpxw==
X-Gm-Message-State: AOJu0YyO4xDrPFbcyoE7kILE6m6OtOlqirLzD4CEcGDEdThbEfn7vOgZ
	8cbncI9i85aStD+EzuqAuwM64ax/7DTJwW58qKaTKQQDG4rHC2QqNXTlSov3xKCGmL41GXo+wzq
	y
X-Google-Smtp-Source: AGHT+IEEB47FRjcPQV0dIwav0fminqb81rO2jKe+CMMOfWp+IttoPHwVQ6qP61YyXq/dk+mypX0eNA==
X-Received: by 2002:a05:690c:2f0f:b0:6ad:b01a:9469 with SMTP id 00721157ae682-6d277d666d6mr31361727b3.39.1724949147505;
        Thu, 29 Aug 2024 09:32:27 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d2d438e18asm2993517b3.60.2024.08.29.09.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 09:32:27 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v4 13/13] meta-arm: Add UEFI Secure Boot test
Date: Thu, 29 Aug 2024 10:32:09 -0600
Message-ID: <20240829163209.47945-14-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240829163209.47945-1-javier.tia@linaro.org>
References: <20240829163209.47945-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 29 Aug 2024 16:32:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6023

Add a test to verify UEFI Secure Boot is enabled

Run the test:

kas build 'ci/qemuarm64-secureboot.yml:ci/testimage.yml'

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 ci/qemuarm64-secureboot.yml                   |  2 ++
 .../oeqa/runtime/cases/uefi_secure_boot.py    | 32 +++++++++++++++++++
 .../core-image-minimal-uefi-secureboot.inc    |  6 +++-
 3 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm/lib/oeqa/runtime/cases/uefi_secure_boot.py

diff --git a/ci/qemuarm64-secureboot.yml b/ci/qemuarm64-secureboot.yml
index 03281a08..3eb8c20c 100644
--- a/ci/qemuarm64-secureboot.yml
+++ b/ci/qemuarm64-secureboot.yml
@@ -11,6 +11,8 @@ local_conf_header:
   optee: |
     IMAGE_INSTALL:append = " optee-test optee-client optee-os-ta"
     TEST_SUITES:append = " optee ftpm"
+  uefi_secure_boot: |
+    TEST_SUITES:append = " uefi_secure_boot"
 
 machine: qemuarm64-secureboot
 
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
diff --git a/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc b/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc
index e5cf7760..ce64b8b5 100644
--- a/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc
+++ b/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc
@@ -10,4 +10,8 @@ QB_DEFAULT_KERNEL = "none"
 
 KERNEL_IMAGETYPE = "Image"
 
-IMAGE_INSTALL += "systemd systemd-boot"
+IMAGE_INSTALL += "systemd systemd-boot util-linux coreutils efivar"
+
+inherit extrausers
+
+EXTRA_IMAGE_FEATURES += "allow-root-login empty-root-password"
-- 
2.46.0


