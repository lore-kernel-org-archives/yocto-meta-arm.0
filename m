Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8362.1792505194932317661
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Oct 2026 07:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=g1Qd6vy3;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0639825DD
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 Oct 2026 07:06:31 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 136383F7D8
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 Oct 2026 07:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792505194; bh=yfeAEhLBaoANX5N8X9doYEZGlzKrMmtZdNUV23BN1e8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=g1Qd6vy3VoI3BylrmHhXq3Jmr1V60LU5VMmBIBbQ4++7LGzds9zqd3T15oyRvKdMq
	 3PhJLHpD4cN8Gw1f6Qxmr6q2zo8k5mZvEhfM+ZX+YLMnaPTWm1pqDgNNUu7PSFdbA+
	 ZgDdSSpYKUxJskrdG86qsoFSMWQAv0F2KoJgIAlE=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/cot-dt2c: disable version checking
Date: Tue, 20 Oct 2026 10:06:33 -0400
Message-ID: <20261020140633.95775-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261020140633.95775-1-jon.mason@arm.com>
References: <20261020140633.95775-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arm@lists.yoctoproject.org>; Tue, 20 Oct 2026 14:06:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7193
Content-Type: text/plain; charset="utf-8"

The tooling uses trusted-firmware-a version when attempting to detect a
new release, which results in a fault comparison of:
cot-dt2c                  0.1.0           2.15.0          None da738d5eae=
93af342fdc4995dd3c05acb4c9d757

The version of cot-dt2c is actually found within the pyproject.toml, see
https://github.com/ARM-software/arm-trusted-firmware/blob/master/tools/co=
t_dt2c/pyproject.toml#L8

Disable the check to avoid this issue.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-bsp/trusted-firmware-a/cot-dt2c_0.1.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/cot-dt2c_0.1.0.bb b/=
meta-arm/recipes-bsp/trusted-firmware-a/cot-dt2c_0.1.0.bb
index 7d9dec485855..8d8ddf06c1af 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/cot-dt2c_0.1.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/cot-dt2c_0.1.0.bb
@@ -12,6 +12,10 @@ LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D6e=
d7bace7b0bc63021c6eba7b524039e
 SRCREV =3D "da738d5eae93af342fdc4995dd3c05acb4c9d757"
 SRCBRANCH =3D "master"
=20
+# The tools use the TF-A source when performing a version check, not
+# the version of this within the source.  So, disable checking
+UPSTREAM_VERSION_UNKNOWN =3D "1"
+
 inherit python_poetry_core
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.54.0 (Apple Git-157)

