Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41679C52D7C
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 19:04:44 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.1077.1724094279526481953
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 19 Aug 2024 12:04:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=qos3LyxT;
 spf=pass (domain: linaro.org, ip: 209.85.219.49, mailfrom: javier.tia@linaro.org)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6bf775d1bdfso24270276d6.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 19 Aug 2024 12:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724094278; x=1724699078; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SLHu6PRlZnCzW/rU1UEj78mshvoxk7WjoojsTwAZ3/I=;
        b=qos3LyxTTJ4WPILZPSPWysvFIz48fHhtHdq2miHYcn+O2BN78/ARXIvE0yUMJWgLpR
         YV+tyhU5lsJKpP3AiM2XRNqbLGzSiuB4jArQbwPCsj8hNTZEfQx7ZQkTkAZO6kNG5x7K
         2jIphfr6rZ1Eq7oA91lLxZnWhtau26Vy+wxqrTGKMYK8OE2rXrra/87THTovcLaOeDsE
         DBtY/HzrIhuEOraprO0Ge9OfxY4SqFA91aNfouxVSmTBlN57KaUHCSf5KuAOA4j55vhx
         evQ+8Le44ga0+SJhiq5fBalveUEpX2F9e1ruz54x5M0dzeDwsyQNltSwexDqwRMXjqFL
         b0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724094278; x=1724699078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SLHu6PRlZnCzW/rU1UEj78mshvoxk7WjoojsTwAZ3/I=;
        b=BWmKCE6TBVtl0ww1WCA52cmx77z+nXZ8aZpIq8H3cYvSOHzYmBSNuBGi4ivs330QPu
         pxOIAm+cgemI2QQxbxMm4BuYTtHTDP7Gk+qa58r4xH+H0ik17yRMOcOHW+aNrZI3d2RJ
         /eDct7ZcBOsBG+MSg5ctKSyEB7lO0XTgT5v1MbyMP3dfAzSVYAKotEzfZoW9ePTOi1nB
         7cLwJZagvM0L/MALA/cPkKNWkS6WcuW1QOpyxAbrgMaC6fmn6g/DAKeGVgaQSpCGrA80
         pF6V8+12r5sGbZW2Qdlbvc6SPjgdeG1t0NAV8F8e9shGbqD29IhtYqXXaZy55QGP7o/5
         22zw==
X-Gm-Message-State: AOJu0Yx2U4ZvbI0Tplk+GuwGJ7rPZOUaJ5uaU/FOQ8IYB06IPueqwejr
	8fX+u9Fq+Ub2hx04NIdSw39kV2uy8suIblbBKtTKterpZl9mAmUL3cvRmKJqWy1gqrRiBIVkeyF
	A
X-Google-Smtp-Source: AGHT+IGHqAABdsh1wMdVFKIlj+Rsc+lIi0I6KmUcwxH203pLHhpLcYthEw5K8ABeOLzvHlRcnmTE5A==
X-Received: by 2002:a05:6214:5f01:b0:6b5:936d:e5e9 with SMTP id 6a1803df08f44-6bf7cdf0a71mr175759536d6.26.1724094278263;
        Mon, 19 Aug 2024 12:04:38 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([177.93.4.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fe06feasm45371756d6.40.2024.08.19.12.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 12:04:37 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v2 04/14] uefi-sb-keys.bbclass: Add class to validate UEFI keys
Date: Mon, 19 Aug 2024 13:04:19 -0600
Message-ID: <20240819190429.2897888-5-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819190429.2897888-1-javier.tia@linaro.org>
References: <20240819190429.2897888-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 19 Aug 2024 19:04:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5970

Without UEFI keys, signing will fail and the OS will not boot.

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 meta-arm/classes/uefi-sb-keys.bbclass | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-arm/classes/uefi-sb-keys.bbclass

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
2.46.0


