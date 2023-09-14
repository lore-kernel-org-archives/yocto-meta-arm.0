Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 104DCEEAA62
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 18:26:52 +0000 (UTC)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
 by mx.groups.io with SMTP id smtpd.web10.2116.1694716010845906573
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 14 Sep 2023 11:26:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=mqBBc0G7;
 spf=pass (domain: linaro.org, ip: 209.85.222.45, mailfrom: javier.tia@linaro.org)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-7a855441a36so647288241.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 14 Sep 2023 11:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694716009; x=1695320809; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M11OrQ+TZ1qIxEYgw69j14/0gxPhXdb4nKtWAsul/gE=;
        b=mqBBc0G70JMNdVCeAszZzW44q+LyCw0ksibOB23IAKeukUUcImghZXg/ruAjJXyc3d
         PHK99nU0hnoGARGiVsQ5C9sLe1lQOlWGzHJwsAhfvEyJST+JIm/he5SSks6GZ4As82CQ
         jitxfq183YfGJ+Gbw2/yTaeTajvzEWUdgEhBjNYZG84y4iYtQJP9xQ+qLBCTHKT12/TZ
         lmgEiSZsiIDZiVMdzK0uldnBAlPTh5YrOG+ceGRgXWf8fd2d5eK/vojtQUBUgMsxbt18
         hAvLF/PaIj49iqEp8hpMBmXxfDmG3dYn0+ymGRmeUAM6dXYN3DUnkwmE4hsRwwJfiZ/v
         CKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694716009; x=1695320809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M11OrQ+TZ1qIxEYgw69j14/0gxPhXdb4nKtWAsul/gE=;
        b=MplFvz8wM7+DWAPu1wkfGnQGZyqJkbHtZcGq0lhs6UUASkAxldD+BI8x2JnZ+ovANv
         KIUXdsHhseJ+D6z9qSZiReDbMShtFBfYu8CPmy8UpCNL3XQcdQjTAul6sbPqwGeFq2Qh
         BwpKhgVNvpjCDkLZJxbRF5tIsMAsbpnCFtSMaS3INvd0qpJCFIk2nETxjKU2RpAcbal0
         xInNM+53nOC5q1Yc7uNDER6ayrBi8HtNW2pWKgjFLC+cqcbLiaosQ5CsQOXMnCNxRXXf
         5qnbWCkei3WcGjORTrlb31WE7TSR/1DU3o3jnAmbhraSNd9Tht0GuZM/mI5EmCe7EWpm
         +T2g==
X-Gm-Message-State: AOJu0Ywh+ZhEm6W/JUc86zdMWEsTRpM7pLCAw0UOGCm7lzlKMOeGtTTG
	G6uFg0WRJZKbstdB7nWvTazuiciJrxpdoDGIdtw=
X-Google-Smtp-Source: AGHT+IG92H7BF/8Iedu9onKJiEiemdJzL6/YlSqLqgfA7nb/oFG7Wh46czLQAQ4/qMI+QQZ15PK98g==
X-Received: by 2002:a1f:4c41:0:b0:495:d5a4:50c with SMTP id z62-20020a1f4c41000000b00495d5a4050cmr5944411vka.1.1694716009703;
        Thu, 14 Sep 2023 11:26:49 -0700 (PDT)
Received: from jetm-rog-x670e-gene.ftth.telecablecr.com ([190.171.102.33])
        by smtp.gmail.com with ESMTPSA id bq23-20020a056122231700b004901f269bddsm330064vkb.55.2023.09.14.11.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 11:26:49 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Javier Tia <javier.tia@linaro.org>
Subject: [PATCH] optee-client: start tee-supplicant.service when teeprivX dev is detected
Date: Thu, 14 Sep 2023 12:26:16 -0600
Message-ID: <20230914182616.455983-1-javier.tia@linaro.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 14 Sep 2023 18:26:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5049

It's expected to exist multiple /dev/teepriv[0-9]* devices, and the
tee-supplicant service depends on them, which should be activated only
when the device is detected by the kernel using a udev rule.

Improve commit f02d065dce, where it's only considering a path creation
and not a device detection by the kernel.

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 .../{tee-supplicant.service => tee-supplicant@.service}   | 3 +--
 meta-arm/recipes-security/optee/optee-client.inc          | 8 ++++----
 .../{tee-supplicant.service => tee-supplicant@.service}   | 3 +--
 .../trusted-services/libts/tee-udev.rules                 | 5 +++++
 4 files changed, 11 insertions(+), 8 deletions(-)
 rename meta-arm-bsp/recipes-security/optee/optee-client/{tee-supplicant.service => tee-supplicant@.service} (69%)
 rename meta-arm/recipes-security/optee/optee-client/{tee-supplicant.service => tee-supplicant@.service} (69%)

