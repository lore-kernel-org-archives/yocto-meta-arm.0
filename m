Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 614C1C38159
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 14:56:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.76400.1674226613746149389
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 20 Jan 2023 06:56:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE345152B
	for <meta-arm@lists.yoctoproject.org>; Fri, 20 Jan 2023 06:57:34 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 03CBA3F67D
	for <meta-arm@lists.yoctoproject.org>; Fri, 20 Jan 2023 06:56:52 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/4] external-arm-toolchain: Enable 12.2.rel1 support
Date: Fri, 20 Jan 2023 09:56:47 -0500
Message-Id: <20230120145647.11758-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230120145647.11758-1-jon.mason@arm.com>
References: <20230120145647.11758-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 20 Jan 2023 14:56:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4308

Enable support for 12.2.rel1 binary toolchain release

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/get-binary-toolchains                             |  2 +-
 ...-2022.02.bb => gcc-aarch64-none-elf_12.2.rel1.bb} | 12 ++++++------
 ...1.2-2022.02.bb => gcc-arm-none-eabi_12.2.rel1.bb} | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)
 rename meta-arm-toolchain/recipes-devtools/external-arm-toolchain/{gcc-aarch64-none-elf_11.2-2022.02.bb => gcc-aarch64-none-elf_12.2.rel1.bb} (64%)
 rename meta-arm-toolchain/recipes-devtools/external-arm-toolchain/{gcc-arm-none-eabi_11.2-2022.02.bb => gcc-arm-none-eabi_12.2.rel1.bb} (64%)

diff --git a/ci/get-binary-toolchains b/ci/get-binary-toolchains
index bf8bf3e7..23c3bbb1 100755
--- a/ci/get-binary-toolchains
+++ b/ci/get-binary-toolchains
@@ -2,7 +2,7 @@
 set -u -e
 
 BASENAME=arm-gnu-toolchain
-VER=${VER:-11.3.rel1}
+VER=${VER:-12.2.rel1}
 HOST_ARCH=${HOST_ARCH:-$(uname -m)}
 
 DOWNLOAD_DIR=$1
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_11.2-2022.02.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_12.2.rel1.bb
similarity index 64%
rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_11.2-2022.02.bb
rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_12.2.rel1.bb
index 2a5a4efb..b3b09bae 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_11.2-2022.02.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_12.2.rel1.bb
@@ -8,16 +8,16 @@ COMPATIBLE_HOST = "(x86_64|aarch64).*-linux"
 SUMMARY = "Arm GNU Toolchain - AArch64 bare-metal target (aarch64-none-elf)"
 LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only"
 
-LIC_FILES_CHKSUM:aarch64 = "file://share/doc/gcc/Copying.html;md5=be4f8b5ff7319cd54f6c52db5d6f36b0"
-LIC_FILES_CHKSUM:x86-64 = "file://share/doc/gcc/Copying.html;md5=1f07179249795891179bb3798bac7887"
+LIC_FILES_CHKSUM:aarch64 = "file://share/doc/gcc/Copying.html;md5=0aef214b835259b64f026f4ad00c703e"
+LIC_FILES_CHKSUM:x86-64 = "file://share/doc/gcc/Copying.html;md5=7ba3bc8ef145b48e2756a844db2029a3"
 
 PROVIDES = "virtual/aarch64-none-elf-gcc"
 
-SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu/${PV}/binrel/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=gcc-${HOST_ARCH}"
-SRC_URI[gcc-aarch64.sha256sum] = "3b15725545a0211a17b63e72d4f10241f7ffbe7ce94cb9612590ceacde16992c"
-SRC_URI[gcc-x86_64.sha256sum] = "b0a015a9e8cbb44ed2fe5ad755a7a7ae254d54f93df3bf47378485b0ba8b828b"
+SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu/${PV}/binrel/arm-gnu-toolchain-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=gcc-${HOST_ARCH}"
+SRC_URI[gcc-aarch64.sha256sum] = "570a9bd42e2067d79d59b0747891681ebec66f30d989d17a05856563fe38f78b"
+SRC_URI[gcc-x86_64.sha256sum] = "62d66e0ad7bd7f2a183d236ee301a5c73c737c886c7944aa4f39415aab528daf"
 
-S = "${WORKDIR}/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}"
+S = "${WORKDIR}/arm-gnu-toolchain-${PV}-${HOST_ARCH}-${BINNAME}"
 
 UPSTREAM_CHECK_URI = "https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-a/downloads"
 UPSTREAM_CHECK_REGEX = "gcc-arm-(?P<pver>.+)-${HOST_ARCH}-${BINNAME}\.tar\.\w+"
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_11.2-2022.02.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_12.2.rel1.bb
similarity index 64%
rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_11.2-2022.02.bb
rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_12.2.rel1.bb
index 26f0ee82..948933b9 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_11.2-2022.02.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_12.2.rel1.bb
@@ -8,16 +8,16 @@ COMPATIBLE_HOST = "(x86_64|aarch64).*-linux"
 SUMMARY = "Arm GNU Toolchain - AArch32 bare-metal target (arm-none-eabi)"
 LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only"
 
-LIC_FILES_CHKSUM:aarch64 = "file://share/doc/gcc/Copying.html;md5=be4f8b5ff7319cd54f6c52db5d6f36b0"
-LIC_FILES_CHKSUM:x86-64 = "file://share/doc/gcc/Copying.html;md5=1f07179249795891179bb3798bac7887"
+LIC_FILES_CHKSUM:aarch64 = "file://share/doc/gcc/Copying.html;md5=0aef214b835259b64f026f4ad00c703e"
+LIC_FILES_CHKSUM:x86-64 = "file://share/doc/gcc/Copying.html;md5=7ba3bc8ef145b48e2756a844db2029a3"
 
 PROVIDES = "virtual/arm-none-eabi-gcc"
 
-SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu/${PV}/binrel/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=gcc-${HOST_ARCH}"
-SRC_URI[gcc-aarch64.sha256sum] = "ef1d82e5894e3908cb7ed49c5485b5b95deefa32872f79c2b5f6f5447cabf55f"
-SRC_URI[gcc-x86_64.sha256sum] = "8c5acd5ae567c0100245b0556941c237369f210bceb196edfe5a2e7532c60326"
+SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu/${PV}/binrel/arm-gnu-toolchain-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=gcc-${HOST_ARCH}"
+SRC_URI[gcc-aarch64.sha256sum] = "7ee332f7558a984e239e768a13aed86c6c3ac85c90b91d27f4ed38d7ec6b3e8c"
+SRC_URI[gcc-x86_64.sha256sum] = "84be93d0f9e96a15addd490b6e237f588c641c8afdf90e7610a628007fc96867"
 
-S = "${WORKDIR}/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}"
+S = "${WORKDIR}/arm-gnu-toolchain-${PV}-${HOST_ARCH}-${BINNAME}"
 
 UPSTREAM_CHECK_URI = "https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/downloads"
 UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>.+)-${HOST_ARCH}-linux\.tar\.\w+"
-- 
2.17.1


