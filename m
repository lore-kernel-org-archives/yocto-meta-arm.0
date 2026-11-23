Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57781.1795451712797996214
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 Nov 2026 08:35:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=vMBdtbZD;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BC39143D
	for <meta-arm@lists.yoctoproject.org>; Mon, 23 Nov 2026 08:35:09 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3050A3F632
	for <meta-arm@lists.yoctoproject.org>; Mon, 23 Nov 2026 08:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795451712; bh=NOGRjcTuL+lzCv2KfiLStJouToywKP8Xzm54GLawurE=;
	h=From:To:Subject:Date:From;
	b=vMBdtbZDzcZpo5exJqPeKbFgAutKbWRxPoJQgmByMHVUWU8gJe0sNYxR6dq2XjKTN
	 p1l83GjVS9gX3jNwvjg398pS2j+mHoJI/HBaQ+dB7LSAkWl7CPfY4elbkaS2iRCqam
	 jBJgNPL6qfMowgXL0Zm+lR/n1RRz92Cxfv39eOI0=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/trusted-firmware-rmm: update to v0.9.0
Date: Mon, 23 Nov 2026 10:35:11 -0600
Message-ID: <20261123163511.14614-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arm@lists.yoctoproject.org>; Mon, 23 Nov 2026 16:35:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7224
Content-Type: text/plain; charset="utf-8"

Update TF-RMM to v0.9.0.

The new version runs gen_app_bin.py during the build. Depend on
python3-pyelftools-native and inherit python3native so the script
uses the native interpreter and can import elftools.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...-firmware-rmm_0.6.0.bb =3D> trusted-firmware-rmm_0.9.0.bb} | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-arm/recipes-bsp/trusted-firmware-rmm/{trusted-firmware-rmm_0=
.6.0.bb =3D> trusted-firmware-rmm_0.9.0.bb} (92%)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-r=
mm_0.6.0.bb b/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-=
rmm_0.9.0.bb
similarity index 92%
rename from meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rm=
m_0.6.0.bb
rename to meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_=
0.9.0.bb
index 55d746196b6f..c0a132c9a4ff 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.6.=
0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.9.=
0.bb
@@ -3,12 +3,14 @@ DESCRIPTION =3D "RMM Firmware for Arm reference platfor=
ms"
 LICENSE =3D "BSD-3-Clause AND MIT"
=20
 SRC_URI =3D "gitsm://git.trustedfirmware.org/TF-RMM/tf-rmm.git;protocol=3D=
https;branch=3Dmain"
-SRCREV =3D "7f6bc132caef3596fbb88d3a419c2a3cb499cde2"
+SRCREV =3D "dd9ec489c09956fa748c847966397fa0aba6b0b2"
 UPSTREAM_CHECK_GITTAGREGEX =3D "^tf-rmm-v(?P<pver>\d+(\.\d+)+)$"
=20
 LIC_FILES_CHKSUM +=3D "file://docs/about/license.rst;md5=3D1375c7c641558=
198ffe401c2a799d79b"
=20
-inherit deploy cmake
+inherit deploy cmake python3native
+
+DEPENDS +=3D "python3-pyelftools-native"
=20
 RMM_CONFIG ?=3D ""
 RMM_CONFIG:qemuarm64 =3D "qemu_virt_defcfg"
--=20
2.54.0 (Apple Git-157)

