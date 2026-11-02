Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14543.1793632030615627021
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 02 Nov 2026 07:07:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=foss header.b=nmoehxns;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECBE31595
	for <meta-arm@lists.yoctoproject.org>; Mon,  2 Nov 2026 07:07:06 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E465C3F673
	for <meta-arm@lists.yoctoproject.org>; Mon,  2 Nov 2026 07:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793632030; bh=iMzamC6EacBgzaY7NS0mfSVPKdyEUVQN/j6/uzAO4yM=;
	h=From:To:Subject:Date:From;
	b=nmoehxnsJ8FDGjGO6ExQJZpXXTnIq4OFN2TqHHIuKjTFgi0zY5aL9NFLi0RFvSuoB
	 ucx6sEo0LTogO7t0r1PFrDUuUktQgGXQTAaK7M/8cPZkicfBrUTJULFXwHSB30d9c3
	 QSBd6q/whW3ZoYIIq6d0Sb7fgUTtBSP8KM1zU+CU=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/edk2-firmware: fix ICMP error handling vulnerabilities
Date: Mon,  2 Nov 2026 10:07:08 -0500
Message-ID: <20261102150708.9686-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arm@lists.yoctoproject.org>; Mon, 02 Nov 2026 15:07:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7200
Content-Type: text/plain; charset="utf-8"

Backport two upstream EDK2 fixes to address security issues in the
IPv4 and IPv6 ICMP error handlers.

CVE-2026-97631 fixes incorrect buffer copy logic that could allow
oversized ICMP error packets to write beyond the allocated buffer,
potentially causing memory corruption. Add proper boundary checks
and correct buffer offset calculations to safely truncate packets
that exceed the available buffer space.

The second fix initializes the ICMP error buffer before copying
received fragments, preventing short packets from leaving stale
data from previous errors in the buffer.

These fixes have been merged upstream as commits
560ed9b5b146ed622d7eb7c40254a9099bd65b84 and
fa789071ff0b29f1e568bfe153ef7f3d76bd60e4.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...-fix-SmbiosType2Genertor-build-failu.patch |   5 +-
 ...xeBcDxe-Fix-ICMP-buffer-overflow-in-.patch | 127 ++++++++++++++++++
 ...xeBcDxe-Clear-ICMP-error-buffer-befo.patch |  38 ++++++
 .../recipes-bsp/uefi/edk2-firmware_202608.bb  |   6 +-
 4 files changed, 171 insertions(+), 5 deletions(-)
 create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware/0002-NetworkPkg=
-UefiPxeBcDxe-Fix-ICMP-buffer-overflow-in-.patch
 create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware/0003-NetworkPkg=
-UefiPxeBcDxe-Clear-ICMP-error-buffer-befo.patch

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware/0001-DynamicTablesPkg-=
fix-SmbiosType2Genertor-build-failu.patch b/meta-arm/recipes-bsp/uefi/edk2-=
firmware/0001-DynamicTablesPkg-fix-SmbiosType2Genertor-build-failu.patch
index 0352beac6565..c2f1a3aca014 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware/0001-DynamicTablesPkg-fix-Smb=
iosType2Genertor-build-failu.patch
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware/0001-DynamicTablesPkg-fix-Smb=
iosType2Genertor-build-failu.patch
@@ -1,4 +1,4 @@
-From 7d2f6b6e31fad2c96c6fc55c17e79f8c96b4bfcf Mon Sep 17 00:00:00 2001
+From 0debd3a1f4b5abf0c75c26ec1e85d9fa33510c89 Mon Sep 17 00:00:00 2001
 From: Yeoreum Yun <yeoreum.yun@arm.com>
 Date: Mon, 10 Aug 2026 15:40:06 +0100
 Subject: [PATCH] DynamicTablesPkg: fix SmbiosType2Genertor build failure w=
