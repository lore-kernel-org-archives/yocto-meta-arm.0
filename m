Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AEC0C4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 08:24:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10274.1714465466620439040
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 01:24:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: adam.johnston@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6BAA2F4;
	Tue, 30 Apr 2024 01:24:52 -0700 (PDT)
Received: from e114993.cambridge.arm.com (e114993.cambridge.arm.com [10.1.198.34])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A19393F793;
	Tue, 30 Apr 2024 01:24:25 -0700 (PDT)
From: adam.johnston@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Adam Johnston <adam.johnston@arm.com>
Subject: [PATCH 1/1] arm-bsp/n1sdp: Use git clone to fetch FW for the N1SDP
Date: Tue, 30 Apr 2024 09:24:13 +0100
Message-Id: <20240430082413.1131081-2-adam.johnston@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240430082413.1131081-1-adam.johnston@arm.com>
References: <20240430082413.1131081-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 08:24:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5639

From: Adam Johnston <adam.johnston@arm.com>

git.linaro.org/landing-teams/working no longer seems to serve snapshots
in tar.gz format, breaking the N1SDP build for kirkstone.

Using same tag as the existing snapshot, fetch the binaries with a
conventional git clone, as per master.

Signed-off-by: Adam Johnston <adam.johnston@arm.com>
---
 .../recipes-bsp/images/n1sdp-board-firmware_2020.07.27.bb  | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2020.07=
.27.bb b/meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2020.07.27.=
bb
index 228ed927..2295b772 100644
--- a/meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2020.07.27.bb
+++ b/meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2020.07.27.bb
@@ -11,10 +11,11 @@ INHIBIT_DEFAULT_DEPS =3D "1"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE =3D "n1sdp"
=20
-SRC_URI =3D "https://git.linaro.org/landing-teams/working/arm/n1sdp-boar=
d-firmware.git/snapshot/${BPN}-N1SDP-${PV}.tar.gz"
-SRC_URI[sha256sum] =3D "57feba404026f2d6d49c167d63e0e84653ad8b808b13e224=
4b81fea9e0d58d66"
+SRC_URI =3D "git://git.linaro.org/landing-teams/working/arm/n1sdp-board-=
firmware.git;protocol=3Dhttps;branch=3Dmaster"
=20
-S =3D "${WORKDIR}/${BPN}-N1SDP-${PV}"
+SRCREV  =3D "9a095cbdf8ef59a7433e2769e4e2e92782b68c50"
+
+S =3D "${WORKDIR}/git"
=20
 INSTALL_DIR =3D "/n1sdp-board-firmware_source"
=20

