Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.6057.1606307504174952646
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 25 Nov 2020 04:31:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C43F431B
	for <meta-arm@lists.yoctoproject.org>; Wed, 25 Nov 2020 04:31:43 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 676FE3F70D
	for <meta-arm@lists.yoctoproject.org>; Wed, 25 Nov 2020 04:31:43 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/6] arm-bsp/scp-firmware: add version to wildcard bbappend
Date: Wed, 25 Nov 2020 12:31:24 +0000
Message-Id: <20201125123127.3226384-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125123127.3226384-1-ross.burton@arm.com>
References: <20201125123127.3226384-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

To prepare for a new version of scp-firmware, add a version to this
bbappend.

Change-Id: Ib6d79f2992783f2d582ca5804bc081912f9bb674
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../{scp-firmware_%.bbappend =3D> scp-firmware_2.6%.bbappend}       | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arm-bsp/recipes-bsp/scp-firmware/{scp-firmware_%.bbappend =3D=
> scp-firmware_2.6%.bbappend} (100%)

diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappen=
d b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.6%.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
rename to meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.6%.bbappen=
d
--=20
2.25.1

