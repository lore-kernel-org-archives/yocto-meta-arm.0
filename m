Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A0C8C3ABBF
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 13:35:05 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.76382.1746538503115849331
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 May 2025 06:35:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=KsPlOG97;
 spf=pass (domain: linaro.org, ip: 209.85.167.46, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5499c5d9691so6694756e87.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 06 May 2025 06:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746538501; x=1747143301; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VoiyUYhLWkAIDO8sUdRD/h2ghjpBOEc+3n7aqP8IC10=;
        b=KsPlOG9731dY+1qWcDBgtqnZd/uNg6dpp8x1oZ9Vgn8NiUwO1LfiJH1aeJZ8cB6v90
         sDRa/gG7UdYQAGOrNE7srj2HsAU9ORw52VxWqOBApH4UAMna/m3pG5JD2YQ/n+WlGYAT
         lUtu0QFfq00tIlP/VG+Y0XrTMQr9f2Y+2Ikn64wNPBQf3IOMU/8/fSBQJrRiOvYI8TRt
         fkmpXJpOqjHTeG3k8nzfBfXzSpy7OYC7RIGgkty236GDw+hAUEGy4l7QFUNaFq/ONKph
         8DKfwmtgTfTlCMLQtTduIJpYLn4XTdbFyaju0nrXaPG2ZWPJZi/wat6Gg5K9MU5I6slO
         8aQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746538501; x=1747143301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VoiyUYhLWkAIDO8sUdRD/h2ghjpBOEc+3n7aqP8IC10=;
        b=AE4+YPVB0FUz95S0/yhRcU/dUaFJ3pathv3yQmdECvmmdDgEpCcU49Ffy4Q9pyVJN+
         xZGzyHJrGSoHFC2S0WmXgH67eK7UVRVfTJY/4D/dvszU07RiiJUjIxpGQ5hQT2diKsm4
         6F0AuqqHbE10myEFzxhfGmPm3Yn7nUp87xJ5BNHV+akTkUNz+y2cw12b2IdvcWwsm0zb
         cZIsCBBzIo1leUB/EYaHozD/SINVaYhZl5rG3T9PmudZ9h7BZ+/OBqCrHiaRZNSN8lp8
         b1tLu1Fbcsk/i3DEzNvW/PypyPowrzE6iurO0MxCdtSlISzWJ3aFsSYqDKMChabBzPYO
         sFaw==
X-Gm-Message-State: AOJu0YwgAh7BuGNeN39n+0+Qyz9KKQo1RBQi145mSoXxddSWFM4Ot6fq
	+WjOkIJVeh9YJZLZPWAHxny8xnDq19DoVe1zj4qT0n4slCyMpOQJCF5qTXrVSL9celH5zr8UTd7
	f6QU=
X-Gm-Gg: ASbGncuGIbQK8Mx1U27BCYTt6TccGuJx9DTbYg/yPkROvKDEN3fIUoR/+4xOOHTuBH5
	WBW5CowgTiV2tadT54zMWpoF6V96t6Mj6fYCDpmxBF+TSjfv6sWZahslVO3Hw1SLpe5hBFYZ+uz
	Q1fy6CBt/VM2sPNbPiI7KubwnkZ5Dt/LMbDFcoBjTIY4KhDPIq5YBD1xZmhkJezHtLxdmHPj1oH
	Nqh33NK9KGn5IbqxH1xm4uyqRiMlCvTphJsHvX5JxHOheWCHz1DN3VmsQ+h1Hz9i1wLHRIgXu7s
	sewbvfZVhanbjYnQQlJx81GIVhIndiXL0gpHlDH17Vr+1/MqJ4DdUAUNQ1Sl/HGWr/2HyvUpw+q
	qcvdKOrTONUDaEzuNUA==
X-Google-Smtp-Source: AGHT+IE2S2HBD+Fb1r+IfC4xoHIdhP9baNVmdxWmlnrtOxcGyVAP6St3F5QCXUETQcVACiNfvtDrKA==
X-Received: by 2002:a05:6512:2c87:b0:54a:c835:cc44 with SMTP id 2adb3069b0e04-54fa4f90306mr3411854e87.46.1746538501123;
        Tue, 06 May 2025 06:35:01 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94c55a0sm2075865e87.86.2025.05.06.06.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:35:00 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] optee-test: disable -Werror
