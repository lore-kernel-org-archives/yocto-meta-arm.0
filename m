Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14200C83F39
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 16:32:26 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web11.24052.1724949135893120268
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Aug 2024 09:32:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=bDpvdU/7;
 spf=pass (domain: linaro.org, ip: 209.85.219.174, mailfrom: javier.tia@linaro.org)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e02b79c6f21so877764276.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 29 Aug 2024 09:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724949135; x=1725553935; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xdlXt/aUr86defsx3fUhdOMBxiuCcNV4XSVv3gOErpU=;
        b=bDpvdU/7KCcaDFdcweu4tcNy0cuXkDYlJAsSUkLX18+ltXgaK4e1TD5wAexgob6e3t
         DIxcUM7kDnSCZBf0P/DlDabxA+VT8hYrlJLPJncLyZ7IOagCZq1GNYXwkNQd24U4x7M4
         RDEifQzwwOG44YKucBXW+3IyOrhj52rMsd6BuPBDlO82SsxCr5+W8t+rC+iwQ1NkOWw/
         z9Rd67jUcdlUZqdgr+hgRFKl1QLWJsN1KbOsR2xixYD5kAkCDi3TY10XCig2GDSo70Ve
         vRMxKZrKikWOZ1BR19LDWGbwKem7xmhko0wgqYedd2Bu6wcpO62m88beeRuBiyCveT5j
         ak/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724949135; x=1725553935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xdlXt/aUr86defsx3fUhdOMBxiuCcNV4XSVv3gOErpU=;
        b=jMKp03Ro6IjKFHoXCRC+i8faRFuVD3Wfyc62BZ8eOhgOui/frDo6MCfYhAVwj7cp+x
         m7XqtftqjT0XzxOJtJjUeSlzgL1pP5xQEf+skUPOKmDoOzGz16EGbHvHB0F0MQyUhtrw
         9Y+WvlVAU3Or6fnLH/U0DrHOmeY4UtVEw6klpCpF6J12ybp8oGbXdUCPb0iLUfcpjkU3
         6Sa8oO+yImig9HO4irL5kYOiynfuL5VKJ6FytAZvUQ0b4AMp47nyU50HKS2m0ebAq6EK
         lnrsOXzSJg5wIKy/kWxKPaSVDd0zZpYo18GiWEoJfGA77rwjGAN5spqLn4sRyeVNha1L
         9Tng==
X-Gm-Message-State: AOJu0Ywq2V9WhTXbYBbU+nIggN3S+ZqqtFfMWXkuqHRN+XfUNUnFjvQu
	rPgs6MfauisZfB1YO5uu5Cmg4xDCRvYPqtQxlidF1U+ffF/yBnPK5Q8UBsfWFWVIuaYBBlf0zOL
	v
X-Google-Smtp-Source: AGHT+IEyCI1Hyxy3R96AlbMtSl2FIwbfAXoqvtF9fBHdr6CSzdUXQg4yq6anSCtx1Ve1eSMayvZ3yQ==
X-Received: by 2002:a05:690c:6813:b0:64a:3e36:7fd1 with SMTP id 00721157ae682-6d276116bbbmr40960457b3.10.1724949134940;
        Thu, 29 Aug 2024 09:32:14 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d2d438e18asm2993517b3.60.2024.08.29.09.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 09:32:14 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v4 02/13] core-image-minimal: Use UEFI layout disk partitions
Date: Thu, 29 Aug 2024 10:31:58 -0600
Message-ID: <20240829163209.47945-3-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240829163209.47945-1-javier.tia@linaro.org>
References: <20240829163209.47945-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 29 Aug 2024 16:32:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6012

- Use efi-disk-no-swap.wks.in disk definition to add expected UEFI disk
  partitions configuration.

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 ci/qemuarm64-secureboot.yml                                 | 6 +++---
 .../images/core-image-minimal-uefi-secureboot.inc           | 1 +
 meta-arm/recipes-core/images/core-image-minimal.bbappend    | 1 +
 3 files changed, 5 insertions(+), 3 deletions(-)
 create mode 100644 meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc
 create mode 100644 meta-arm/recipes-core/images/core-image-minimal.bbappend

diff --git a/ci/qemuarm64-secureboot.yml b/ci/qemuarm64-secureboot.yml
index b26941e0..fdde1e79 100644
--- a/ci/qemuarm64-secureboot.yml
+++ b/ci/qemuarm64-secureboot.yml
@@ -7,10 +7,10 @@ header:
 
 machine: qemuarm64-secureboot
 
-target:
-  - core-image-base
-
 local_conf_header:
   optee: |
     IMAGE_INSTALL:append = " optee-test optee-client optee-os-ta"
     TEST_SUITES:append = " optee ftpm"
+
+target:
+  - core-image-minimal
diff --git a/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc b/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc
new file mode 100644
index 00000000..351e9030
--- /dev/null
+++ b/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc
@@ -0,0 +1 @@
+WKS_FILE = "efi-disk-no-swap.wks.in"
diff --git a/meta-arm/recipes-core/images/core-image-minimal.bbappend b/meta-arm/recipes-core/images/core-image-minimal.bbappend
new file mode 100644
index 00000000..46c00f00
--- /dev/null
+++ b/meta-arm/recipes-core/images/core-image-minimal.bbappend
@@ -0,0 +1 @@
+require ${@bb.utils.contains('MACHINE_FEATURES', 'uefi-secureboot', 'core-image-minimal-uefi-secureboot.inc', '', d)}
\ No newline at end of file
-- 
2.46.0