diff --git a/meta-arm-bsp/recipes-security/optee/optee-client/tee-supplicant.service b/meta-arm-bsp/recipes-security/optee/optee-client/tee-supplicant@.service
similarity index 69%
rename from meta-arm-bsp/recipes-security/optee/optee-client/tee-supplicant.service
rename to meta-arm-bsp/recipes-security/optee/optee-client/tee-supplicant@.service
index 6b00df74..72c0b9aa 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-client/tee-supplicant.service
+++ b/meta-arm-bsp/recipes-security/optee/optee-client/tee-supplicant@.service
@@ -1,6 +1,5 @@
 [Unit]
-Description=TEE Supplicant
-ConditionPathExistsGlob=/dev/teepriv[0-9]*
+Description=TEE Supplicant on %i
 
 [Service]
 User=root
diff --git a/meta-arm/recipes-security/optee/optee-client.inc b/meta-arm/recipes-security/optee/optee-client.inc
index 3b9943cc..77f6a642 100644
--- a/meta-arm/recipes-security/optee/optee-client.inc
+++ b/meta-arm/recipes-security/optee/optee-client.inc
@@ -9,7 +9,7 @@ inherit systemd update-rc.d cmake
 
 SRC_URI = " \
     git://github.com/OP-TEE/optee_client.git;branch=master;protocol=https \
-    file://tee-supplicant.service \
+    file://tee-supplicant@.service \
     file://tee-supplicant.sh \
 "
 
@@ -24,16 +24,16 @@ EXTRA_OECMAKE = " \
 EXTRA_OECMAKE:append:toolchain-clang = " -DCFG_WERROR=0"
 
 do_install:append() {
-    install -D -p -m0644 ${WORKDIR}/tee-supplicant.service ${D}${systemd_system_unitdir}/tee-supplicant.service
+    install -D -p -m0644 ${WORKDIR}/tee-supplicant@.service ${D}${systemd_system_unitdir}/tee-supplicant@.service
     install -D -p -m0755 ${WORKDIR}/tee-supplicant.sh ${D}${sysconfdir}/init.d/tee-supplicant
 
     sed -i -e s:@sysconfdir@:${sysconfdir}:g \
            -e s:@sbindir@:${sbindir}:g \
-              ${D}${systemd_system_unitdir}/tee-supplicant.service \
+              ${D}${systemd_system_unitdir}/tee-supplicant@.service \
               ${D}${sysconfdir}/init.d/tee-supplicant
 }
 
-SYSTEMD_SERVICE:${PN} = "tee-supplicant.service"
+SYSTEMD_SERVICE:${PN} = "tee-supplicant@.service"
 
 INITSCRIPT_PACKAGES = "${PN}"
 INITSCRIPT_NAME:${PN} = "tee-supplicant"
diff --git a/meta-arm/recipes-security/optee/optee-client/tee-supplicant.service b/meta-arm/recipes-security/optee/optee-client/tee-supplicant@.service
similarity index 69%
rename from meta-arm/recipes-security/optee/optee-client/tee-supplicant.service
rename to meta-arm/recipes-security/optee/optee-client/tee-supplicant@.service
index 6b00df74..72c0b9aa 100644
--- a/meta-arm/recipes-security/optee/optee-client/tee-supplicant.service
+++ b/meta-arm/recipes-security/optee/optee-client/tee-supplicant@.service
@@ -1,6 +1,5 @@
 [Unit]
-Description=TEE Supplicant
-ConditionPathExistsGlob=/dev/teepriv[0-9]*
+Description=TEE Supplicant on %i
 
 [Service]
 User=root
diff --git a/meta-arm/recipes-security/trusted-services/libts/tee-udev.rules b/meta-arm/recipes-security/trusted-services/libts/tee-udev.rules
index 216fe993..af428974 100644
--- a/meta-arm/recipes-security/trusted-services/libts/tee-udev.rules
+++ b/meta-arm/recipes-security/trusted-services/libts/tee-udev.rules
@@ -1,2 +1,7 @@
 # tee devices can only be accessed by the teeclnt group members
 KERNEL=="tee[0-9]*", TAG+="systemd", MODE="0660", GROUP="teeclnt"
+
+# If a /dev/teepriv[0-9]* device is detected, start an instance of
+# tee-supplicant.service with the device name as parameter
+KERNEL=="teepriv[0-9]*", MODE="0660", OWNER="root", GROUP="teeclnt", \
+    TAG+="systemd", ENV{SYSTEMD_WANTS}+="tee-supplicant@%k.service"
-- 
2.42.0


