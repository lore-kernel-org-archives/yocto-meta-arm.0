Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D412C369AB
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 13:10:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11233.1744981804487296524
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 18 Apr 2025 06:10:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CAED414BF
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Apr 2025 06:10:00 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9C7593F66E
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Apr 2025 06:10:03 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm-bsp/external-system: correct whitespace warning
Date: Fri, 18 Apr 2025 09:10:00 -0400
Message-Id: <20250418131002.95131-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 18 Apr 2025 13:10:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6469

Seeing the following warning:
WARNING: /builds/jonmason00/meta-arm/work/build/../../meta-arm-bsp/recipe=
s-bsp/external-system/external-system_0.1.0.bb: /builds/jonmason00/meta-a=
rm/work/build/../../meta-arm-bsp/recipes-bsp/external-system/external-sys=
tem_0.1.0.bb:6 has a lack of whitespace around the assignment: 'INHIBIT_D=
EFAULT_DEPS=3D"1"'

Adding spaces addresses the issue.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-bsp/external-system/external-system_0.1.0.bb        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1=
.0.bb b/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
index 8bd116163851..1f2d02dfcf8d 100644
--- a/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
+++ b/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION =3D "Firmware to be loaded and run in Externa=
l System Harness in\
                support to the main application CPU."
 HOMEPAGE =3D "https://git.linaro.org/landing-teams/working/arm/external-=
system.git"
 DEPENDS =3D "gcc-arm-none-eabi-native"
-INHIBIT_DEFAULT_DEPS=3D"1"
+INHIBIT_DEFAULT_DEPS =3D "1"
 LICENSE =3D "BSD-3-Clause & Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://license.md;md5=3De44b2531cd6ffe9dece394dbe9=
88d9a0 \
                     file://cmsis/LICENSE.txt;md5=3De3fc50a88d0a364313df4=
b21ef20c29e"
--=20
2.39.5 (Apple Git-154)


