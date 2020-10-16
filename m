Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.22817.1602872377817575287
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 16 Oct 2020 11:19:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 681A730E
	for <meta-arm@lists.yoctoproject.org>; Fri, 16 Oct 2020 11:19:37 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 129C83F71F
	for <meta-arm@lists.yoctoproject.org>; Fri, 16 Oct 2020 11:19:36 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm-bsp: use pre-generated keys instead of haveged in FVP machines
Date: Fri, 16 Oct 2020 19:19:33 +0100
Message-Id: <20201016181934.2017752-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

As the FVP images won't be used in production there is no need to
generate unique SSH keys on the first boot, which takes a long time in a
FVP.

Instead of recommending haveged (from meta-oe) we can simply install
pre-generated SSH keys. These keys are static so should not be used in
production!

Change-Id: I6a538de6bee892a77816c1d938dd2b55c94257f4
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-common.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/fvp-common.inc b/meta-arm-bsp/conf=
/machine/fvp-common.inc
index 2279338..da45026 100644
--- a/meta-arm-bsp/conf/machine/fvp-common.inc
+++ b/meta-arm-bsp/conf/machine/fvp-common.inc
@@ -33,8 +33,8 @@ PREFERRED_VERSION_linux-yocto ?=3D "5.4%"
=20
 EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a u-boot"
=20
-# Use haveged as a source of entropy instead of rng-tools (Needed for ss=
h).
-# rngd (Part of rng-tools) takes ~7 mins to init resulting in a slow boo=
t time.
-PACKAGE_EXCLUDE_append =3D " rng-tools"
-MACHINE_EXTRA_RRECOMMENDS +=3D "haveged"
-
+# As this is a virtual target that will not be used in the real world th=
ere is
+# no need for real SSH keys.  Disable rng-tools (which takes too long to
+# initialise) and install the pre-generated keys.
+PACKAGECONFIG_remove_pn-openssh =3D "rng-tools"
+MACHINE_EXTRA_RRECOMMENDS +=3D "ssh-pregen-hostkeys"
--=20
2.25.1

