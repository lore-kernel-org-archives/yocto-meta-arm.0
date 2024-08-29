Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58F07C87FC5
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 16:32:26 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.24034.1724949138177010079
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Aug 2024 09:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=kM7PGYTz;
 spf=pass (domain: linaro.org, ip: 209.85.128.171, mailfrom: javier.tia@linaro.org)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6ca1d6f549eso10422567b3.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 29 Aug 2024 09:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724949137; x=1725553937; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SLHu6PRlZnCzW/rU1UEj78mshvoxk7WjoojsTwAZ3/I=;
        b=kM7PGYTzQvs4TBzLjjIj5KmZAHXCajYbKPsJ7MvxbmqMLELhsOogSFcv5Nix2G6ku7
         CqFW57cgAZMs9m7BG6AmYOAkMleVAgzRXlgMrcqm25C3YBeqvZkmXYmHnjiaa3DWMf6s
         NmQ8+JoUqokz0fqiNk26zZQyanFv2G9c76AbEjwolXtmviwsjP6gVDv+10WZ9cPGa3V1
         Rpe6a4MSC5Bx6aaNbXHEZqMa3U8ZQw9hzGNS+aantIYDQEYjqU2dvb36JHphKhiQwqzs
         Y3JOXYDGHJL2GyVimw9fM7Ie4SgLe9Gqv9wvdfmmm4R8E40QbKNs9T+gyRMizWdCAQvB
         h0dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724949137; x=1725553937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SLHu6PRlZnCzW/rU1UEj78mshvoxk7WjoojsTwAZ3/I=;
        b=A0tCpNuFG/OPoudAn5Qv0c/I+S2+G0zBDypDgH+ZJ1rkC3FIDpFtWmRA/f1nXjnMfH
         8yYU3EDlqnUXzrJov0QqZJRBO1hDTsN3fGltAIR2tmBlRSRo7WtlvKV5qwzp5mSBoIXn
         iGXGg582YvqJJ9QwSRaPEZ9E3oT606SR6i90Kglmw7EDe0O7SzG2Ywhtv48EMYqaeFlr
         mFuxtqaq34VRt3+hqT3tZ77jU17I7P8Cok8kOvciZS3F5lk8AGyL6oYYx/6jQ5NSQkru
         EAG8Uo2ex0GxJOrKnCZew8ijYCV2evHvNZ6RUb5BRoAmLyoM6lt31B7hxaS/+y2wBBZ4
         FvEg==
X-Gm-Message-State: AOJu0YwuVe0PEb4wS7uWXU5e3OixI6NMs/M9Lajbzt/X4hhEuNWqH60Q
	12Veej1QBRVLGJ37i28q2YSba0iFdCbvDdGfjsMwTdPE8KQhbs06e5UcHwgldNTBxEwv4AC4mrm
	0
X-Google-Smtp-Source: AGHT+IGHHlpKe+YxWjy+x9iHpDucYnPKV6JQk9JBTQMFQAz3J6m7o71szSa4nBKvxIuSgqIjXFQvNw==
X-Received: by 2002:a05:690c:2c02:b0:6af:8662:ff43 with SMTP id 00721157ae682-6d278435917mr29381227b3.37.1724949137183;
        Thu, 29 Aug 2024 09:32:17 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d2d438e18asm2993517b3.60.2024.08.29.09.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 09:32:16 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v4 04/13] uefi-sb-keys.bbclass: Add class to validate UEFI keys
Date: Thu, 29 Aug 2024 10:32:00 -0600
Message-ID: <20240829163209.47945-5-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240829163209.47945-1-javier.tia@linaro.org>
References: <20240829163209.47945-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 29 Aug 2024 16:32:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6014

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


