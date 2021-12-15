Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7272C4332F
	for <webhook@archiver.kernel.org>; Wed, 15 Dec 2021 11:13:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.38936.1639566795138633822
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 15 Dec 2021 03:13:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E42DFD6E
	for <meta-arm@lists.yoctoproject.org>; Wed, 15 Dec 2021 03:13:13 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FF783F774
	for <meta-arm@lists.yoctoproject.org>; Wed, 15 Dec 2021 03:13:13 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/4] arm/trusted-firmware-m: remove stale patch
Date: Wed, 15 Dec 2021 11:13:08 +0000
Message-Id: <20211215111311.3066077-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 15 Dec 2021 11:13:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2716

This patch should have been removed as part of the 1.2.0 upgrade.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-m/files/objcopy.patch    | 20 -------------------
 1 file changed, 20 deletions(-)
 delete mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/files/objcopy=
.patch

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/files/objcopy.patch =
b/meta-arm/recipes-bsp/trusted-firmware-m/files/objcopy.patch
deleted file mode 100644
index 5734c13a..00000000
--- a/meta-arm/recipes-bsp/trusted-firmware-m/files/objcopy.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-The BFD target elf32-little has no specified machine, which trips the
-architecture sanity test.  Use elf32-littlearm to set the machine
-correctly.
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-diff --git a/cmake/Common/CompilerGNUARMCommon.cmake b/cmake/Common/Comp=
ilerGNUARMCommon.cmake
-index 32e805bb..2d3ea8e4 100644
---- a/cmake/Common/CompilerGNUARMCommon.cmake
-+++ b/cmake/Common/CompilerGNUARMCommon.cmake
-@@ -196,7 +196,7 @@ function(compiler_generate_hex_output TARGET)
- endfunction()
-=20
- function(compiler_generate_elf_output TARGET)
--	add_custom_command(TARGET ${TARGET} POST_BUILD COMMAND ${CMAKE_GNUARM_=
OBJCOPY} ARGS -O elf32-little $<TARGET_FILE:${TARGET}> $<TARGET_FILE_DIR:=
${TARGET}>/${TARGET}.elf)
-+	add_custom_command(TARGET ${TARGET} POST_BUILD COMMAND ${CMAKE_GNUARM_=
OBJCOPY} ARGS -O elf32-littlearm $<TARGET_FILE:${TARGET}> $<TARGET_FILE_D=
IR:${TARGET}>/${TARGET}.elf)
- endfunction()
-=20
- # Function for creating a new target that preprocesses a .c file
--=20
2.25.1


