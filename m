Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.9348.1603209655149930062
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Oct 2020 09:00:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B65D41FB
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 Oct 2020 09:00:54 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 58EEE3F66B
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 Oct 2020 09:00:54 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/6] arm/edk2-firmare: use gitsm fetcher
Date: Tue, 20 Oct 2020 17:00:46 +0100
Message-Id: <20201020160049.473237-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201020160049.473237-1-ross.burton@arm.com>
References: <20201020160049.473237-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The EDK2 repository contains a number of submodules and some builds need
them, so use the gitsm fetcher to ensure they're always fetched.

Change-Id: I63cf20900b3fa636f409926222c715b7f6a7bb89
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb b/meta-arm/re=
cipes-bsp/uefi/edk2-firmware_git.bb
index 74924b4..4012f0e 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://edk2/License.txt;md5=3D2b4=
15520383f7964e96700ae12b4570a
 LIC_FILES_CHKSUM +=3D "file://edk2/edk2-platforms/License.txt;md5=3D2b41=
5520383f7964e96700ae12b4570a"
=20
 SRC_URI ?=3D "\
-    git://github.com/tianocore/edk2.git;name=3Dedk2;destsuffix=3D${S}/ed=
k2;nobranch=3D1 \
+    gitsm://github.com/tianocore/edk2.git;name=3Dedk2;destsuffix=3D${S}/=
edk2;nobranch=3D1 \
     git://github.com/tianocore/edk2-platforms.git;name=3Dedk2-platforms;=
destsuffix=3D${S}/edk2/edk2-platforms;nobranch=3D1 \
 "
 SRCREV_edk2           ?=3D "6ff7c838d09224dd4e4c9b5b93152d8db1b19740"
--=20
2.25.1

