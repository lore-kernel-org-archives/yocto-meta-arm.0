Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.2219.1608313255307817597
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 18 Dec 2020 09:40:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6E261063
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Dec 2020 09:40:54 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 72F8F3F66B
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Dec 2020 09:40:54 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm/edk2-firmware: upgrade platforms to fix VariablePolicyLib errors
Date: Fri, 18 Dec 2020 17:40:31 +0000
Message-Id: <20201218174032.1225473-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201218174032.1225473-1-ross.burton@arm.com>
References: <20201218174032.1225473-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Upgrade to a newer edk2-platforms revision to incorporate the fixes
for the VariablePolicyLib changes in edk2 itself.

Change-Id: I928a59baee9cea4958963ac86f0093521036740b
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware_202011.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202011.bb b/meta-arm=
/recipes-bsp/uefi/edk2-firmware_202011.bb
index 1d47d3e..94310e3 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_202011.bb
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_202011.bb
@@ -1,4 +1,4 @@
 SRCREV_edk2           ?=3D "872f953262d68a11da7bc2fb3ded16df234b8700"
-SRCREV_edk2-platforms ?=3D "46df7b29afeb846ee664e48949f9c8161abf1f2f"
+SRCREV_edk2-platforms ?=3D "3f71a8fb114ae9ce87281eb30ab0e678f6806b05"
=20
 require edk2-firmware.inc
--=20
2.25.1

