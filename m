Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10221.1603704737897070421
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 02:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 963361FB
	for <meta-arm@lists.yoctoproject.org>; Mon, 26 Oct 2020 02:32:17 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 429113F719
	for <meta-arm@lists.yoctoproject.org>; Mon, 26 Oct 2020 02:32:17 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/8] arm/edk2-firmware: upgrade to latest release
Date: Mon, 26 Oct 2020 09:32:09 +0000
Message-Id: <20201026093212.1532587-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026093212.1532587-1-ross.burton@arm.com>
References: <20201026093212.1532587-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Bump the default SRCREVs to the latest release (for edk2) and a
corresponding working commit (edk2-platforms).  Typically platforms will
pin to known good releases but at least the defaults can be up to date.

Change-Id: I58b436416e3f2e30501126a39f1f0621b3fb9602
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb b/meta-arm/re=
cipes-bsp/uefi/edk2-firmware_git.bb
index d6f6af1..93c40e8 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
@@ -20,8 +20,9 @@ SRC_URI =3D "\
     ${EDK2_PLATFORMS_SRC_URI};name=3Dedk2-platforms;destsuffix=3Dedk2/ed=
k2-platforms;nobranch=3D1 \
 "
=20
-SRCREV_edk2           ?=3D "6ff7c838d09224dd4e4c9b5b93152d8db1b19740"
-SRCREV_edk2-platforms ?=3D "ed4cc8059ec551032f0d8b8c172e9ec19214a638"
+PV =3D "202008+git${SRCPV}"
+SRCREV_edk2           ?=3D "06dc822d045c2bb42e497487935485302486e151"
+SRCREV_edk2-platforms ?=3D "7aab81a35aef7b295e73d7d6dfd528cc812790ed"
 SRCREV_FORMAT         =3D "edk2_edk2-platforms"
=20
 EDK2_BUILD_RELEASE   ?=3D "0"
--=20
2.25.1

