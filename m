Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.10379.1603704737054440210
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 02:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6611F1FB
	for <meta-arm@lists.yoctoproject.org>; Mon, 26 Oct 2020 02:32:15 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1080D3F719
	for <meta-arm@lists.yoctoproject.org>; Mon, 26 Oct 2020 02:32:14 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/8] arm/edk2-firmware: add variables to ease SRC_URI changes
Date: Mon, 26 Oct 2020 09:32:05 +0000
Message-Id: <20201026093212.1532587-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Some platforms may want to switch the edk2 or edk2-platform SRC_URI to
for example the landing-teams staging repository.  Add variables for the
base URLs so this can be done surgically.

Change-Id: I32612d164f77f9e63e8498c129b512c353b04eaa
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb b/meta-arm/re=
cipes-bsp/uefi/edk2-firmware_git.bb
index 39a041f..f3fb491 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
@@ -11,10 +11,15 @@ LIC_FILES_CHKSUM =3D "file://License.txt;md5=3D2b4155=
20383f7964e96700ae12b4570a"
 # EDK2 Platforms
 LIC_FILES_CHKSUM +=3D "file://edk2-platforms/License.txt;md5=3D2b4155203=
83f7964e96700ae12b4570a"
=20
+# These can be overridden as needed
+EDK2_SRC_URI =3D "gitsm://github.com/tianocore/edk2.git"
+EDK2_PLATFORMS_SRC_URI =3D "git://github.com/tianocore/edk2-platforms.gi=
t"
+
 SRC_URI =3D "\
-    gitsm://github.com/tianocore/edk2.git;name=3Dedk2;destsuffix=3Dedk2;=
nobranch=3D1 \
-    git://github.com/tianocore/edk2-platforms.git;name=3Dedk2-platforms;=
destsuffix=3Dedk2/edk2-platforms;nobranch=3D1 \
+    ${EDK2_SRC_URI};name=3Dedk2;destsuffix=3Dedk2;nobranch=3D1 \
+    ${EDK2_PLATFORMS_SRC_URI};name=3Dedk2-platforms;destsuffix=3Dedk2/ed=
k2-platforms;nobranch=3D1 \
 "
+
 SRCREV_edk2           ?=3D "6ff7c838d09224dd4e4c9b5b93152d8db1b19740"
 SRCREV_edk2-platforms ?=3D "ed4cc8059ec551032f0d8b8c172e9ec19214a638"
 SRCREV_FORMAT         =3D "edk2_edk2-platforms"
--=20
2.25.1

