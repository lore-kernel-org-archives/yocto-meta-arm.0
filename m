Return-Path: <musa.antike@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFE16C02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 13:56:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.21501.1736949382218594047
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 15 Jan 2025 05:56:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: musa.antike@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4AE2912FC
	for <meta-arm@lists.yoctoproject.org>; Wed, 15 Jan 2025 05:56:50 -0800 (PST)
Received: from e132696.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4B23E3F63F
	for <meta-arm@lists.yoctoproject.org>; Wed, 15 Jan 2025 05:56:21 -0800 (PST)
From: Musa Antike <musa.antike@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/5] arm-systemready/linux-distros: Move openSUSE unattended conf to SRC_URI
Date: Wed, 15 Jan 2025 13:56:03 +0000
Message-Id: <20250115135606.3820325-2-musa.antike@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250115135606.3820325-1-musa.antike@arm.com>
References: <20250115135606.3820325-1-musa.antike@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 15 Jan 2025 13:56:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6327

- Replace THISDIR with UNPACKDIR by adding unattended conf to SRC_URI

Signed-off-by: Musa Antike <musa.antike@arm.com>
---
 .../arm-systemready-linux-distros-opensuse.bb            | 9 ++++++---
 .../unattended-boot-conf/openSUSE/autoinst.xml           | 0
 2 files changed, 6 insertions(+), 3 deletions(-)
 rename meta-arm-systemready/recipes-test/arm-systemready-linux-distros/{=
 =3D> files}/unattended-boot-conf/openSUSE/autoinst.xml (100%)

diff --git a/meta-arm-systemready/recipes-test/arm-systemready-linux-dist=
ros/arm-systemready-linux-distros-opensuse.bb b/meta-arm-systemready/reci=
pes-test/arm-systemready-linux-distros/arm-systemready-linux-distros-open=
suse.bb
index 33f20587..ad69c779 100644
--- a/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros-opensuse.bb
+++ b/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros-opensuse.bb
@@ -70,8 +70,11 @@ PV =3D "15.5"
 # possible value of ISO_TYPE: NET, DVD
 ISO_TYPE =3D "DVD"
 BUILD_NO =3D "491.1"
-SRC_URI =3D "https://download.opensuse.org/distribution/leap/${PV}/iso/o=
penSUSE-Leap-${PV}-${ISO_TYPE}-aarch64-Build${BUILD_NO}-Media.iso;unpack=3D=
0;downloadfilename=3D${ISO_IMAGE_NAME}.iso"
-SRC_URI[sha256sum] =3D "456cc4f99b044429d8a89bd302c06e9e382d6ac4dc590139=
a7096ebb54f5357b"
+SRC_URI =3D "\
+    https://download.opensuse.org/distribution/leap/${PV}/iso/openSUSE-L=
eap-${PV}-${ISO_TYPE}-aarch64-Build${BUILD_NO}-Media.iso;unpack=3D0;downl=
oadfilename=3D${ISO_IMAGE_NAME}.iso;name=3Dopensuse_iso_image \
+    file://unattended-boot-conf/openSUSE/autoinst.xml \
+    "
+SRC_URI[opensuse_iso_image.sha256sum] =3D "456cc4f99b044429d8a89bd302c06=
e9e382d6ac4dc590139a7096ebb54f5357b"
=20
 TEST_SUITES =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TESTS", "ar=
m_systemready_opensuse_unattended", "", d)}"
=20
@@ -81,7 +84,7 @@ BOOT_IMAGE =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED_=
INST_TESTS", "EFI/BOOT/boot
 EFI_IMAGE =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TESTS", "boot=
/aarch64/efi", "", d)}"
=20
 modifyiso() {
-    UNATTENDED_CONF_DIR=3D"${THISDIR}/unattended-boot-conf/openSUSE"
+    UNATTENDED_CONF_DIR=3D"${UNPACKDIR}/unattended-boot-conf/openSUSE"
=20
     #create installation configuration files, remove grub timeout, setup=
 network
     cp "${UNATTENDED_CONF_DIR}/autoinst.xml" ${EXTRACTED_ISO_TEMP_DIR}
diff --git a/meta-arm-systemready/recipes-test/arm-systemready-linux-dist=
ros/unattended-boot-conf/openSUSE/autoinst.xml b/meta-arm-systemready/rec=
ipes-test/arm-systemready-linux-distros/files/unattended-boot-conf/openSU=
SE/autoinst.xml
similarity index 100%
rename from meta-arm-systemready/recipes-test/arm-systemready-linux-distr=
os/unattended-boot-conf/openSUSE/autoinst.xml
rename to meta-arm-systemready/recipes-test/arm-systemready-linux-distros=
/files/unattended-boot-conf/openSUSE/autoinst.xml
--=20
2.34.1


