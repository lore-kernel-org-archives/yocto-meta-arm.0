Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.9346.1603209654594536974
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Oct 2020 09:00:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20342D6E
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 Oct 2020 09:00:54 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B740C3F66B
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 Oct 2020 09:00:53 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/6] arm/edk2-firware: don't handle obsolete GCC releases
Date: Tue, 20 Oct 2020 17:00:45 +0100
Message-Id: <20201020160049.473237-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201020160049.473237-1-ross.burton@arm.com>
References: <20201020160049.473237-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

There's no point in handling GCC cross compilers that are before version =
5, as
GCC 5 came out in 2017 and is obsolete now.

Change-Id: I650ee44c433f70004d20c0219310ddbd4028addb
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb b/meta-arm/re=
cipes-bsp/uefi/edk2-firmware_git.bb
index ee8f523..74924b4 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
@@ -52,17 +52,7 @@ export CONF_PATH           =3D "${WORKSPACE}/Conf"
=20
 export BTOOLS_PATH =3D "${EDK_TOOLS_PATH}/BinWrappers/PosixLike"
=20
-python __anonymous() {
-    # If GCC Version is greater than 4 then pass GCC5
-    # set GCC5 by default
-    d.setVar('GCC_VER', 'GCC5')
-
-    # Otherwise pass the corresponding version
-    G =3D d.getVar('GCCVERSION',True).split(".")
-    gcc_vlist =3D ['1', '2', '3', '4']
-    if G[0] in gcc_vlist:
-        d.setVar('GCC_VER', 'GCC'+G[0])
-}
+GCC_VER ?=3D "GCC5"
=20
 do_compile() {
     sed -i -e 's:-I \.\.:-I \.\. ${BUILD_CFLAGS} :' ${EDK_TOOLS_PATH}/So=
urce/C/Makefiles/header.makefile
--=20
2.25.1

