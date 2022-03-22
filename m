Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 610EAC433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 13:43:30 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web09.9985.1647956609419361090
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 06:43:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=wbRJo7r+;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.52,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f52.google.com with SMTP id gi14so2840687qvb.0
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 06:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Awh4aSUFA0bO8PaD0xoDNtNiV0jooBh+yNcUdBhUxRY=;
        b=wbRJo7r+iouDTbn+4SVNEcxXty/VlQuMmUAeQMaUGYKzUYXTdgXuJL+EHSPCc2dq6V
         Jy9HXixY6LzIS0oMFT3KXapQ21onL0Y1z86jieS9LJyX4r+dZ5yKsq7SICtsP0+R8rat
         bhzEh9tQWoLO4AzPCXLYmFZHwO447aVZZRZloXCRKXAFkKZM47lFKfKN/QT4rrQCZz/S
         ou4ToI3gOLfCHTOgn/bZSrFGtd2T7ZrksyKbo3K4/ByE/qgKyilykufeqY6IOa62n66K
         +2OLbGqPhIFni8XC928W/0cFeh+pCX/If34CU5UzWm0QlYmt+AVl6HznDIWr5M6cBHcG
         jrTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Awh4aSUFA0bO8PaD0xoDNtNiV0jooBh+yNcUdBhUxRY=;
        b=R7sJ9bPNkZKBXwEKhOCUA+ySHqOjI0XgNZoAku690fXv4Rggrq7kV98JWdJa6ZCGTG
         sZawTNQN0ZGfZpX+hFrqhTZ2JrRjK0N8WK8gm9FXrgvEm7d9Yb1dur+Igy6qFhQeiykK
         nRL0nmW+Kgs6So1xbDnNA1D+Nbe62gvqtXW+yb76W2XeKgycMcV5MtffGyfd5q4Bmm4R
         lOooHZo6M+mJha2OLDyiFOREGrJ7ZcqT/bgrWMrUOcmXcj8sQhmvObpuGSZY9F1dWlCj
         RcKvAlHFJVsFIq7VUmZrQ0MwaSK1NMPNxA+LgqG96fTddswrvvmnsebaVhUtgw02/zOV
         F36A==
X-Gm-Message-State: AOAM530bqDusXqhBGuvCT0xyLTSZlpuX5aXtDj6HOE2gXLHwYNPVyqjk
	7N9ymS/s9NLVU1xFqgVUABAXKrmdGU3DyQ==
X-Google-Smtp-Source: 
 ABdhPJxfqtm4liJjMsMBDn9ukNxNBIe64aDPU1IL5pUuVEBc0/390HQ8LFr7seRuO37w85D3ZwW15Q==
X-Received: by 2002:ad4:5d6b:0:b0:441:bad:b469 with SMTP id
 fn11-20020ad45d6b000000b004410badb469mr11830870qvb.101.1647956608158;
        Tue, 22 Mar 2022 06:43:28 -0700 (PDT)
Received: from localhost ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 m1-20020ae9e001000000b0067d430bba8asm9008018qkk.88.2022.03.22.06.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 06:43:27 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: denis@denix.org,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [RFC] arm-toolchain: upgrade toolchains to 11.2-2002.02
Date: Tue, 22 Mar 2022 09:43:27 -0400
Message-Id: <20220322134327.4090222-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 22 Mar 2022 13:43:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3192

There is a new and unified version of the toolchains (no longer the RM
and A toolchain split).  Update the paths and SHAs to reflect the new
location.

