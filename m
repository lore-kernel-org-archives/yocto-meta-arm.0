Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE93C54E67
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 02:36:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.34399.1710729366829623629
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 17 Mar 2024 19:36:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AD0712FC
	for <meta-arm@lists.yoctoproject.org>; Sun, 17 Mar 2024 19:36:41 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3E5E83F23F
	for <meta-arm@lists.yoctoproject.org>; Sun, 17 Mar 2024 19:36:06 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/optee: disable clang due to breakage
Date: Sun, 17 Mar 2024 22:35:58 -0400
Message-Id: <20240318023558.85348-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 18 Mar 2024 02:36:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5443

With clang 18, optee-os no longer compiles cleanly.  It is now seeing:

| In file included from core/arch/arm/kernel/vfp.c:6:
| In file included from core/arch/arm/include/arm.h:131:
| core/arch/arm/include/arm64.h:436:1: error: expected readable system
register
|   436 | DEFINE_U32_REG_READWRITE_FUNCS(fpcr)
|       | ^
| core/arch/arm/include/arm64.h:417:3: note: expanded from macro
'DEFINE_U32_REG_READWRITE_FUNCS'
|   417 |                 DEFINE_U32_REG_READ_FUNC(reg)   \
|       |                 ^
| core/arch/arm/include/arm64.h:411:3: note: expanded from macro
'DEFINE_U32_REG_READ_FUNC'
|   411 |                 DEFINE_REG_READ_FUNC_(reg, uint32_t, reg)
|       |                 ^
| core/arch/arm/include/arm64.h:398:15: note: expanded from macro
'DEFINE_REG_READ_FUNC_'
|   398 |         asm volatile("mrs %0, " #asmreg : "=3Dr" (val64));
\
|       |                      ^
| <inline asm>:1:10: note: instantiated into assembly here
|     1 |         mrs x8, fpcr
|       |                 ^

Issues are also seen on optee-examples and optee-test.
Forcing GCC for all optee recipes until this issue can be resolved.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-security/optee/optee.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/recipes=
-security/optee/optee.inc
index af391f3922b0..1569a9df3bd4 100644
--- a/meta-arm/recipes-security/optee/optee.inc
+++ b/meta-arm/recipes-security/optee/optee.inc
@@ -15,6 +15,9 @@ OPTEE_ARCH:arm =3D "arm32"
 OPTEE_ARCH:aarch64 =3D "arm64"
 OPTEE_CORE =3D "${@d.getVar('OPTEE_ARCH').upper()}"
=20
+# FIXME - breaks with Clang 18.  See https://github.com/OP-TEE/optee_os/=
issues/6754
+TOOLCHAIN =3D "gcc"
+
 OPTEE_TOOLCHAIN =3D "${@d.getVar('TOOLCHAIN') or 'gcc'}"
 OPTEE_COMPILER =3D "${@bb.utils.contains("BBFILE_COLLECTIONS", "clang-la=
yer", "${OPTEE_TOOLCHAIN}", "gcc", d)}"
=20
--=20
2.39.3 (Apple Git-146)


