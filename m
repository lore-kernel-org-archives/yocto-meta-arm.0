Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE641C5479D
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 17:58:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.31403.1673459897666087672
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 Jan 2023 09:58:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CEC86FEC;
	Wed, 11 Jan 2023 09:58:58 -0800 (PST)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 013CE3F587;
	Wed, 11 Jan 2023 09:58:15 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 1/2] arm/scp-firmware: Ensure CMAKE_BUILD_TYPE is capitalized
Date: Wed, 11 Jan 2023 17:58:02 +0000
Message-Id: <20230111175803.1446302-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 11 Jan 2023 17:58:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4260

From: Peter Hoyes <Peter.Hoyes@arm.com>

If CMAKE_BUILD_TYPE=3Ddebug (lowercase), SCP-firmware builds with debug
compiler flags but BUILD_MODE_DEBUG is not defined in C code so features
that are conditionally enabled/disabled in debug mode are not active.

Pass capitalized "Debug" and "Release" strings to CMAKE_BUILD_TYPE to
ensure Debug mode is fully enabled when SCP_BUILD_RELEASE =3D "0".

SCP_BUILD_RELEASE =3D "1" (the default) for all machines in meta-arm-bsp
so they are unaffected.

Issue-Id: SCM-5864
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I93220420eedd2e3e6c169679efcaf4642dd5bc51
---
 meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb b/m=
eta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb
index 4828fb55..5dbbff94 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb
@@ -27,7 +27,7 @@ DEPENDS =3D "virtual/arm-none-eabi-gcc-native \
 # For now we only build with GCC, so stop meta-clang trying to get invol=
ved
 TOOLCHAIN =3D "gcc"
=20
-SCP_BUILD_STR =3D "${@bb.utils.contains('SCP_BUILD_RELEASE', '1', 'relea=
se', 'debug', d)}"
+SCP_BUILD_STR =3D "${@bb.utils.contains('SCP_BUILD_RELEASE', '1', 'Relea=
se', 'Debug', d)}"
=20
 inherit deploy
=20
--=20
2.34.1


