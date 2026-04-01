Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62FBBD35173
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 10:29:59 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9981.1775039391616943184
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Apr 2026 03:29:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=iq9hVVH4;
 spf=pass (domain: linaro.org, ip: 209.85.167.46, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a2b5ea59a1so3238336e87.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 01 Apr 2026 03:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775039389; x=1775644189; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pfMMGR/H6xuxEHN3+ICfY9GI9Il2YFJSpnwuDpVVlhw=;
        b=iq9hVVH4R5xOPnE7RtsSxn7mQ/PhBJfhX9fSP2LdqSDUDelnn5H38GzOpEkSCIyABW
         LtUaWXq64jluLpSCor4Wmc/a3jbBpbeusSvOFN3U0gb6Bnfe2juPJwFmZ2+DWWRVqdxH
         evl0A8lp7Fb723Hq4hYnvBcMO/NUwJbGfViQGhtYS0sr7+RU2Sg5pzBmojqgqpyztU5B
         sTpB0UCfLxs8SRMBRk6AmjXGtLwQN5kyCvORVmIZt998b+7gTGyU1EuLY07ytxP+aOiY
         FYBsbYBydVySvaquxsfekpiwOGSOalJTyEu6klJDY7epeWPCU+GgLDKOG9Kfu9tZtVy1
         r3RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775039389; x=1775644189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pfMMGR/H6xuxEHN3+ICfY9GI9Il2YFJSpnwuDpVVlhw=;
        b=DyLG5BXjNimWgLec9xITGq7QYK8f2Ayi7qRfRdBgsqP5ZZOC4V7NiDzLmJn0pz1DY3
         qNH3PrmWjCbXkr5fmhPmHHInH6GPorSzVa/bThbsrX/N8HtPZ4/LKjMjttIYkS4ystNs
         QavtPwypS5tJ70EdZ4HzXJ9DrCDIxWfo2LwEXrGkL0/spaqGBC8822Sde9O+r+FS8q/h
         QD5w1+gUOUNZ+HNfOB3myNvaiNJShrMmNLh/vHriFV8E1kVOt0FhW+a1x2I1SVogIdj5
         +yn13CVXPYe4so6J6Sz/4nryWuqg9OatmlkfxKYC+cdh9qQKEuMMgO7EK3qta6nDxSPX
         y2pw==
X-Gm-Message-State: AOJu0Ywsod5LCAdTJmZcYTnNJZHMkB1Zm3ykgoNAQk5BxYJaammWfcDD
	w2TQ5l1Lqh1/NThWrARRTWR0mN2ngbJ/xmGKTK3lO0UG5lDn4yGxTzwCpf4nouLkErg2Cjs7OzG
	VYm81
X-Gm-Gg: ATEYQzxa93AlLgmTRahZEuZtggaReFwi1QEvP07OB65CAK+TQX8Q9AzDu6y/fUlj1Td
	ak97eQQPMliuAivfUliDJtstLKgNv0FbLSD6KeZH9g3T7uDGWnbDxgzu8fxGi2RUhpNK1dk7Kho
	sLT5rPBearkFcQZoKMMXC3enxvkBwNGb6AGy+DYpLYJWU2iQjvdQNujfL090iy9oabLT2FrTbC/
	+w7eHdBrj1u8bn1+qRMDXCCmiNF9E3tI0s8OtSy77WeiYQGG6aTUHcxOSVlEG0IvdUOYUshSn9h
	h4VJZzLKzQttXQTpOn6bel45KTrG9PtA75eYzkESWkXYnZp9ln3mT2wyGPT9g8ox/sMI1y3mbTb
	ENAbcfgiLoIeE1HI+Bovo9dXR7Y8TzGSVYSObF8H/NSUOJ9TQgKuoc2V3rsT4gv8YQ6d4f0liEa
	j9ellQiMZt3xIkEb7EFToiBf85seZt69LYEzcHXxufvaNKEEK7oNZqlKDI
X-Received: by 2002:a05:6512:ac9:b0:5a2:b3fc:b870 with SMTP id 2adb3069b0e04-5a2c1f4cfc8mr1379760e87.43.1775039389421;
        Wed, 01 Apr 2026 03:29:49 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83730f7csm26337651fa.16.2026.04.01.03.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 03:29:49 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 1/2] trusted-firmware-a: support genericarm64 like qemuarm64
Date: Wed,  1 Apr 2026 13:29:30 +0300
Message-ID: <20260401102931.781169-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 01 Apr 2026 10:29:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6997

genericarm64 builds can build tf-a for secureboot for testing
secureboot support. For real target the support should be in
the device specific UEFI firmware which are built separately
by device vendors.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 .../trusted-firmware-a-qemuarm64-secureboot.inc        |  2 +-
 .../trusted-firmware-a/trusted-firmware-a_%.bbappend   | 10 ++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a-qemuarm64-secureboot.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a-qemuarm64-secureboot.inc
index 9bfe52c5b44d..cdf64d39fc96 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a-qemuarm64-secureboot.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a-qemuarm64-secureboot.inc
@@ -1,4 +1,4 @@
-COMPATIBLE_MACHINE = "qemuarm64-secureboot"
+COMPATIBLE_MACHINE = "(qemuarm64-secureboot|genericarm64)"
 
 # Enable passing TOS_FW_CONFIG from FIP package to Trusted OS.
 FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index a230a0c73fd3..8ccf43c49735 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -3,13 +3,16 @@
 QEMU_TFA_REQUIRE ?= ""
 QEMU_TFA_REQUIRE:qemuarm-secureboot = "trusted-firmware-a-qemuarm-secureboot.inc"
 QEMU_TFA_REQUIRE:qemuarm64-secureboot = "trusted-firmware-a-qemuarm64-secureboot.inc"
+QEMU_TFA_REQUIRE:genericarm64 = "trusted-firmware-a-qemuarm64-secureboot.inc"
 
 require ${QEMU_TFA_REQUIRE}
 
 TFA_BUILD_TARGET:aarch64:qemuall = "all fip"
+TFA_BUILD_TARGET:aarch64:genericarm64 = "all fip"
 TFA_BUILD_TARGET:arm:qemuall = "all fip"
 
 DEPENDS:append:aarch64:qemuall = " optee-os"
+DEPENDS:append:aarch64:genericarm64 = " optee-os"
 DEPENDS:append:arm:qemuall = " optee-os"
 
 EXTRA_OEMAKE:append:aarch64:qemuall = " \
@@ -19,6 +22,13 @@ EXTRA_OEMAKE:append:aarch64:qemuall = " \
     BL32_RAM_LOCATION=tdram \
     "
 
+EXTRA_OEMAKE:append:aarch64:genericarm64 = " \
+    BL32=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-header_v2.bin \
+    BL32_EXTRA1=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-pager_v2.bin \
+    BL32_EXTRA2=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-pageable_v2.bin \
+    BL32_RAM_LOCATION=tdram \
+    "
+
 EXTRA_OEMAKE:append:arm:qemuall = " \
     BL32=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-header_v2.bin \
     BL32_EXTRA1=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-pager_v2.bin \
-- 
2.34.1


