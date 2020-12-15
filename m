Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.8718.1608024048157006387
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 15 Dec 2020 01:20:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3C6F101E
	for <meta-arm@lists.yoctoproject.org>; Tue, 15 Dec 2020 01:20:37 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 49C663F66E
	for <meta-arm@lists.yoctoproject.org>; Tue, 15 Dec 2020 01:20:37 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/7] arm/edk2-firmware: add upstream tag regex
Date: Tue, 15 Dec 2020 09:20:26 +0000
Message-Id: <20201215092030.2723188-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201215092030.2723188-1-ross.burton@arm.com>
References: <20201215092030.2723188-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

So that the automatic latest upstream release detection works correctly,
specify what release tags look like.

Change-Id: I1226290c223d18b776efffeccd48d291755d01a1
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb b/meta-arm/re=
cipes-bsp/uefi/edk2-firmware_git.bb
index a594971..58dc1be 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
@@ -24,6 +24,7 @@ PV =3D "202008+git${SRCPV}"
 SRCREV_edk2           ?=3D "06dc822d045c2bb42e497487935485302486e151"
 SRCREV_edk2-platforms ?=3D "7aab81a35aef7b295e73d7d6dfd528cc812790ed"
 SRCREV_FORMAT         =3D "edk2_edk2-platforms"
+UPSTREAM_CHECK_GITTAGREGEX =3D "^edk2-stable(?P<pver>\d+)$"
=20
 EDK2_BUILD_RELEASE   ?=3D "1"
 EDK2_PLATFORM        ?=3D "ArmVirtQemu-AARCH64"
--=20
2.25.1

