Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6611.1605775528798898358
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Nov 2020 00:45:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CE1B139F
	for <meta-arm@lists.yoctoproject.org>; Thu, 19 Nov 2020 00:45:28 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1911E3F719
	for <meta-arm@lists.yoctoproject.org>; Thu, 19 Nov 2020 00:45:27 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/4] arm-bsp/fvp-common: explicitly select trusted-firmware-a 2.3
Date: Thu, 19 Nov 2020 08:45:18 +0000
Message-Id: <20201119084520.2718787-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201119084520.2718787-1-ross.burton@arm.com>
References: <20201119084520.2718787-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

These BSPs don't select a version of trusted-firmware-a, for clarity and
allow smooth upgrades explictly select 2.3.

Change-Id: Ieea7d075d709e2006ebf217d802f3eeecfb9a281
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-common.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-bsp/conf/machine/fvp-common.inc b/meta-arm-bsp/conf=
/machine/fvp-common.inc
index ad08c0e..841760e 100644
--- a/meta-arm-bsp/conf/machine/fvp-common.inc
+++ b/meta-arm-bsp/conf/machine/fvp-common.inc
@@ -32,6 +32,7 @@ PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?=3D "5.4%"
=20
 PREFERRED_VERSION_u-boot ?=3D "2020.07"
+PREFERRED_VERSION_trusted-firmware-a ?=3D "2.3%"
=20
 EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a u-boot"
=20
--=20
2.25.1

