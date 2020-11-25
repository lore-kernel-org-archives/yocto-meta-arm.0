Received: from foss.arm.com (foss.arm.com [])
 by mx.groups.io with SMTP id smtpd.web08.6057.1606307504174952646
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 25 Nov 2020 04:31:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: arm.com, ip: <nil>, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78190152F
	for <meta-arm@lists.yoctoproject.org>; Wed, 25 Nov 2020 04:31:45 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B6903F70D
	for <meta-arm@lists.yoctoproject.org>; Wed, 25 Nov 2020 04:31:45 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 6/6] arm/scp-firmware: remove redundant python3native inherit
Date: Wed, 25 Nov 2020 12:31:27 +0000
Message-Id: <20201125123127.3226384-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125123127.3226384-1-ross.burton@arm.com>
References: <20201125123127.3226384-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: I9df71eb6bb99bb4af48b77f50a1056027c8227a4
---
 meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.6.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.6.0.bb b/me=
ta-arm/recipes-bsp/scp-firmware/scp-firmware_2.6.0.bb
index f9510e4..ab31746 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.6.0.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.6.0.bb
@@ -21,7 +21,6 @@ DEPENDS +=3D "virtual/arm-none-eabi-gcc-native"
=20
 SCP_BUILD_STR =3D "${@bb.utils.contains('SCP_BUILD_RELEASE', '1', 'relea=
se', 'debug', d)}"
=20
-inherit python3native
 inherit deploy
=20
 B =3D "${WORKDIR}/build"
--=20
2.25.1

