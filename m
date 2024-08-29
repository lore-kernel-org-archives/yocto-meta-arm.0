Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 580ADC83F3C
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 16:32:36 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.24058.1724949146315694104
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Aug 2024 09:32:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=tVeZz+Sm;
 spf=pass (domain: linaro.org, ip: 209.85.128.179, mailfrom: javier.tia@linaro.org)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-690ad83d4d7so7733147b3.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 29 Aug 2024 09:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724949145; x=1725553945; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4uqiqGNFeYK26IJZeFXiRd548q0q3xwHKI1ITF66iY=;
        b=tVeZz+SmaspNmjoTfN9xrANmxXJkOJFgUXZdKbEOczpCD/qnPCHdZE1IRx6mvi2ucD
         /iFYLd2i8Fo/QYRpk8zmXvMJz8I+n/i1RJB+eZe/txJYarYaPIbqT4R1LkufLJ6qvtUd
         ihhtrsZu2Po3u1De3MoP2uIKSXVzVjhu0CASiXvvoB9wBAgphxYl/8NRjKWl1+UH2aGW
         kGqf161iNuyo63ZeWjgx73YxahS7AZ4AP28ebK4r9VdwCYGI6hk+eB0xyz0vlPsZ0U3w
         XlAr/XL83LdBqA9aR1sqhpc2jPvqV+TYC5TQGKdpd9Sioma3zRzQQmwTmMtcxjzraZUJ
         C2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724949145; x=1725553945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/4uqiqGNFeYK26IJZeFXiRd548q0q3xwHKI1ITF66iY=;
        b=NissYz9Bl1XSfeE9cdsi1UjNF6+ubZGLS13WcVMqEEti3TZuW4IztuJ5fqKZu2DHhR
         PXLcqDljEk9R70wVDBrtvSm/NFJGXakxhWSUxDviAuAw6rCezw7+MmDqhXRw9bgk5zPQ
         R/SmWv6gsf5GrftJYt4U041cTmzMijC5/bVu0eVF4W679OBDFQdob+kz7ii0EG22sOXW
         hRZySTgGmgBbw2/dtRychxQ08aMZxLE7qPBs/slZEhWGFHXJIGungX6ZolcPUYu9PUdx
         GXk7nL2kKMs0bt7MlW9X+83XymE1IUAXNKIh+G0wkawX4ji936oFAje9O7I9vv6flC4G
         kFmQ==
X-Gm-Message-State: AOJu0Yz3WS0HY3EH2h8jddxqvXwQPZKSnIUlGx5heJfrL5n280j4M5nM
	ekq3vg3gHVPI5uKRn60kb9DksRe8NIZl3WyBCTZEYd7ZunJNPh1CwLttadgcotOlgRQgFTl/0c1
	O
X-Google-Smtp-Source: AGHT+IEA+KJmt9wv/q2PpOYcl/yiEgHX90uBh2vz/lu1ttMb+hQqwQVU1C2Mbkic7aw6qrc943TqVg==
X-Received: by 2002:a05:690c:10d:b0:6ad:bf4f:1bc3 with SMTP id 00721157ae682-6d277c6ec56mr29729147b3.32.1724949145333;
        Thu, 29 Aug 2024 09:32:25 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d2d438e18asm2993517b3.60.2024.08.29.09.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 09:32:24 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v4 11/13] systemd: Add UEFI support
Date: Thu, 29 Aug 2024 10:32:07 -0600
Message-ID: <20240829163209.47945-12-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240829163209.47945-1-javier.tia@linaro.org>
References: <20240829163209.47945-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 29 Aug 2024 16:32:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6021

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 meta-arm/conf/machine/qemuarm64-secureboot.conf              | 5 +++++
 .../images/core-image-minimal-uefi-secureboot.inc            | 2 ++
 meta-arm/recipes-core/systemd/systemd-efi.inc                | 1 +
 meta-arm/recipes-core/systemd/systemd_%.bbappend             | 1 +
 4 files changed, 9 insertions(+)
 create mode 100644 meta-arm/recipes-core/systemd/systemd-efi.inc
 create mode 100644 meta-arm/recipes-core/systemd/systemd_%.bbappend

diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/conf/machine/qemuarm64-secureboot.conf
index 2483c4ac..542d09a3 100644
--- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
+++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
@@ -22,4 +22,9 @@ WKS_FILE_DEPENDS = "trusted-firmware-a"
 IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
 
 MACHINE_FEATURES += "optee-ftpm"
+MACHINE_FEATURES += "efi"
 MACHINE_FEATURES += "uefi-secureboot"
+
+INIT_MANAGER = "systemd"
+DISTRO_FEATURES += "systemd"
+DISTRO_FEATURES_NATIVE += "systemd"
diff --git a/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc b/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc
index 06046f6e..07e315a3 100644
--- a/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc
+++ b/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc
@@ -9,3 +9,5 @@ QB_KERNEL_ROOT = ""
 QB_DEFAULT_KERNEL = "none"
 
 KERNEL_IMAGETYPE = "Image"
+
+IMAGE_INSTALL += "systemd"
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


