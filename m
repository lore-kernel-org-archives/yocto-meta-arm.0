Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12819C369AE
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 09:02:46 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.10936.1727254959784438464
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 25 Sep 2024 02:02:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=OAoSmZAn;
 spf=pass (domain: linaro.org, ip: 209.85.208.178, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f761cfa5e6so70731061fa.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 25 Sep 2024 02:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727254958; x=1727859758; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QQGnmmRi1nU16WY3QHiqFBdRs8QwatKcCYueFacwUnU=;
        b=OAoSmZAnqjRi5G65eG/0+Z1Ho53tu3WGMtRF1KqTKAJUG6mZnlVRJSz4/Fy3rHYaFJ
         FmLlN6dp3/z/CN7/Tn/vpNZtWmm2DYyZLF9fQaNlt2BHTHeoMabEcDUNTQGYHT30uOL/
         mdpNnuDmymw0wXfC/G/VZ5g/xYoG1RC9rCCHRbNUfjORoCFnua2vzN9R5wAWnNzL9dV1
         GnxTHYr/sj//ySG4VWRC/NzuHvHeKyQfrioUU1BRZ6Y7RiVTQcjvPHAOChUtuI7BLTE1
         +g/la/mYI7FwuaEm7RhEIK/LuJOiJzgd5SJTGc5Fl3XplCPhT4tRwmBhMWx5jSU5s2P2
         Ov9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727254958; x=1727859758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QQGnmmRi1nU16WY3QHiqFBdRs8QwatKcCYueFacwUnU=;
        b=JOkm3aqN3m/x6rKeLYTOhodINTu7spIagcoU8DAtc17WpKyR56iP5/qJMrh8LuYu28
         L3NAj7+4HQWgFvVHzyBdO3PT1y4luOnOu+siRY06+GUKKdOEYgav0E7UL4fIj1EDmpYf
         h2/bdLcJztNWr6DCMheHwaPW6yLEuKCoWgPqA9kxcQo0wp8ebJNiZ1nOQi63Z/Z+ev1h
         E5rM1bd7RblLj52x7RyziMBLmthAgId2P8Qol9Zu24T00nRIhhYvu4wGEALNl0VGeZ7R
         zn1/OF45r6Hl1IRJGrxNsoAygsv4E5OzZTSVdql2EoesOVruJ+dqn7iqBec+vO19j7mK
         saPQ==
X-Gm-Message-State: AOJu0YysD/YaQnVxzbejMyh3xaEvp+Gi3RcjeD7JcCl39j9iuPPDzGmk
	7eKippu2GzFwbFbhJsy75f2REqcMmn1OaA0bomZf7Ig2TQDw31AoalSY26GhfU7mWVl7G2IIMki
	4kyw=
X-Google-Smtp-Source: AGHT+IGZgEcnVrKuRMQu2Z0ZW8byvwfZfear6I/t3bDwmI4QBpHNk1KOeuXHGw/qD9DKQBuCK6kJhA==
X-Received: by 2002:a2e:851:0:b0:2f6:4cc0:5438 with SMTP id 38308e7fff4ca-2f91ca407c8mr9481321fa.29.1727254957674;
        Wed, 25 Sep 2024 02:02:37 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f8d289ef7fsm4686501fa.119.2024.09.25.02.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 02:02:35 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Javier Tia <javier.tia@linaro.org>
Subject: [PATCH 2/4] arm/optee: Add optee udev rules
Date: Wed, 25 Sep 2024 12:01:45 +0300
Message-ID: <20240925090147.66618-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240925090147.66618-1-mikko.rapeli@linaro.org>
References: <20240925090147.66618-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 25 Sep 2024 09:02:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6104

From: Javier Tia <javier.tia@linaro.org>

If a /dev/teepriv[0-9]* device is detected, start an instance of
tee-supplicant.service with the device name as parameter.

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 meta-arm/recipes-security/optee/optee-client.inc          | 8 +++++++-
 .../recipes-security/optee/optee-client/optee-udev.rules  | 6 ++++++
 2 files changed, 13 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm/recipes-security/optee/optee-client/optee-udev.rules

diff --git a/meta-arm/recipes-security/optee/optee-client.inc b/meta-arm/recipes-security/optee/optee-client.inc
index ddda2d1a..f387c805 100644
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
index 00000000..075f469c
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
2.34.1


