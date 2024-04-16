Return-Path: <amr.mohamed@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23402C4345F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 13:58:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.21497.1713275922393638684
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Apr 2024 06:58:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: amr.mohamed@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE0EA339;
	Tue, 16 Apr 2024 06:59:08 -0700 (PDT)
Received: from e125330.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C59A83F738;
	Tue, 16 Apr 2024 06:58:39 -0700 (PDT)
From: amr.mohamed@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Amr Mohamed <amrmoh01@e125330.arm.com>,
	Amr Mohamed <amr.mohamed@arm.com>
Subject: [PATCH] arm-systemready/linux-distros: Upgrade the Debian version to 12.4
Date: Tue, 16 Apr 2024 14:58:27 +0100
Message-Id: <20240416135827.3267784-1-amr.mohamed@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 Apr 2024 13:58:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5549

From: Amr Mohamed <amrmoh01@e125330.arm.com>

Upgrade the Debian distribution from version 11.7 to version 12.4 in the =
distribution installation.

Signed-off-by: Amr Mohamed <amr.mohamed@arm.com>
---
 .../arm-systemready-linux-distros-debian.bb                   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-systemready/recipes-test/arm-systemready-linux-dist=
ros/arm-systemready-linux-distros-debian.bb b/meta-arm-systemready/recipe=
s-test/arm-systemready-linux-distros/arm-systemready-linux-distros-debian=
.bb
index 04faa3a9..4b279547 100644
--- a/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros-debian.bb
+++ b/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros-debian.bb
@@ -34,8 +34,8 @@ file://${COMMON_LICENSE_DIR}/OpenSSL;md5=3D4eb1764f3e65=
fafa1a25057f9082f2ae \
 file://${COMMON_LICENSE_DIR}/Sleepycat;md5=3D1cbb64231c94198653282f3ccab=
88ffb \
 "
=20
-PV =3D "11.7.0"
+PV =3D "12.4.0"
 # netinst, DVD-1
 ISO_TYPE =3D "netinst"
 SRC_URI =3D "https://cdimage.debian.org/mirror/cdimage/archive/${PV}/arm=
64/iso-cd/debian-${PV}-arm64-${ISO_TYPE}.iso;unpack=3D0;downloadfilename=3D=
${ISO_IMAGE_NAME}.iso"
-SRC_URI[sha256sum] =3D "174caba674fe3172938439257156b9cb8940bb5fd5ddf124=
256e81ec00ec460d"
+SRC_URI[sha256sum] =3D "d32d2c63350a932dc0d9d45665985b41413f9e01efc0eacb=
ea981d435f553d3d"
--=20
2.25.1


