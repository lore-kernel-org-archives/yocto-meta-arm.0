Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D81C001B0
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 13:09:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.38984.1688994560406769088
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 Jul 2023 06:09:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BFBDD75;
	Mon, 10 Jul 2023 06:10:02 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9AB293F67D;
	Mon, 10 Jul 2023 06:09:19 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/5] arm-bsp/scp-firmware: remove redundant SCP_PLATFORM
Date: Mon, 10 Jul 2023 14:09:13 +0100
Message-Id: <20230710130916.3414041-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230710130916.3414041-1-ross.burton@arm.com>
References: <20230710130916.3414041-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 10 Jul 2023 13:09:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4872

From: Ross Burton <ross.burton@arm.com>

Now that this defaults to MACHINE, explicit SCP_PLATFORM assignments can
be removed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-juno.inc  | 1 -
 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc | 5 ++---
 .../recipes-bsp/scp-firmware/scp-firmware-sgi575.inc         | 5 ++---
 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc    | 1 -
 4 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-juno.inc =
b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-juno.inc
index f78c94b4..1f02d8e5 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-juno.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-juno.inc
@@ -2,7 +2,6 @@
=20
 COMPATIBLE_MACHINE =3D "juno"
=20
-SCP_PLATFORM =3D "juno"
 FW_TARGETS =3D "scp"
 FW_INSTALL:append =3D " romfw_bypass"
=20
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc=
 b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
index 811537aa..c89b132c 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
@@ -1,10 +1,9 @@
 # N1SDP specific SCP configurations and build instructions
=20
-SCP_PLATFORM  =3D "n1sdp"
-SCP_LOG_LEVEL =3D "INFO"
-
 COMPATIBLE_MACHINE:n1sdp =3D "n1sdp"
=20
+SCP_LOG_LEVEL =3D "INFO"
+
 DEPENDS +=3D "fiptool-native"
 DEPENDS +=3D "trusted-firmware-a"
 DEPENDS +=3D "n1sdp-board-firmware"
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-sgi575.in=
c b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-sgi575.inc
index e1b0a854..3413822a 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-sgi575.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-sgi575.inc
@@ -1,6 +1,5 @@
 # SGI575 specific SCP configurations and build instructions
=20
-SCP_PLATFORM  =3D "sgi575"
-SCP_LOG_LEVEL =3D "INFO"
-
 COMPATIBLE_MACHINE:sgi575 =3D "sgi575"
+
+SCP_LOG_LEVEL =3D "INFO"
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc b/=
meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc
index 3cbadad8..2c656357 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc
@@ -2,5 +2,4 @@
=20
 COMPATIBLE_MACHINE =3D "(tc1)"
=20
-SCP_PLATFORM:tc1 =3D "tc1"
 FW_TARGETS =3D "scp"
--=20
2.34.1


