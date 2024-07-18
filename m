Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87CB0C3DA70
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 20:35:59 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.4163.1721334957481977299
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jul 2024 13:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=RaIeSrTC;
 spf=pass (domain: linaro.org, ip: 209.85.128.174, mailfrom: javier.tia@linaro.org)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-65f852c82fcso15111107b3.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 18 Jul 2024 13:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721334956; x=1721939756; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EF/jHFr4+j/iET/dg5nrT225Ug6C2AkUqA3MaVXogBI=;
        b=RaIeSrTCOWOqD/ePSHoGYUEpRNPpjEuVfzZOtpfTIUKKLehSrfqKk/ACAgrX0yJSnT
         WcsOXkhoJXtj/cQVzjBl9J/q3EO4KgJYq4VHb+ZjEFjoM/d3mbv4oZGlcf/ITkIm0v21
         M3nXMvIHylQUt3NC/elE+2OoSrgoicYOF6xVTNN7LEtj53vQMCICCQV4J6nsVC8Aso1i
         oRY4PA/BXj3oDp3pXqQBtv2w4kDzZKOK3OCiNP+WgISKityDBq9l1lRpqyqCLQ4yn9tE
         bcc4rmERBVEcVK3/y+g05fyLxoDtsOgmqkgK94HzpVvssJtHLuqCyCVdGxjIfpf8+onq
         MnmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721334956; x=1721939756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EF/jHFr4+j/iET/dg5nrT225Ug6C2AkUqA3MaVXogBI=;
        b=IjAJ3gSS/lO3uRadekh04e5ZKKkHI/tMYffmwkgXwNiokJg+2wSV6GPLhOBxDoO+Ca
         0R9OCsw1f2R8N3/ov2MGWz7QQTAneCpRoVMBG4UqOOpHPXJYgO86BiiMm5hHdOzqy+t8
         drUMPDQLVTW/m6QNft0tC80tux3WxjM3YlppyktHQ+8d1hh25UXKIWmC/PrexVmhfj4h
         RcrspULtg/eMAT+p11lOgYBamGsz0oO014QFFqZZsAzGcs2NLVBcmRBJp9kto1ElfpFS
         eNKumrFsD2fXqw7lDm+hEwB+tuhG9aEXiYBtZqPetx1kqm7zlKtgTkvlQkGy88wMgqKP
         8aHw==
X-Gm-Message-State: AOJu0YwsbkvJvHDMSYmUijBiyQSKOc3wUpVrUf0OwIMr5Qx6IaR2ChfA
	KofdTxH1Sa4h99t6ylL/QxQok0598eQSuOVUXCumABvIKB6ooeAm9WrQSJyG2JGCVb/JPJSf0Ll
	zSwU=
X-Google-Smtp-Source: AGHT+IG1sBljx0cXqrS2OK9Te+xzoo6ZJsBHQBvZUO80Xxr3NchcpIkscctD4LzGj64nlCibYbIb7Q==
X-Received: by 2002:a81:840c:0:b0:649:fa54:1f8c with SMTP id 00721157ae682-6650028c1a2mr71774167b3.48.1721334956489;
        Thu, 18 Jul 2024 13:35:56 -0700 (PDT)
Received: from localhost.localdomain ([190.171.102.111])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6695245a1dasm171657b3.53.2024.07.18.13.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 13:35:56 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v1 6/7] qemuarm64-secureboot: Setup UEFI linux-yocto and sign kernel image
Date: Thu, 18 Jul 2024 14:35:25 -0600
Message-ID: <20240718203526.52214-7-javier.tia@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240718203526.52214-1-javier.tia@linaro.org>
References: <20240718203526.52214-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 18 Jul 2024 20:35:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5905

efivarfs kernel module is required to access EFI vars.

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 .../recipes-kernel/linux/linux-yocto%.bbappend |  2 ++
 .../linux/linux-yocto-uefi-secureboot.inc      | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-uefi-secureboot.inc

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
index 00000000..3784b3d1
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-yocto-uefi-secureboot.inc
@@ -0,0 +1,18 @@
+KERNEL_FEATURES += "cfg/efi-ext.scc"
+
+DEPENDS += "sbsigntool-native"
+
+do_compile:append() {
+    KERNEL_IMAGE=$(find "${B}" -name "${KERNEL_IMAGETYPE}" -print -quit)
+
+    "${STAGING_BINDIR_NATIVE}/sbsign" \
+        --key "${UEFI_SB_KEYS_DIR}/db.key" \
+        --cert "${UEFI_SB_KEYS_DIR}/db.crt" \
+        "${KERNEL_IMAGE}" \
+        --output "${KERNEL_IMAGETYPE}.signed"
+
+	install -m 0644 "${KERNEL_IMAGETYPE}.signed" "${KERNEL_IMAGE}"
+}
+
+RRECOMMENDS:${PN} += "kernel-module-efivarfs"
+RRECOMMENDS:${PN} += "kernel-module-efivars"
\ No newline at end of file
-- 
2.45.2