NOTE: with this change, the binary toolchains do not appear to work

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/get-binary-toolchains                      | 13 ++++++----
 ...b => gcc-aarch64-none-elf_11.2-2022.02.bb} | 14 +++++------
 .../gcc-arm-none-eabi_10.3-2021.10.bb         | 20 ----------------
 .../gcc-arm-none-eabi_11.2-2022.02.bb         | 24 +++++++++++++++++++
 4 files changed, 39 insertions(+), 32 deletions(-)
 rename meta-arm-toolchain/recipes-devtools/external-arm-toolchain/{gcc-aarch64-none-elf_10.3-2021.07.bb => gcc-aarch64-none-elf_11.2-2022.02.bb} (61%)
 delete mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_10.3-2021.10.bb
 create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_11.2-2022.02.bb

diff --git a/ci/get-binary-toolchains b/ci/get-binary-toolchains
index 838342a1c572..394ce4131b9f 100755
--- a/ci/get-binary-toolchains
+++ b/ci/get-binary-toolchains
@@ -2,7 +2,7 @@
 set -u
 
 HOST_ARCH=$(uname -m)
-VER="10.3-2021.07"
+VER="11.2-2022.02"
 
 DOWNLOAD_DIR=$1
 TOOLCHAIN_DIR=$2
@@ -15,18 +15,21 @@ if [ $HOST_ARCH = "aarch64" ]; then
 	#AArch64 Linux hosted cross compilers
 
 	#AArch32 target with hard float (arm-none-linux-gnueabihf)
-	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
+	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
+
+	#AArch64 GNU/Linux target (aarch64-none-linux-gnu)
+	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64-none-linux-gnu.tar.xz
 elif [ $HOST_ARCH = "x86_64" ]; then
 	#x86_64 Linux hosted cross compilers
 
 	#AArch32 target with hard float (arm-linux-none-gnueabihf)
-	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
+	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
 
 	#AArch64 GNU/Linux target (aarch64-none-linux-gnu)
-	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64-none-linux-gnu.tar.xz
+	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64-none-linux-gnu.tar.xz
 
 	#AArch64 GNU/Linux target (aarch64_be-none-linux-gnu)
-	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64_be-none-linux-gnu.tar.xz
+	wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64_be-none-linux-gnu.tar.xz
 else
 	echo "ERROR - Unknown build arch of $HOST_ARCH"
 	exit 1
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.3-2021.07.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_11.2-2022.02.bb
similarity index 61%
rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.3-2021.07.bb
rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_11.2-2022.02.bb
index 02b5b43bdd7e..a9e6b581a50e 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.3-2021.07.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_11.2-2022.02.bb
@@ -9,16 +9,16 @@ SUMMARY = "Baremetal GCC for Aarch64 processors"
 LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only"
 
 LIC_FILES_CHKSUM = "${@d.getVar(d.expand("LIC_FILES_CHKSUM_${HOST_ARCH}"))}"
-LIC_FILES_CHKSUM:aarch64 = "file://share/doc/gcc/Copying.html;md5=d06ace534ed0851debcb7140c5b5116e"
-LIC_FILES_CHKSUM:x86-64 = "file://share/doc/gcc/Copying.html;md5=e4bcb5bee0c4a50c06704b0b73fcbe0c"
+LIC_FILES_CHKSUM:aarch64 = "file://share/doc/gcc/Copying.html;md5=be4f8b5ff7319cd54f6c52db5d6f36b0"
+LIC_FILES_CHKSUM:x86-64 = "file://share/doc/gcc/Copying.html;md5=1f07179249795891179bb3798bac7887"
 
-PROVIDES = "virtual/aarch64-none-elf-gcc"
+PROVIDES = "virtual/${BINNAME}-gcc"
 
-SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-a/${PV}/binrel/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=gnu-a-${HOST_ARCH}"
-SRC_URI[gnu-a-aarch64.sha256sum] = "768a5db41d93f48838f1c4bfeae26930df2320c09f0dfa798321082fb937955f"
-SRC_URI[gnu-a-x86_64.sha256sum] = "6f74b1ee370caeb716688d2e467e5b44727fdc0ed56023fe5c72c0620019ecef"
+SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu/${PV}/binrel/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=gnu-a-${HOST_ARCH}"
+SRC_URI[gnu-a-aarch64.sha256sum] = "3b15725545a0211a17b63e72d4f10241f7ffbe7ce94cb9612590ceacde16992c"
+SRC_URI[gnu-a-x86_64.sha256sum] = "b0a015a9e8cbb44ed2fe5ad755a7a7ae254d54f93df3bf47378485b0ba8b828b"
 
 S = "${WORKDIR}/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}"
 
