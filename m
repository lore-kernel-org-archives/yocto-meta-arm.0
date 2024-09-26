Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9786ACDE01C
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 15:47:47 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.47365.1727365661656890131
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 26 Sep 2024 08:47:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=kf+AN6Pd;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.167.170, mailfrom: jdmason@kudzu.us)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3e27a6d0bb5so716844b6e.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 26 Sep 2024 08:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1727365661; x=1727970461; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1V6+27rqTLGXbxdRAtHSIQrG7lHzMuV8nIXKwBlde4I=;
        b=kf+AN6PdulhX7NjmFBgEcqH4P6nTjeDHFx+Sh+vaYBH24M4pdp4oXqSoXK/Q/aKF8V
         oQmpB1CpH9ZEqu+vIq68I8KWV1Vx5rYMEMpCVXXxrTZVn6iNDKsFG1mHgFfHWqalry2m
         NfAE5tKwc5WBLeK18K48R2RInQzw0eZq9xGAdcOG9R/4Wee4C7kihnoyRZukiNuUp91J
         6ysWtUqIeW89/DEZlzbyHBlx7Y5S7FhjQC2RLw2Ega/HZTRI0g56oKIn/EDeyNn7MJIL
         43Zxh0ZPZHGzRY+dcXCBxfnBsDeRHHXcMgcGiqmpXUXZFoofiHY0F1vSkbgSMNwh1MtX
         +Yzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727365661; x=1727970461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1V6+27rqTLGXbxdRAtHSIQrG7lHzMuV8nIXKwBlde4I=;
        b=SsmHzNkBduRcGeTm8DqfjaHKXYvse0MX6Z4JxnZTiATMGrqjvduKVodrGMsXEKMJ0B
         mT/46mLXaCjFXb+zHNZk6iDLwZZiil/MZsU6Wsesqnmu79gpOQKpg7rJZa5ekmKUWI1i
         F+OsXfivqulbdIo532P/Mg+um+U6D7zL/BK0UiqKWbw60gIxIU6e+QFwEPuor6rVNhex
         9e0vPKGtW0jX1s6RAPZP72p14FaXY8mmSS+TmkG3HJ7/GgsSAED0aSjHNysJfidA42i/
         cQfvRr+l3qwZX0hnCoSC1gl4J1F8YFRfBey/lAZsn5Iuei/37u0dRg96AICZJfGDi0BD
         4FuA==
X-Gm-Message-State: AOJu0Yx30CgrOmPKkHz8oLZUAMQjAHusgEvFZR2rHKukUwbo6RmdIFj1
	au1za09ftxsBvU6wiObCxtABsur8VjxPxbTKBzB+8nEfPz5RdzDF0gGiiRoNKD125Z9qjm7JaRw
	=
X-Google-Smtp-Source: AGHT+IGFgub/VIRy910/bn1aspX/A2L/u4HcIglW1Jh16L4cD9VwlwZG4SakvC9VUP3FgIpd/PsXtg==
X-Received: by 2002:a05:6808:10d6:b0:3e0:4211:1b93 with SMTP id 5614622812f47-3e29b7f3a8fmr5387522b6e.39.1727365660663;
        Thu, 26 Sep 2024 08:47:40 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45c9f2ea78fsm34091cf.54.2024.09.26.08.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 08:47:40 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v7 1/4] arm/optee: Add optee udev rules
Date: Thu, 26 Sep 2024 11:47:36 -0400
Message-Id: <20240926154739.2379609-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240926154739.2379609-1-jon.mason@arm.com>
References: <20240926154739.2379609-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 26 Sep 2024 15:47:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6118

From: Javier Tia <javier.tia@linaro.org>

If a /dev/teepriv[0-9]* device is detected, start an instance of
tee-supplicant.service with the device name as parameter.

Signed-off-by: Javier Tia <javier.tia@linaro.org>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-security/optee/optee-client.inc          | 8 +++++++-
 .../recipes-security/optee/optee-client/optee-udev.rules  | 6 ++++++
 2 files changed, 13 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm/recipes-security/optee/optee-client/optee-udev.rules

diff --git a/meta-arm/recipes-security/optee/optee-client.inc b/meta-arm/recipes-security/optee/optee-client.inc
index ddda2d1a3ae9..f387c80574b0 100644
--- a/meta-arm/recipes-security/optee/optee-client.inc
+++ b/meta-arm/recipes-security/optee/optee-client.inc
@@ -5,12 +5,13 @@ HOMEPAGE = "https://www.op-tee.org/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=69663ab153298557a59c67a60a743e5b"
 
-inherit systemd update-rc.d cmake
+inherit systemd update-rc.d cmake useradd
 
 SRC_URI = " \
     git://github.com/OP-TEE/optee_client.git;branch=master;protocol=https \
     file://tee-supplicant@.service \
     file://tee-supplicant.sh \
+    file://optee-udev.rules \
 "
 
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
@@ -26,6 +27,8 @@ EXTRA_OECMAKE:append:toolchain-clang = " -DCFG_WERROR=0"
 do_install:append() {
     install -D -p -m0644 ${UNPACKDIR}/tee-supplicant@.service ${D}${systemd_system_unitdir}/tee-supplicant@.service
     install -D -p -m0755 ${UNPACKDIR}/tee-supplicant.sh ${D}${sysconfdir}/init.d/tee-supplicant
+    install -d ${D}${sysconfdir}/udev/rules.d
+    install -m 0644 ${UNPACKDIR}/optee-udev.rules ${D}${sysconfdir}/udev/rules.d/optee.rules
 
     sed -i -e s:@sysconfdir@:${sysconfdir}:g \
            -e s:@sbindir@:${sbindir}:g \
@@ -38,3 +41,6 @@ SYSTEMD_SERVICE:${PN} = "tee-supplicant@.service"
 INITSCRIPT_PACKAGES = "${PN}"
 INITSCRIPT_NAME:${PN} = "tee-supplicant"
 INITSCRIPT_PARAMS:${PN} = "start 10 1 2 3 4 5 . stop 90 0 6 ."
+
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM:${PN} = "--system teeclnt"
diff --git a/meta-arm/recipes-security/optee/optee-client/optee-udev.rules b/meta-arm/recipes-security/optee/optee-client/optee-udev.rules
new file mode 100644
index 000000000000..075f469c04e9
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-client/optee-udev.rules
@@ -0,0 +1,6 @@
+KERNEL=="tee[0-9]*", MODE="0660", OWNER="root", GROUP="teeclnt", TAG+="systemd"
+
+# If a /dev/teepriv[0-9]* device is detected, start an instance of
+# tee-supplicant.service with the device name as parameter
+KERNEL=="teepriv[0-9]*", MODE="0660", OWNER="root", GROUP="teeclnt", \
+    TAG+="systemd", ENV{SYSTEMD_WANTS}+="tee-supplicant@%k.service"
-- 
2.39.5


