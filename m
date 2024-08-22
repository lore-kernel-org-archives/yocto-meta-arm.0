Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02302C52D6F
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 01:43:48 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web11.4038.1724291027511798368
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Aug 2024 18:43:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=QnAIiiq5;
 spf=pass (domain: linaro.org, ip: 209.85.128.173, mailfrom: javier.tia@linaro.org)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6b3afc6cd01so11965057b3.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 21 Aug 2024 18:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724291026; x=1724895826; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SLHu6PRlZnCzW/rU1UEj78mshvoxk7WjoojsTwAZ3/I=;
        b=QnAIiiq5PmOBnxxCWnqm831lYUvQ9a47teDy3oTXV/nPH1pez/6rpt+jNkKV85H4Nq
         vAmXVj/ZsdxGjxKl5TXD73bDoVslJUow3UNWnY64mRwQGN4MRmlmXsnYNdXqTcfbGNw3
         A8TekVQ0YWGyv0nVs6M6+lSIKKMEJQKEAFGH1GWCmNvVZsp9McSutrz8mbhKYZGDHnRy
         h3Jj7g0ApNcZFmb605z5O21yAoJJRz/o0w0rRvQsALQBvmaf2YxtrV+c3DVQCmvUtPJ6
         H+t5+dTmXtGGRb5rULQYQe44TRAPCA8zxXvCX8h1WZ19dn+GnLzVevADmA8RyoMJWqhy
         12Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724291026; x=1724895826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SLHu6PRlZnCzW/rU1UEj78mshvoxk7WjoojsTwAZ3/I=;
        b=eoNYAhtu2xcIo0ip42z3Y5jOSL0IQUyu1XooB4TIVEAEL2TLMOPNzTFOAOByLhD0DG
         XLkXlUDvYRmqqX1jStOZVxBN0zHwClxJPAJcRleZKCQfDvfs06vMeeHuj81HngaAw4TB
         X6fZOrciIDQ6GvlvYnc1HaCr/NC8/+ZDDavgnIbarmINqcaGr8tLd+VaAeHcgsRJdf9C
         boW4vJ7fpFlGSmDBwG7e8S0kHAwsnZ4Bo1cLmHpoSdrJ6VlKluh8U0ONeg54Z7fjSUJ0
         ls3z6o/yX/IBSku2/s1agLHMnu/TeLHQ39lffUVr+ZQ8JakGk4u+lmpzXcEttv4Acse9
         vV1g==
X-Gm-Message-State: AOJu0Yw751wgs/fSKdQd4syvAc4PlzLH72ycsgLuBYcnHStz4MmU0Rr0
	SLmDobCMa26kciOxBq3mdyryKCiQvoOx4sJMiQBR4YyjfWzP7xsWqhIewjJ2gMUteRlKoM2duut
	O
X-Google-Smtp-Source: AGHT+IE9OWRI3njPkULq/BdO5og6g6bL9i2OGaWns6ubu9LQvAKaGvvra2IlPxYfKJ9TdAcOfVcEEA==
X-Received: by 2002:a05:690c:f94:b0:66b:c28b:f234 with SMTP id 00721157ae682-6c306357b9emr15734987b3.21.1724291026533;
        Wed, 21 Aug 2024 18:43:46 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39e6eae07sm707757b3.145.2024.08.21.18.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 18:43:46 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v3 04/13] uefi-sb-keys.bbclass: Add class to validate UEFI keys
Date: Wed, 21 Aug 2024 19:43:26 -0600
Message-ID: <20240822014335.3394568-5-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240822014335.3394568-1-javier.tia@linaro.org>
References: <20240822014335.3394568-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Aug 2024 01:43:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5994

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


