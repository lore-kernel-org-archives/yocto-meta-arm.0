Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A0A5C5472C
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 01:43:58 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.4041.1724291034313872862
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Aug 2024 18:43:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=WkDyJX2R;
 spf=pass (domain: linaro.org, ip: 209.85.128.182, mailfrom: javier.tia@linaro.org)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-690b6cbce11so3392187b3.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 21 Aug 2024 18:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724291033; x=1724895833; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MNiYqaJ6/dp6Rz4Asy2D9hWleJVQzKyC4j+Ug6hTpEI=;
        b=WkDyJX2RYnTqTP+ffmTEXUoeBO5mzjvBk3FtdF6YmrnOD6f9Cp+IoUjNzkxpmKr1Mi
         NuV1I0RORPLKzzZYX5cO136yYoovOxmreN3kIJT6M9VuyrVxTFnJlfUzxRokqVejpqIG
         p2vlS7K5AzPh2aeFH4uOlUwqfDZa+s00QQJyivuJiIMipcBTil2bHRz8J17+p4GhuvG4
         e5cm/Z50igjgBSzg/JleCvrmMN37CnqAjmKSk3fIh8Hcxo2vQcy9QZQpoLFwpI1uv2Mw
         OYQVNvRJOnEOzcrf8zcLFXLzqH2XwrIkK5pQImFolKo4FIkBwTc3Ac9hdfSjz01c8Mdw
         PZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724291033; x=1724895833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MNiYqaJ6/dp6Rz4Asy2D9hWleJVQzKyC4j+Ug6hTpEI=;
        b=XLwXDoGdjyHx1DqONbo3V3UzP97DMYrOh5WNP7HXqARZJrlpyh0PMDO2OySUdzITb4
         IiDKuJip3rj4Clj41Ei0DmsPvRwObJa1r98ANZLlpwR08PcEsF8tJobpy9oumznuSE+g
         oa93lJj+f6MdGnsL/dTIHQcV8bEKb/9E3+/wJeI4EvWSJiyMrKqlEv9wZCtfcom89Le5
         EvLcA0nPGHJ0RsnWzTHLqB92eyDgR0dclkXEbLhxCp75ISeeN2d5cmvpmQo+UjscGByp
         5ZEt88aKN6aazic9qyPc4Z9bB3+iA5xd7K3EGAZqxsEl6LcEELE3CFqT/MRnYM6LjYZm
         4P4Q==
X-Gm-Message-State: AOJu0Yxf89qrXX7yIgI0l0lZ1aiSpnPICOJ0Avm+a6LWC9zI1P9aw3PT
	PtEbDkJpLWHIJnN933BD2MMMHYxMygxfbWfVuhi7065nc/tBo2UKnvBz2QrajU33MoJ6X6IFIlp
	I
X-Google-Smtp-Source: AGHT+IH+/gpoANLQ/c1lekXiFclygZWK3q1+u16Iel0pTRjk5D+lzu8KQUzukfzB86mrZ/o+FCJQkg==
X-Received: by 2002:a05:690c:580f:b0:6c1:2b6d:1964 with SMTP id 00721157ae682-6c3d5fc1af0mr3113477b3.38.1724291033365;
        Wed, 21 Aug 2024 18:43:53 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39e6eae07sm707757b3.145.2024.08.21.18.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 18:43:52 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v3 10/13] linux-yocto: Setup UEFI and sign kernel image
Date: Wed, 21 Aug 2024 19:43:32 -0600
Message-ID: <20240822014335.3394568-11-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240822014335.3394568-1-javier.tia@linaro.org>
References: <20240822014335.3394568-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Aug 2024 01:43:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6000

efivarfs kernel module is required to access EFI vars.

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 .../core-image-base-uefi-secureboot.inc       |  8 ++++++++
 .../linux/linux-yocto%.bbappend               |  2 ++
 .../linux/linux-yocto-uefi-secureboot.inc     | 19 +++++++++++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-uefi-secureboot.inc

diff --git a/meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc b/meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc
index 2232d3b3..06046f6e 100644
--- a/meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc
+++ b/meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc
@@ -1,3 +1,11 @@
 inherit uefi-sb-keys
 
 WKS_FILE = "efi-disk-no-swap.wks.in"
+
+# Detected by passing kernel parameter
+QB_KERNEL_ROOT = ""
+
+# kernel is in the image, should not be loaded separately
+QB_DEFAULT_KERNEL = "none"
+
+KERNEL_IMAGETYPE = "Image"
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend b/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend
index a287d0e1..29c21355 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend
@@ -25,3 +25,5 @@ SRC_URI:append:qemuarm = " \
 
 FFA_TRANSPORT_INCLUDE = "${@bb.utils.contains('MACHINE_FEATURES', 'arm-ffa', 'arm-ffa-transport.inc', '' , d)}"
 require ${FFA_TRANSPORT_INCLUDE}
+
+require ${@bb.utils.contains('MACHINE_FEATURES', 'uefi-secureboot', 'linux-yocto-uefi-secureboot.inc', '', d)}
\ No newline at end of file
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto-uefi-secureboot.inc b/meta-arm/recipes-kernel/linux/linux-yocto-uefi-secureboot.inc
new file mode 100644
index 00000000..cb62fdee
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-yocto-uefi-secureboot.inc
@@ -0,0 +1,19 @@
+KERNEL_FEATURES += "cfg/efi-ext.scc"
+
+DEPENDS += 'gen-uefi-sb-keys'
+
+inherit sbsign
+
+SBSIGN_KEY = "${UEFI_SB_KEYS_DIR}/db.key"
+SBSIGN_CERT = "${UEFI_SB_KEYS_DIR}/db.crt"
+
+# shell variable set inside do_compile task
+SBSIGN_TARGET_BINARY = "$KERNEL_IMAGE"
+
+do_compile:append() {
+    KERNEL_IMAGE=$(find ${B} -name ${KERNEL_IMAGETYPE} -print -quit)
+    do_sbsign
+}
+
+RRECOMMENDS:${PN} += "kernel-module-efivarfs"
+RRECOMMENDS:${PN} += "kernel-module-efivars"
-- 
2.46.0


