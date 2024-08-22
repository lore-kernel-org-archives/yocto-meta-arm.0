Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 580D9C54722
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 01:43:58 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.4043.1724291035653159090
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Aug 2024 18:43:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=yl2Xi5nD;
 spf=pass (domain: linaro.org, ip: 209.85.128.181, mailfrom: javier.tia@linaro.org)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-690e9001e01so3385857b3.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 21 Aug 2024 18:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724291034; x=1724895834; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h78nR8U3XGeppnR8tMm/5NKKjqRIM74r32yU07YeEzU=;
        b=yl2Xi5nDRDiLsA6a2JO06qBD+Pe37U6ZiDZYfwrBMeyUGghtFZECKlsAEq4L+xU80Y
         6w8YqqS+EMlpeRE+N2R+A/lPUk2cBj/kRlUD1K6zQBPeUy9PgusI1mxBN+U+QIN7JP2A
         wAbadNP0Lnw+1cdwoc39rUZCSgd0VUNQJn8MU1km4wiA+vraOdEiNDyySG/if303cLyb
         7n94FwpmaLE5QwSyI16CMAJbB6KS6ifcIcxA16NBUSLFF2X9AsWwKBOugkDI9sat4lop
         WBCWvFEGTwNXaWXPWBgtGhXJ3lRxeNDWj0L8ZaoDtIzXhnb1DTMhYNZNSXg+bfELsNiK
         f/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724291034; x=1724895834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h78nR8U3XGeppnR8tMm/5NKKjqRIM74r32yU07YeEzU=;
        b=Z6Xfq+aJ6pER6+mqFKmw/TDPMwPchv/syML/C6ATKAL+3d07dFUuFtSYAGcufHOJ+j
         Fg2eK6fJ2TLSFLQ83DDuT2Bk8PYBBwADhid/Btr7WhewvPn73U9jckSDqSt6HsjVsT7q
         AafxekYoUJAL7XW8BxrxSFnk5LDZNqwaylMOl2Obz6GREbxqGT4hOMNFt5k6zrye7X6Z
         fQJUu04PP9nr2US52+oQ4qdNsVa70SLugKkSv0q9tHd9kxwq3ugmnoPLDMy2Q5YyQuvg
         rR26PPDrmoq+wjapNGVQfAEe6R5AYQFmlIM9Zkv4y0RCLti6Jm062wM3i8AdL6pILqq0
         Wgfg==
X-Gm-Message-State: AOJu0Yz5EqTeT5IWbHKKp7C5s6BXUbxBMI6RfOw5w4QNMZJlfYSK/As8
	KH0+4tofFUFJEZV/JnHySN1lPLoV5X5jR7jQc3tyw2S790NcvYfysJ8oIBQN/195Q+f5HCTi4x1
	x
X-Google-Smtp-Source: AGHT+IHgsXgZFUto1mCj2Zby5wcloL2ledbHipIMDUpRPg9mMk46JaUBaOmuo3NHyV7R1ZVWNWlL+g==
X-Received: by 2002:a05:690c:418f:b0:65f:9451:13dd with SMTP id 00721157ae682-6c3d62a3d7cmr3295437b3.42.1724291034555;
        Wed, 21 Aug 2024 18:43:54 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39e6eae07sm707757b3.145.2024.08.21.18.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 18:43:54 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v3 11/13] systemd: Add UEFI support
Date: Wed, 21 Aug 2024 19:43:33 -0600
Message-ID: <20240822014335.3394568-12-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240822014335.3394568-1-javier.tia@linaro.org>
References: <20240822014335.3394568-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Aug 2024 01:43:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6001

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 .../recipes-bsp/images/core-image-base-uefi-secureboot.inc   | 2 ++
 meta-arm/conf/machine/qemuarm64-secureboot.conf              | 5 +++++
 meta-arm/recipes-core/systemd/systemd-efi.inc                | 1 +
 meta-arm/recipes-core/systemd/systemd_%.bbappend             | 1 +
 4 files changed, 9 insertions(+)
 create mode 100644 meta-arm/recipes-core/systemd/systemd-efi.inc
 create mode 100644 meta-arm/recipes-core/systemd/systemd_%.bbappend

diff --git a/meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc b/meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc
index 06046f6e..07e315a3 100644
--- a/meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc
+++ b/meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc
@@ -9,3 +9,5 @@ QB_KERNEL_ROOT = ""
 QB_DEFAULT_KERNEL = "none"
 
 KERNEL_IMAGETYPE = "Image"
+
+IMAGE_INSTALL += "systemd"
diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/conf/machine/qemuarm64-secureboot.conf
index 6789b1c6..d6a7e22b 100644
--- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
+++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
@@ -25,4 +25,9 @@ WKS_FILE_DEPENDS = "trusted-firmware-a"
 IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
 
 MACHINE_FEATURES += "optee-ftpm"
+MACHINE_FEATURES += "efi"
 MACHINE_FEATURES += "uefi-secureboot"
+
+INIT_MANAGER = "systemd"
+DISTRO_FEATURES += "systemd"
+DISTRO_FEATURES_NATIVE += "systemd"
diff --git a/meta-arm/recipes-core/systemd/systemd-efi.inc b/meta-arm/recipes-core/systemd/systemd-efi.inc
new file mode 100644
index 00000000..5572e51a
--- /dev/null
+++ b/meta-arm/recipes-core/systemd/systemd-efi.inc
@@ -0,0 +1 @@
+PACKAGECONFIG:append = " efi"
diff --git a/meta-arm/recipes-core/systemd/systemd_%.bbappend b/meta-arm/recipes-core/systemd/systemd_%.bbappend
new file mode 100644
index 00000000..660358c2
--- /dev/null
+++ b/meta-arm/recipes-core/systemd/systemd_%.bbappend
@@ -0,0 +1 @@
+require ${@bb.utils.contains('MACHINE_FEATURES', 'efi', 'systemd-efi.inc', '', d)}
-- 
2.46.0


