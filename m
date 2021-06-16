Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.7953.1623852809166605795
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 16 Jun 2021 07:13:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 808451042
	for <meta-arm@lists.yoctoproject.org>; Wed, 16 Jun 2021 07:13:28 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2AEA53F719
	for <meta-arm@lists.yoctoproject.org>; Wed, 16 Jun 2021 07:13:28 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm/trusted-firmware-a: disable -Werror
Date: Wed, 16 Jun 2021 15:13:24 +0100
Message-Id: <20210616141324.346056-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616141324.346056-1-ross.burton@arm.com>
References: <20210616141324.346056-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

-Werror is typically a bad idea in distribution builds, as changes to
the compiler or other libraries can cause new warnings to appear.

For example, when building the N1SDP platform:

  error: "GIC-600 Multichip driver is currently experimental and the API
          may change in future." [-Werror,-W#warnings]

Set E=3D0 so that -Werror is not used in the build.

Change-Id: I8905fc9d4e95edb42970fe3839b9ab6b5384a123
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index a3de645..57f1438 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -100,7 +100,8 @@ EXTRA_OEMAKE +=3D "LD=3D${@remove_options_tail(d.getV=
ar('LD'))}"
=20
 EXTRA_OEMAKE +=3D "CC=3D${@remove_options_tail(d.getVar('CC'))}"
=20
-EXTRA_OEMAKE +=3D "V=3D1"
+# Verbose builds, no -Werror
+EXTRA_OEMAKE +=3D "V=3D1 E=3D0"
=20
 # Add platform parameter
 EXTRA_OEMAKE +=3D "BUILD_BASE=3D${B} PLAT=3D${TFA_PLATFORM}"
--=20
2.25.1

