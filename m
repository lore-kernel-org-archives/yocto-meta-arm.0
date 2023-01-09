Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E49DEC54EBE
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 14:41:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.73666.1673275294607518730
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 09 Jan 2023 06:41:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02C8D1042;
	Mon,  9 Jan 2023 06:42:16 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 904253F587;
	Mon,  9 Jan 2023 06:41:33 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH][dunfell 1/2] arm/scp-firmware: rationalise SRCREV/bbappends
Date: Mon,  9 Jan 2023 14:41:29 +0000
Message-Id: <20230109144130.1399220-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 09 Jan 2023 14:41:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4238

In "scp-firmware: allow setting log level to INFO or WARN"[1] the base
SRCREV was bumped from db1991 (the 2.6 tag) to fd7c8356. This means a
fair amount of cleanup can be made:

The base recipe should set PV=3D2.6+git, both of the existing bbappends
already did this so those can be removed.

The base recipe's CMSIS SRCREV should be a SHA, not a tag name. Both
bbappends also did this so those can be removed.

The TC0 SRCREV is in fact earlier than the new base recipe, so remove
the override so unify the versions. There were no TC-specific changes
between the two SHAs so this should be safe.

[1] 9386db13df5134ab68ae3a1618e999584f7a4261

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc        | 4 ----
 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc | 7 -------
 meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb      | 3 ++-
 3 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc=
 b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
index ddbaac4a..495f1ed6 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
@@ -1,14 +1,10 @@
 # N1SDP specific SCP configurations and build instructions
=20
-SRCREV_scp    =3D "fd7c83561a7d76c7681d5d017fb23aa3664c028c"
-SRCREV_cmsis  =3D "refs/tags/5.2.0"
 SCP_PLATFORM  =3D "n1sdp"
 SCP_LOG_LEVEL =3D "INFO"
=20
 COMPATIBLE_MACHINE_n1sdp =3D "n1sdp"
=20
-PV =3D "2.6+git${SRCPV}"
-
 DEPENDS +=3D "fiptool-native"
 DEPENDS +=3D "virtual/trusted-firmware-a"
=20
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc b=
/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
index 5b29305b..7df09338 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
@@ -1,13 +1,6 @@
 # TC0 specicif SCP configuration
=20
-# Intermediate SHA with 2.6 baseline version
-SRCREV_scp    =3D "ba1db5fb0ee4a520836722f7a694177d461ab716"
-# 5.2.0 tag commit
-SRCREV_cmsis  =3D "80cc44bba16cb4c8f495b7aa9709d41ac50e9529"
-
 COMPATIBLE_MACHINE =3D "tc0"
=20
 SCP_PLATFORM =3D "tc0"
 FW_TARGETS =3D "scp"
-
-PV =3D "2.6+git${SRCPV}"
diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb b/meta=
-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
index 9cb8b642..92c82c58 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
@@ -13,8 +13,9 @@ SRC_URI =3D "\
     git://github.com/ARM-software/CMSIS_5.git;protocol=3Dhttps;name=3Dcm=
sis;destsuffix=3Dsrc/cmsis;lfs=3D0;nobranch=3D1 \
 "
=20
+PV            =3D "2.6+git${SRCPV}"
 SRCREV_scp    =3D "fd7c83561a7d76c7681d5d017fb23aa3664c028c"
-SRCREV_cmsis  =3D "refs/tags/5.2.0"
+SRCREV_cmsis  =3D "80cc44bba16cb4c8f495b7aa9709d41ac50e9529"
 SRCREV_FORMAT =3D "scp_cmsis"
=20
 require scp-firmware.inc
--=20
2.34.1