ith
@@ -36,6 +36,3 @@ index 1250ef8059e9..5345d2b6d233 100644
    {=0D
      DEBUG ((DEBUG_ERROR, "%a: Invalid Baseboard object list\n", __func__)=
);=0D
      return EFI_INVALID_PARAMETER;=0D
---=20
-2.39.5
-
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware/0002-NetworkPkg-UefiPx=
eBcDxe-Fix-ICMP-buffer-overflow-in-.patch b/meta-arm/recipes-bsp/uefi/edk2-=
firmware/0002-NetworkPkg-UefiPxeBcDxe-Fix-ICMP-buffer-overflow-in-.patch
new file mode 100644
index 000000000000..54c1da7b0c34
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware/0002-NetworkPkg-UefiPxeBcDxe-=
Fix-ICMP-buffer-overflow-in-.patch
@@ -0,0 +1,127 @@
+From 1c89a7982247eb994956140caf794f4f40e85de9 Mon Sep 17 00:00:00 2001
+From: santhoshkumarv <santhoshkumarv@ami.com>
+Date: Mon, 28 Sep 2026 06:06:24 -0700
+Subject: [PATCH] NetworkPkg/UefiPxeBcDxe: Fix ICMP buffer overflow in
+ IPv4/IPv6 handlers (CVE-2026-97631)
+
+Root Cause:
+Incorrect buffer copy logic in ICMP error handling allowed large packets
+to write beyond the allocated buffer. This could overwrite adjacent memory
+with attacker-controlled data, causing memory corruption.
+
+Resolution:
+Added proper boundary checks and corrected buffer offset calculations
+in IPv4 and IPv6 ICMP error handlers. Over sized ICMP error packets are now
+safely truncated when the buffer is full, preventing memory corruption.
+
+Signed-off-by: santhoshkumarV <santhoshkumarv@ami.com>
+
+Upstream-Status: Backport [560ed9b5b146ed622d7eb7c40254a9099bd65b84]
+CVE: CVE-2026-97631
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+---
+ NetworkPkg/UefiPxeBcDxe/PxeBcSupport.c | 68 ++++++++++----------------
+ 1 file changed, 26 insertions(+), 42 deletions(-)
+
+diff --git a/NetworkPkg/UefiPxeBcDxe/PxeBcSupport.c b/NetworkPkg/UefiPxeBc=
Dxe/PxeBcSupport.c
+index 887ea3e7d7d8..9e97ba4904c7 100644
+--- a/NetworkPkg/UefiPxeBcDxe/PxeBcSupport.c
++++ b/NetworkPkg/UefiPxeBcDxe/PxeBcSupport.c
+@@ -252,6 +252,7 @@ PxeBcIcmpErrorDpcHandle (
+   UINTN                   Index;=0D
+   UINT32                  CopiedLen;=0D
+   UINT8                   *IcmpError;=0D
++  UINT32                  FragmentLen;=0D
+ =0D
+   Private =3D (PXEBC_PRIVATE_DATA *)Context;=0D
+   Mode    =3D &Private->Mode;=0D
+@@ -317,28 +318,19 @@ PxeBcIcmpErrorDpcHandle (
+   }=0D
+ =0D
+   //=0D
+-  // Copy the right ICMP error message into mode data.=0D
++  // Copy ICMP error fragments into Mode->IcmpError in order. The maximum=
=0D
++  // buffer size is sizeof (EFI_PXE_BASE_CODE_ICMP_ERROR); truncate any e=
xcess.=0D
+   //=0D
+-  CopiedLen =3D 0;=0D
+-  IcmpError =3D (UINT8 *)&Mode->IcmpError;=0D
+-=0D
+-  for (Index =3D 0; Index < RxData->FragmentCount; Index++) {=0D
+-    CopiedLen +=3D RxData->FragmentTable[Index].FragmentLength;=0D
+-    if (CopiedLen <=3D sizeof (EFI_PXE_BASE_CODE_ICMP_ERROR)) {=0D
+-      CopyMem (=0D
+-        IcmpError,=0D
+-        RxData->FragmentTable[Index].FragmentBuffer,=0D
+-        RxData->FragmentTable[Index].FragmentLength=0D
+-        );=0D
+-    } else {=0D
+-      CopyMem (=0D
+-        IcmpError,=0D
+-        RxData->FragmentTable[Index].FragmentBuffer,=0D
+-        CopiedLen - sizeof (EFI_PXE_BASE_CODE_ICMP_ERROR)=0D
+-        );=0D
+-    }=0D
+-=0D
+-    IcmpError +=3D CopiedLen;=0D
++  for (Index =3D 0, IcmpError =3D (UINT8 *)&Mode->IcmpError, CopiedLen =
=3D 0;=0D
++       (Index < RxData->FragmentCount) &&=0D
++       (CopiedLen < sizeof (EFI_PXE_BASE_CODE_ICMP_ERROR));=0D
++       Index++, IcmpError +=3D FragmentLen, CopiedLen +=3D FragmentLen)=0D
++  {=0D
++    FragmentLen =3D MIN (=0D
++                    RxData->FragmentTable[Index].FragmentLength,=0D
++                    (UINT32)(sizeof (EFI_PXE_BASE_CODE_ICMP_ERROR) - Copi=
edLen)=0D
++                    );=0D
++    CopyMem (IcmpError, RxData->FragmentTable[Index].FragmentBuffer, Frag=
mentLen);=0D
+   }=0D
+ =0D
+ ON_RECYCLE:=0D
+@@ -387,6 +379,7 @@ PxeBcIcmp6ErrorDpcHandle (
+   UINT8                   Type;=0D
+   UINT32                  CopiedLen;=0D
+   UINT8                   *Icmp6Error;=0D
++  UINT32                  FragmentLen;=0D
+ =0D
+   Private =3D (PXEBC_PRIVATE_DATA *)Context;=0D
+   Mode    =3D &Private->Mode;=0D
+@@ -449,28 +442,19 @@ PxeBcIcmp6ErrorDpcHandle (
+   }=0D
+ =0D
+   //=0D
+-  // Copy the right ICMP6 error message into mode data.=0D
++  // Copy ICMP error fragments into Mode->IcmpError in order. The maximum=
=0D
++  // buffer size is sizeof (EFI_PXE_BASE_CODE_ICMP_ERROR); truncate any e=
xcess.=0D
+   //=0D
+-  CopiedLen  =3D 0;=0D
+-  Icmp6Error =3D (UINT8 *)&Mode->IcmpError;=0D
+-=0D
+-  for (Index =3D 0; Index < RxData->FragmentCount; Index++) {=0D
+-    CopiedLen +=3D RxData->FragmentTable[Index].FragmentLength;=0D
+-    if (CopiedLen <=3D sizeof (EFI_PXE_BASE_CODE_ICMP_ERROR)) {=0D
+-      CopyMem (=0D
+-        Icmp6Error,=0D
+-        RxData->FragmentTable[Index].FragmentBuffer,=0D
+-        RxData->FragmentTable[Index].FragmentLength=0D
+-        );=0D
+-    } else {=0D
+-      CopyMem (=0D
+-        Icmp6Error,=0D
+-        RxData->FragmentTable[Index].FragmentBuffer,=0D
+-        CopiedLen - sizeof (EFI_PXE_BASE_CODE_ICMP_ERROR)=0D
+-        );=0D
+-    }=0D
+-=0D
+-    Icmp6Error +=3D CopiedLen;=0D
++  for (Index =3D 0, Icmp6Error =3D (UINT8 *)&Mode->IcmpError, CopiedLen =
=3D 0;=0D
++       (Index < RxData->FragmentCount) &&=0D
++       (CopiedLen < sizeof (EFI_PXE_BASE_CODE_ICMP_ERROR));=0D
++       Index++, Icmp6Error +=3D FragmentLen, CopiedLen +=3D FragmentLen)=
=0D
++  {=0D
++    FragmentLen =3D MIN (=0D
++                    RxData->FragmentTable[Index].FragmentLength,=0D
++                    (UINT32)(sizeof (EFI_PXE_BASE_CODE_ICMP_ERROR) - Copi=
edLen)=0D
++                    );=0D
++    CopyMem (Icmp6Error, RxData->FragmentTable[Index].FragmentBuffer, Fra=
gmentLen);=0D
+   }=0D
+ =0D
+ ON_RECYCLE:=0D
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware/0003-NetworkPkg-UefiPx=
eBcDxe-Clear-ICMP-error-buffer-befo.patch b/meta-arm/recipes-bsp/uefi/edk2-=
firmware/0003-NetworkPkg-UefiPxeBcDxe-Clear-ICMP-error-buffer-befo.patch
new file mode 100644
index 000000000000..f0d07bc59719
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware/0003-NetworkPkg-UefiPxeBcDxe-=
Clear-ICMP-error-buffer-befo.patch
@@ -0,0 +1,38 @@
+From bff45da697fecf64927fbc38eacfcf41f20b763b Mon Sep 17 00:00:00 2001
+From: Michael D Kinney <michael.d.kinney@intel.com>
+Date: Wed, 14 Oct 2026 12:34:35 -0700
+Subject: [PATCH] NetworkPkg/UefiPxeBcDxe: Clear ICMP error buffer before
+ copying
+
+Zero the ICMP error buffer before copying fragments so short packets do not
+leave stale bytes from a previous error.
+
+Signed-off-by: Michael D Kinney <michael.d.kinney@intel.com>
+
+Upstream-Status: Backport [fa789071ff0b29f1e568bfe153ef7f3d76bd60e4]
+CVE: CVE-2026-97631
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+---
+ NetworkPkg/UefiPxeBcDxe/PxeBcSupport.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/NetworkPkg/UefiPxeBcDxe/PxeBcSupport.c b/NetworkPkg/UefiPxeBc=
Dxe/PxeBcSupport.c
+index 9e97ba4904c7..7795e4f187d2 100644
+--- a/NetworkPkg/UefiPxeBcDxe/PxeBcSupport.c
++++ b/NetworkPkg/UefiPxeBcDxe/PxeBcSupport.c
+@@ -321,6 +321,7 @@ PxeBcIcmpErrorDpcHandle (
+   // Copy ICMP error fragments into Mode->IcmpError in order. The maximum=
=0D
+   // buffer size is sizeof (EFI_PXE_BASE_CODE_ICMP_ERROR); truncate any e=
xcess.=0D
+   //=0D
++  ZeroMem (&Mode->IcmpError, sizeof (EFI_PXE_BASE_CODE_ICMP_ERROR));=0D
+   for (Index =3D 0, IcmpError =3D (UINT8 *)&Mode->IcmpError, CopiedLen =
=3D 0;=0D
+        (Index < RxData->FragmentCount) &&=0D
+        (CopiedLen < sizeof (EFI_PXE_BASE_CODE_ICMP_ERROR));=0D
+@@ -445,6 +446,7 @@ PxeBcIcmp6ErrorDpcHandle (
+   // Copy ICMP error fragments into Mode->IcmpError in order. The maximum=
=0D
+   // buffer size is sizeof (EFI_PXE_BASE_CODE_ICMP_ERROR); truncate any e=
xcess.=0D
+   //=0D
++  ZeroMem (&Mode->IcmpError, sizeof (EFI_PXE_BASE_CODE_ICMP_ERROR));=0D
+   for (Index =3D 0, Icmp6Error =3D (UINT8 *)&Mode->IcmpError, CopiedLen =
=3D 0;=0D
+        (Index < RxData->FragmentCount) &&=0D
+        (CopiedLen < sizeof (EFI_PXE_BASE_CODE_ICMP_ERROR));=0D
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202608.bb b/meta-arm/r=
ecipes-bsp/uefi/edk2-firmware_202608.bb
index 5008fcca467b..5411e7b186ec 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_202608.bb
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_202608.bb
@@ -4,4 +4,8 @@ SRCREV_edk2           ?=3D "2970e5699ba6267f3384ffab20f9664=
7578aebc8"
 SRCREV_edk2-platforms ?=3D "c98cdf8de9bd84a3267623e64f4388e21de69512"
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
-SRC_URI +=3D "file://0001-DynamicTablesPkg-fix-SmbiosType2Genertor-build-f=
ailu.patch"
+SRC_URI +=3D " \
+        file://0001-DynamicTablesPkg-fix-SmbiosType2Genertor-build-failu.p=
atch \
+        file://0002-NetworkPkg-UefiPxeBcDxe-Fix-ICMP-buffer-overflow-in-.p=
atch \
+        file://0003-NetworkPkg-UefiPxeBcDxe-Clear-ICMP-error-buffer-befo.p=
atch \
+       "
--=20
2.54.0 (Apple Git-157)

