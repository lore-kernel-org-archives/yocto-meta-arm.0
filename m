Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.155.1624477616403017774
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Jun 2021 12:46:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lHeZwEnh;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id h21-20020a1ccc150000b02901d4d33c5ca0so2090288wmb.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 23 Jun 2021 12:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3EJJGEwmx2mxIQwclx13Z+VV3xA16PpV4ylIymqeZK0=;
        b=lHeZwEnhw24VowdCqZMV6iqcsqSB8P5HeamZHXnTnPSgbrc76109xHnqP2nP6S5hTf
         dXB8ij0xU3LwNM9BJpTR/Fni+H2A/H+/caIkiiqtC2LB2qXqun01deTHt494DiFcpd41
         6jIjVLvxRoc8EbAiFeqIZHB2BrPH5g8sdhWsE5nj55VWCZwqUHMX4DSSABoYt9iA158t
         3JyHRNUINHPXH2Av+Tz5wh93gQhnq/Aj/6NhcZ0iJuFJSU4hzsPIMPFu5z664I7YJsfb
         tD+iQLsZU0EdiDx8kOnt/oso3zBrxFLLuOzwvVoo21w0HL/87EC5voSRLK6zr3cZJIt+
         zqcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3EJJGEwmx2mxIQwclx13Z+VV3xA16PpV4ylIymqeZK0=;
        b=naKd/w5OqTE6ahLYmHQcDad/sdG922V0zNw3cu9TL7jX81n4bnDTGvL1NrHsgBxwGD
         mN1lPWsMmh8o9NEjKV48fVHbVh6ttdnyZeBrvQbSudQI0DRcdJh8a50bsQJ8cGMxxHZk
         zJjDUdKgJCFy0HvV3m4+BAgsQlOrDmi8yQL5hrQI2Y3ItXXM3JKCqJ/zBOOKR5PqFzuZ
         iYiFEn8PNRvUjvh44heBN9P4yV5Ypl1fdv+4ihCEjKvDmgjyK3w+LxWVsaqBWUCyY4Ok
         v3Z1kQeMbfuFa76y8+s6zWhEXSvU+yETso+gWniRJgY/jfNiuZd/0/H6y7WM3Tzzp/Od
         JXRw==
X-Gm-Message-State: AOAM5312ldCK1DZxoD4yctJ5o8eqdQb8w5VMvJGb9JcZ35PlGjEgnPEa
	RjmUuhcwW4V4hwcNSA5ep3hhVLWRYV619A==
X-Google-Smtp-Source: ABdhPJw0uhIXCzBDF8LlMon3THaIGMF0innNsdM56BapE889607bVkS28nbhiJobpIHnI07wW0vcPA==
X-Received: by 2002:a7b:c4da:: with SMTP id g26mr12761569wmk.3.1624477614321;
        Wed, 23 Jun 2021 12:46:54 -0700 (PDT)
Return-Path: <peron.clem@gmail.com>
Received: from localhost.localdomain (2a01cb0003ba9b00b8f08e2a3adfa2d4.ipv6.abo.wanadoo.fr. [2a01:cb00:3ba:9b00:b8f0:8e2a:3adf:a2d4])
        by smtp.gmail.com with ESMTPSA id z9sm6602852wmf.43.2021.06.23.12.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 12:46:53 -0700 (PDT)
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v2] gator-daemon: Add new package
Date: Wed, 23 Jun 2021 21:46:51 +0200
Message-Id: <20210623194651.525943-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

To communicate with the target device, Streamline requires the
gator daemon, gatord, to be running on the device.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---

This patch has been first submitted to meta-oe,
after discussion it's better to submit it to meta-arm.

Changes since v1:
 - Rename gator to gator-daemon 
 - Bump to 7.7.0
 - Remove merged patch
 - Add compatible_host to aarch64
 - Compile with V=1
 - Update Description and add comment

Changes since meta-oe:
 - Bump to 7.6.0
 - Add upstream-status and signoff patch
 - Add Kernel config requirement to summary
 - Add Homepage
 - Add all Licenses and checksums

 .../gator-daemon/gator-daemon_7.7.0.bb        | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb

diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb
new file mode 100644
index 000000000000..61b173142829
--- /dev/null
+++ b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb
@@ -0,0 +1,32 @@
+SUMMARY = "DS-5 Streamline Gator daemon"
+DESCRIPTION = "Target-side daemon gathering data for ARM Streamline \
+               Performance Analyzer."
+HOMEPAGE = "https://github.com/ARM-software/gator"
+
+# Note that Gator uses the Linux Perf API for
+# most of its data collection. Check that your Kernel follow the
+# configuration requirement specified here:
+# https://github.com/ARM-software/gator#kernel-configuration
+
+LICENSE = "GPLv2 & LGPLv2.1+ & Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://libsensors/COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c \
+                    file://mxml/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327 \
+                    file://k/perf_event.h;endline=14;md5=e548bf30a60b2ed11ef2dcf7bfdac230 \
+                   "
+
+SRCREV = "9d8d75fa08352470c51abc23fe3b314879bd8b78"
+SRC_URI = "git://github.com/ARM-software/gator.git;protocol=http;branch=main"
+
+S = "${WORKDIR}/git/daemon"
+
+COMPATIBLE_HOST = "aarch64.*-linux"
+
+EXTRA_OEMAKE = "'CFLAGS=${CFLAGS} ${TARGET_CC_ARCH} -D_DEFAULT_SOURCE -DETCDIR=\"${sysconfdir}\"' \
+                'LDFLAGS=${LDFLAGS} ${TARGET_CC_ARCH}' 'CROSS_COMPILE=${TARGET_PREFIX}' \
+                'CXXFLAGS=${CXXFLAGS} ${TARGET_CC_ARCH} -fno-rtti' CC='${CC}' CXX='${CXX}' V=1"
+
+do_install() {
+        install -d ${D}${sbindir}
+        install -m 0755 ${S}/gatord ${D}${sbindir}/gatord
+}
-- 
2.25.1

