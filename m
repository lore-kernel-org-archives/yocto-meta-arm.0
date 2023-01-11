Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D59F4C46467
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 18:00:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.31448.1673459994786837333
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 Jan 2023 09:59:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73B2BFEC;
	Wed, 11 Jan 2023 10:00:36 -0800 (PST)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA8753F587;
	Wed, 11 Jan 2023 09:59:53 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 2/2][langdale] arm/scp-firmware: Disable cppcheck
Date: Wed, 11 Jan 2023 17:59:29 +0000
Message-Id: <20230111175929.1446440-2-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230111175929.1446440-1-peter.hoyes@arm.com>
References: <20230111175929.1446440-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 11 Jan 2023 18:00:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4263

From: Peter Hoyes <Peter.Hoyes@arm.com>

The SCP-firmware CMake compile step automatically attempts to execute
cppcheck if both:
 * cppcheck can be located using find_program
 * DISABLE_CPPCHECK is not defined

cppcheck is not readily available in OE-core and is not an essential
part of the compilation process for end-users, so explicitly disable the
cppcheck step by passing DISABLE_CPPCHECK to CMake.

Additionally, because the OE-core CMake toolchain file cannot be used,
find_program may locate cppcheck on the host machine, which will cause
the build to fail if it is not the recommended version (as it is in
recent Linux distros).

Issue-Id: SCM-5864
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: Ia87a0cbbb67ac1d6f3b26cfb5747a85b46131f81
---
 meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb b/m=
eta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb
index 5dbbff94..055e0c1b 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb
@@ -46,6 +46,7 @@ CFLAGS[unexport] =3D "1"
 EXTRA_OECMAKE =3D "-D CMAKE_BUILD_TYPE=3D${SCP_BUILD_STR} \
                  -D SCP_LOG_LEVEL=3D${SCP_LOG_LEVEL} \
                  -D SCP_PLATFORM_FEATURE_SET=3D${SCP_PLATFORM_FEATURE_SE=
T} \
+                 -D DISABLE_CPPCHECK=3D1 \
                 "
=20
 do_configure() {
--=20
2.34.1


