Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A7DEC5472C
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 19:04:54 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.1083.1724094287782193907
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 19 Aug 2024 12:04:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=EmaZQ8q+;
 spf=pass (domain: linaro.org, ip: 209.85.219.46, mailfrom: javier.tia@linaro.org)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6bf7ba05f75so30528446d6.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 19 Aug 2024 12:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724094287; x=1724699087; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCvAk01qrRdY3Y5k2RwMc1y4ZpcmHYI/JBaWSAotA/s=;
        b=EmaZQ8q+J43lixCTihZyUTipHUmj60r9w8/fGTgbvF5W5pMpdonfZCTkUVyicdN8Jr
         DL0EPkJsU6TY6JdvbKaXWjWlRnwVxF2yaybFDgMZW7ifnXIKhHJi3VGzbLyOYlyU2eEh
         OJjHGPZhbdcoF4JYC57WZP0FCUQHbE6U3/lMVbbWRsEy6KuonrmQTxCoQ9IEffWBwsaq
         RlwZMo1kGq+KpLRDXX1cryBZ/v1kBJFQqrCgjOUOtHIllw7TJaChUoYHxyBiA0Q2xGOn
         zsrUpvJuHsuZ//xxDKvhc6BOyDFBd5Ilv1IxTdd09HCq4mp57It9BtAOR/jxYa2NZaCl
         BLng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724094287; x=1724699087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oCvAk01qrRdY3Y5k2RwMc1y4ZpcmHYI/JBaWSAotA/s=;
        b=QPBqcGmEqSLWSGVW/o5GpdLzdISWYH7wbvDJclU3YFDd4ytljej4bbOVzVx5hWjYlk
         aO7G6cJnPz1G2jVVNXwYjN4s4FvouHelYj2TCmJWUYaZt7Ris8uM70dFzEr2J8oqrVCS
         QZiekKAu3Pc0RoBVvfuirOp2+lLCavt086xPVF7prQLJxjZU1t+icQ2nMujgpBIjeuDc
         YVnM6DK+tcPc6wm1s3+prEcK57SRIMGOTl1UvTTyuuKRYtVkdgs0q0sxZHXG8l7yV/Zr
         +bdHTVXqBe3eBpJDMi+UyEYBZlKmoJngAIEc28eXVYT8kOJnMyura1sP5GfDFY4K7r4F
         UByw==
X-Gm-Message-State: AOJu0YwfmKIwjhyVgkax+U+pYULnjme5d6IqfHndZHbPl2IDaG30wtAy
	Z0DavUNtOMXCgo1ksIgdvr6iyLsk3xGyIFoLSzCUxGsStyK8v0CpY44fLehWRRfgcN4IaFdPfkX
	F
X-Google-Smtp-Source: AGHT+IHRnT7nUUgfNa6m4y86NdvLIp7cpo7oRDN9xMmEYtUAaKaWbC/6rpAa2wuvP+pWjyp8GX6UBQ==
X-Received: by 2002:a05:6214:4613:b0:6bf:8a9c:1d0a with SMTP id 6a1803df08f44-6bfa8a48ff1mr12212536d6.10.1724094286681;
        Mon, 19 Aug 2024 12:04:46 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([177.93.4.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fe06feasm45371756d6.40.2024.08.19.12.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 12:04:46 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v2 11/14] systemd: Add UEFI support
Date: Mon, 19 Aug 2024 13:04:26 -0600
Message-ID: <20240819190429.2897888-12-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819190429.2897888-1-javier.tia@linaro.org>
References: <20240819190429.2897888-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 19 Aug 2024 19:04:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5977

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
index 2669be0c..79ab6080 100644
--- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
+++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
@@ -23,4 +23,9 @@ WKS_FILE_DEPENDS = "trusted-firmware-a"
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


