Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.5171.1617269367511843868
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 01 Apr 2021 02:29:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E10DF31B
	for <meta-arm@lists.yoctoproject.org>; Thu,  1 Apr 2021 02:29:25 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 87F013F719
	for <meta-arm@lists.yoctoproject.org>; Thu,  1 Apr 2021 02:29:25 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/sbsa-acs: add SBSA Architecture Compliance Suite
Date: Thu,  1 Apr 2021 10:29:22 +0100
Message-Id: <20210401092922.2585351-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add a recipe for SBSA Architecture Compliance Suite, a test suite for
SBSA.

As this is implemented as a module for the EDK2 Shell application, this
can include the edk2-firmware recipe to do the heavy lifting.

Change-Id: I890ea41d7d1068d74a541c06411aad894728f44d
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../sbsa-acs/sbsa-acs/shell.patch             | 26 +++++++++++++++++++
 .../recipes-test/sbsa-acs/sbsa-acs_3.0.bb     | 25 ++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta-arm/recipes-test/sbsa-acs/sbsa-acs/shell.patch
 create mode 100644 meta-arm/recipes-test/sbsa-acs/sbsa-acs_3.0.bb

diff --git a/meta-arm/recipes-test/sbsa-acs/sbsa-acs/shell.patch b/meta-arm=
/recipes-test/sbsa-acs/sbsa-acs/shell.patch
new file mode 100644
index 0000000..0cbbb47
--- /dev/null
+++ b/meta-arm/recipes-test/sbsa-acs/sbsa-acs/shell.patch
@@ -0,0 +1,26 @@
+Patch in the paths to the SBSA test suite
+
+Upstream-Status: Inappropriate (required action)
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/ShellPkg/ShellPkg.dsc b/ShellPkg/ShellPkg.dsc
+index c42bc9464a..ea21f07a31 100644
+--- a/ShellPkg/ShellPkg.dsc
++++ b/ShellPkg/ShellPkg.dsc
+@@ -20,6 +20,8 @@
+   SKUID_IDENTIFIER               =3D DEFAULT=0D
+ =0D
+ [LibraryClasses.common]=0D
++  SbsaValLib|ShellPkg/Application/sbsa-acs/val/SbsaValLib.inf=0D
++  SbsaPalLib|ShellPkg/Application/sbsa-acs/platform/pal_uefi/SbsaPalLib.i=
nf=0D
+   UefiApplicationEntryPoint|MdePkg/Library/UefiApplicationEntryPoint/Uefi=
ApplicationEntryPoint.inf=0D
+   UefiDriverEntryPoint|MdePkg/Library/UefiDriverEntryPoint/UefiDriverEntr=
yPoint.inf=0D
+   UefiBootServicesTableLib|MdePkg/Library/UefiBootServicesTableLib/UefiBo=
otServicesTableLib.inf=0D
+@@ -83,6 +85,7 @@
+   # Build all the libraries when building this package.=0D
+   # This helps developers test changes and how they affect the package.=0D
+   #=0D
++  ShellPkg/Application/sbsa-acs/uefi_app/SbsaAvs.inf =0D
+   ShellPkg/Library/UefiShellLib/UefiShellLib.inf=0D
+   ShellPkg/Library/UefiShellAcpiViewCommandLib/UefiShellAcpiViewCommandLi=
b.inf=0D
+   ShellPkg/Library/UefiShellCommandLib/UefiShellCommandLib.inf=0D
diff --git a/meta-arm/recipes-test/sbsa-acs/sbsa-acs_3.0.bb b/meta-arm/reci=
pes-test/sbsa-acs/sbsa-acs_3.0.bb
new file mode 100644
index 0000000..9601f24
--- /dev/null
+++ b/meta-arm/recipes-test/sbsa-acs/sbsa-acs_3.0.bb
@@ -0,0 +1,25 @@
+require recipes-bsp/uefi/edk2-firmware_202011.bb
+
+PROVIDES_remove =3D "virtual/uefi-firmware"
+
+LICENSE +=3D "& Apache-2.0"
+LIC_FILES_CHKSUM +=3D "file://ShellPkg/Application/sbsa-acs/LICENSE.md;md5=
=3D2a944942e1496af1886903d274dedb13"
+
+SRC_URI +=3D "git://github.com/ARM-software/sbsa-acs;destsuffix=3Dedk2/She=
llPkg/Application/sbsa-acs;protocol=3Dhttps;branch=3Drelease;name=3Dacs \
+            git://github.com/tianocore/edk2-libc;destsuffix=3Dedk2/edk2-li=
bc;protocol=3Dhttps;branch=3Dmaster;name=3Dlibc \
+            file://shell.patch"
+
+SRCREV_acs =3D "1b3a37214fe6809e07e471f79d1ef856461bc803"
+SRCREV_libc =3D "61687168fe02ac4d933a36c9145fdd242ac424d1"
+
+EDK2_ARCH =3D "AARCH64"
+EDK2_PLATFORM =3D "Shell"
+EDK2_PLATFORM_DSC =3D "ShellPkg/ShellPkg.dsc"
+EDK2_EXTRA_BUILD =3D "--module ShellPkg/Application/sbsa-acs/uefi_app/Sbsa=
Avs.inf"
+
+PACKAGES_PATH .=3D ":${S}/edk2-libc"
+
+do_install() {
+    install -d ${D}/firmware
+    install ${B}/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${EDK_COMPILER}=
/*/Sbsa.efi ${D}/firmware/
+}
--=20
2.25.1

