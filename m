Return-Path: <ben.cownley@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEFB2C25B10
	for <webhook@archiver.kernel.org>; Fri, 10 May 2024 14:25:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.13975.1715351106530057227
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 10 May 2024 07:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ben.cownley@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55BFF106F;
	Fri, 10 May 2024 07:25:31 -0700 (PDT)
Received: from e125927.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B61263F641;
	Fri, 10 May 2024 07:25:04 -0700 (PDT)
From: ben.cownley@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Emekcan Aras <emekcan.aras@arm.com>,
	Ben Cownley <ben.cownley@arm.com>
Subject: [PATCH 1/2] arm-systemready/linux-distros: Upgrade the openSUSE version to 15.5
Date: Fri, 10 May 2024 15:24:55 +0100
Message-Id: <20240510142456.54323-1-ben.cownley@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 10 May 2024 14:25:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5710

From: Emekcan Aras <emekcan.aras@arm.com>

Upgrade the openSUSE distribution from version 15.4 to version 15.5
as well as the Licenses that now include Apache-1.1, BSL-1.0, IPL-1.0, Sl=
eepycat, and Zlib

Signed-off-by: Ben Cownley <ben.cownley@arm.com>
---
 .../arm-systemready-linux-distros-opensuse.bb               | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm-systemready/recipes-test/arm-systemready-linux-dist=
ros/arm-systemready-linux-distros-opensuse.bb b/meta-arm-systemready/reci=
pes-test/arm-systemready-linux-distros/arm-systemready-linux-distros-open=
suse.bb
index 13e4355d..c731c4a2 100644
--- a/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros-opensuse.bb
+++ b/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros-opensuse.bb
@@ -61,9 +61,9 @@ file://${COMMON_LICENSE_DIR}/W3C;md5=3D4b1d0384b406508a=
63e51f7c69687700 \
=20
 ARM_SYSTEMREADY_LINUX_DISTRO_INSTALL_SIZE =3D "6144"
=20
-PV =3D "15.4"
+PV =3D "15.5"
 # possible value of ISO_TYPE: NET, DVD
 ISO_TYPE =3D "DVD"
-BUILD_NO =3D "243.2"
+BUILD_NO =3D "491.1"
 SRC_URI =3D "https://download.opensuse.org/distribution/leap/${PV}/iso/o=
penSUSE-Leap-${PV}-${ISO_TYPE}-aarch64-Build${BUILD_NO}-Media.iso;unpack=3D=
0;downloadfilename=3D${ISO_IMAGE_NAME}.iso"
-SRC_URI[sha256sum] =3D "d87f79b2b723f9baaeedd9e2be0365c04081e51a4f7f7f08=
c7ab3eee0c3e0fae"
+SRC_URI[sha256sum] =3D "456cc4f99b044429d8a89bd302c06e9e382d6ac4dc590139=
a7096ebb54f5357b"
--=20
2.34.1