Date: Tue,  6 May 2025 16:33:49 +0300
Message-ID: <20250506133349.1139953-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 06 May 2025 13:35:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6485

Build is now failing with latest gcc 15.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 ...1-optee-test-disable-Werror-in-xtest.patch | 36 +++++++++++++++++++
 .../optee/optee-test_4.4.0.bb                 |  2 ++
 2 files changed, 38 insertions(+)
 create mode 100644 meta-arm/recipes-security/optee/optee-test/0001-optee-test-disable-Werror-in-xtest.patch

diff --git a/meta-arm/recipes-security/optee/optee-test/0001-optee-test-disable-Werror-in-xtest.patch b/meta-arm/recipes-security/optee/optee-test/0001-optee-test-disable-Werror-in-xtest.patch
new file mode 100644
index 00000000..bb760c56
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-test/0001-optee-test-disable-Werror-in-xtest.patch
@@ -0,0 +1,36 @@
+From 813561b54a7da018b3dc38db184e68cd9135ea1c Mon Sep 17 00:00:00 2001
+From: Mikko Rapeli <mikko.rapeli@linaro.org>
+Date: Tue, 6 May 2025 13:14:48 +0000
+Subject: [PATCH] optee-test: disable -Werror in xtest
+
+At distro level we don't care since new toolchains may
+introduce warnings which don't need to break builds.
+Works around build failures like:
+
+./regression_4000_data.h:7919:9: error: initializer-string for array of 'unsigned char' truncates NUL terminator but destination lacks 'nonstring' attribute (20 chars into 19 available) [-Werror=unterminated-string-initialization]
+ 7919 |         "encryption standard";
+      |         ^~~~~~~~~~~~~~~~~~~~~
+
+Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
+---
+ host/xtest/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Upstream-Status: Inappropriate [configuration]
+
+diff --git a/host/xtest/Makefile b/host/xtest/Makefile
+index 5959ed6..ef5fec0 100644
+--- a/host/xtest/Makefile
++++ b/host/xtest/Makefile
+@@ -142,7 +142,7 @@ CFLAGS += -DTA_DIR=\"$(TA_DIR)\"
+ # Include configuration file generated by OP-TEE OS (CFG_* macros)
+ CFLAGS += -include conf.h
+ 
+-CFLAGS += -Wall -Wcast-align -Werror \
++CFLAGS += -Wall -Wcast-align \
+ 	  -Werror-implicit-function-declaration -Wextra -Wfloat-equal \
+ 	  -Wformat-nonliteral -Wformat-security -Wformat=2 -Winit-self \
+ 	  -Wmissing-declarations -Wmissing-format-attribute \
+-- 
+2.43.0
+
diff --git a/meta-arm/recipes-security/optee/optee-test_4.4.0.bb b/meta-arm/recipes-security/optee/optee-test_4.4.0.bb
index d514c82c..36c5582d 100644
--- a/meta-arm/recipes-security/optee/optee-test_4.4.0.bb
+++ b/meta-arm/recipes-security/optee/optee-test_4.4.0.bb
@@ -3,6 +3,8 @@ require recipes-security/optee/optee-test.inc
 # v4.4.0
 SRCREV = "695231ef8987866663a9ed5afd8f77d1bae3dc08"
 
+SRC_URI += "file://0001-optee-test-disable-Werror-in-xtest.patch"
+
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a8fa504109e4cd7ea575bc49ea4be560"
 
 
-- 
2.43.0