-UPSTREAM_CHECK_URI = "https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-a/downloads"
+UPSTREAM_CHECK_URI = "https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/downloads"
 UPSTREAM_CHECK_REGEX = "gcc-arm-(?P<pver>.+)-${HOST_ARCH}-${BINNAME}\.tar\.\w+"
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_10.3-2021.10.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_10.3-2021.10.bb
deleted file mode 100644
index ad7e81617d74..000000000000
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_10.3-2021.10.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-# Copyright (C) 2019 Garmin Ltd. or its subsidiaries
-# Released under the MIT license (see COPYING.MIT for the terms)
-
-require arm-binary-toolchain.inc
-
-COMPATIBLE_HOST = "(x86_64|aarch64).*-linux"
-
-SUMMARY = "Baremetal GCC for ARM-R and ARM-M processors"
-LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only"
-
-LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=c18349634b740b7b95f2c2159af888f5"
-
-PROVIDES = "virtual/arm-none-eabi-gcc"
-
-SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/${PV}/${BP}-${HOST_ARCH}-linux.tar.bz2;name=gnu-rm-${HOST_ARCH}"
-SRC_URI[gnu-rm-aarch64.sha256sum] = "f605b5f23ca898e9b8b665be208510a54a6e9fdd0fa5bfc9592002f6e7431208"
-SRC_URI[gnu-rm-x86_64.sha256sum] = "97dbb4f019ad1650b732faffcc881689cedc14e2b7ee863d390e0a41ef16c9a3"
-
-UPSTREAM_CHECK_URI = "https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads"
-UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>.+)-${HOST_ARCH}-linux\.tar\.\w+"
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_11.2-2022.02.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_11.2-2022.02.bb
new file mode 100644
index 000000000000..4e9fe35789f9
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_11.2-2022.02.bb
@@ -0,0 +1,24 @@
+# Copyright (C) 2019 Garmin Ltd. or its subsidiaries
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+require arm-binary-toolchain.inc
+
+COMPATIBLE_HOST = "(x86_64|aarch64).*-linux"
+
+SUMMARY = "Baremetal GCC for ARM-R and ARM-M processors"
+LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
+
+LIC_FILES_CHKSUM = "${@d.getVar(d.expand("LIC_FILES_CHKSUM_${HOST_ARCH}"))}"
+LIC_FILES_CHKSUM:aarch64 = "file://share/doc/gcc/Copying.html;md5=be4f8b5ff7319cd54f6c52db5d6f36b0"
+LIC_FILES_CHKSUM:x86-64 = "file://share/doc/gcc/Copying.html;md5=1f07179249795891179bb3798bac7887"
+
+PROVIDES = "virtual/${BINNAME}-gcc"
+
+SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu/${PV}/binrel/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=gnu-rm-${HOST_ARCH}"
+SRC_URI[gnu-rm-aarch64.sha256sum] = "dd861d188f4061a7ef3857c948376f84ef1dfb88a32aded7c336ed7e47e60970"
+SRC_URI[gnu-rm-x86_64.sha256sum] = "8c5acd5ae567c0100245b0556941c237369f210bceb196edfe5a2e7532c60326"
+
+S = "${WORKDIR}/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}"
+
+UPSTREAM_CHECK_URI = "https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/downloads"
+UPSTREAM_CHECK_REGEX = "gcc-arm-(?P<pver>.+)-${HOST_ARCH}-${BINNAME}\.tar\.\w+"
-- 
2.30.2


