Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A2CC3DA63
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 20:35:59 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.4158.1721334954307240111
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jul 2024 13:35:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=v9PouM1T;
 spf=pass (domain: linaro.org, ip: 209.85.128.175, mailfrom: javier.tia@linaro.org)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-662dc911cf2so12467847b3.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 18 Jul 2024 13:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721334953; x=1721939753; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YOvRUm1ARNIkb1HW47YskDYrcmWvMwF9wX7v1a1IC7s=;
        b=v9PouM1TAjrtHdlDjbgEyQmmOPRWwGIut2Ktq4CfhsCFs2g9RB2YDtXUSSVTftatEc
         tTkWUpSvB/skJCzkUwv8G5mBl9rWPuU8jnCMzZ8+aP8B6wRSOqqPoEvxOMbgOMtjrzpw
         63jrLXga8B0Lijox0C/t/4xqT+AAJ6e3kLtMf/e4fm8/SMv7dn2FzotGq66da3MYb0Q+
         O74nskMPH5JnVB6o4S5V1pURsKVydvfcW5PszM/m9WS8UujvWD34xWw24JuPqxDx1nJ3
         MQ9u0QivK39IjKlYGV6SKWouRBdqcrGECQqujv3jm4oygZLoFz5EP/fQxVJimzIIzzLt
         wVeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721334953; x=1721939753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YOvRUm1ARNIkb1HW47YskDYrcmWvMwF9wX7v1a1IC7s=;
        b=PIakgH4UpcEepvpA1+sMBs9R0Wtt4tXqHYpKb7ZZ0+AmtgZb1/H1X5Nz3s4KHKGfEe
         37O6+00fQr3pvQHzCpf8207gvh/V5fEpuB7N8GeqA7WXAA8xqoFy/LKydaxRRo2BB1cX
         MjJzLL2jCZIrn0MxndSNo/fk2JzuEDU+BhYA72Q29tl1TPq4Q2y3pAeMvIRdWL/Iyw1+
         34MXRTQ2H2dffAeag2L4RquNZHQ2hYIXL/ATeo2j/6rbo5/iLtlTJk/UVsAQa/0xRyGH
         igSkGFJdvme9AE1uOW/Nj0EAmxQEGRN943fIF1ErmVT0B6G79WpVmUlp/6BQxqWopND0
         0Gag==
X-Gm-Message-State: AOJu0YwB95qKpchIIQ9A24+QbJHh4H0enCuKJh/4id2n1bd93yw9HdoZ
	+E3tdkBWXCuRSIPxc+0crr8w6Y5JSV4FIqT0W5cU24DfqREcBEv97v7hKkYlkwO/UK59fdaRZ1H
	cRFA=
X-Google-Smtp-Source: AGHT+IGrblPRx3fkyzDMqOPFOFWDG1m7ugM7j6jGw1V463+lYtbnAgu9PaJ8e+wQ3lgNY2SJ4qL+5w==
X-Received: by 2002:a05:690c:4712:b0:65f:d82c:af86 with SMTP id 00721157ae682-66601ccd6admr46913487b3.16.1721334953302;
        Thu, 18 Jul 2024 13:35:53 -0700 (PDT)
Received: from localhost.localdomain ([190.171.102.111])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6695245a1dasm171657b3.53.2024.07.18.13.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 13:35:53 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v1 3/7] qemuarm64-secureboot: Validate UEFI keys exist
Date: Thu, 18 Jul 2024 14:35:22 -0600
Message-ID: <20240718203526.52214-4-javier.tia@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240718203526.52214-1-javier.tia@linaro.org>
References: <20240718203526.52214-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 18 Jul 2024 20:35:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5902

Without UEFI keys, signing will fail and UEFI Secure Boot will be
disabled.

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 .../core-image-base-uefi-secureboot.inc       |  2 ++
 meta-arm/classes/uefi-sb-keys.bbclass         | 24 +++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 meta-arm/classes/uefi-sb-keys.bbclass

diff --git a/meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc b/meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc
index 9f20e3f4..4ab3ecf9 100644
--- a/meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc
+++ b/meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc
@@ -1,3 +1,5 @@
+inherit uefi-sb-keys
+
 # Detected by passing kernel parameter
 QB_KERNEL_ROOT = ""
 
diff --git a/meta-arm/classes/uefi-sb-keys.bbclass b/meta-arm/classes/uefi-sb-keys.bbclass
new file mode 100644
index 00000000..e800b4c6
--- /dev/null
+++ b/meta-arm/classes/uefi-sb-keys.bbclass
@@ -0,0 +1,24 @@
+# Validate UEFI keys
+python __anonymous () {
+    if d.getVar("UEFI_SB_KEYS_DIR", False) is None:
+        raise bb.parse.SkipRecipe("UEFI_SB_KEYS_DIR is not set.")
+
+    # keys used for UEFI secure boot
+    uefi_sb_keys = d.getVar("UEFI_SB_KEYS_DIR")
+
+    keys_to_check = [
+        uefi_sb_keys + "/PK.esl",
+        uefi_sb_keys + "/KEK.esl",
+        uefi_sb_keys + "/dbx.esl",
+        uefi_sb_keys + "/db.esl",
+        uefi_sb_keys + "/db.key",
+        uefi_sb_keys + "/db.crt",
+    ]
+
+    missing_keys = [f for f in keys_to_check if not os.path.exists(f)]
+
+    if missing_keys:
+        raise bb.parse.SkipRecipe("Required missing keys: %s" % (", ".join(missing_keys), )
+            + ".\nRun %s/gen_uefi_keys.sh to generate missing keys." % uefi_sb_keys)
+
+}
-- 
2.45.2


