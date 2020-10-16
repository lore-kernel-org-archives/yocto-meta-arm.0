Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.22906.1602872387025144870
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 16 Oct 2020 11:19:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD12230E
	for <meta-arm@lists.yoctoproject.org>; Fri, 16 Oct 2020 11:19:46 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 590853F71F
	for <meta-arm@lists.yoctoproject.org>; Fri, 16 Oct 2020 11:19:46 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] gem5: use pre-generated keys instead of haveged in gem5 machine
Date: Fri, 16 Oct 2020 19:19:34 +0100
Message-Id: <20201016181934.2017752-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201016181934.2017752-1-ross.burton@arm.com>
References: <20201016181934.2017752-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

As the gem5 image won't be used in production there is no need to
generate unique SSH keys on the first boot, which takes a long time in
gem5.

Instead of recommending haveged (from meta-oe) we can simply install
pre-generated SSH keys. These keys are static so should not be used in
production!

Change-Id: I134a421d66eb2b55cf0e4f44781021ac2c96106d
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-gem5/conf/machine/gem5-arm64.conf | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-gem5/conf/machine/gem5-arm64.conf b/meta-gem5/conf/mach=
ine/gem5-arm64.conf
index 9ca2bb0..3e97682 100644
--- a/meta-gem5/conf/machine/gem5-arm64.conf
+++ b/meta-gem5/conf/machine/gem5-arm64.conf
@@ -47,7 +47,8 @@ GEM5_RUN_CMDLINE =3D ""
=20
 EXTRA_IMAGEDEPENDS +=3D "gem5-aarch64-native"
=20
-# Use haveged as a source of entropy instead of rng-tools (Needed for ss=
h).
-# rngd (Part of rng-tools) takes ~7 mins to init resulting in a slow boo=
t time.
-PACKAGE_EXCLUDE_append =3D " rng-tools"
-MACHINE_EXTRA_RRECOMMENDS +=3D "haveged"
+# As this is a virtual target that will not be used in the real world th=
ere is
+# no need for real SSH keys.  Disable rng-tools (which takes too long to
+# initialise) and install the pre-generated keys.
+PACKAGECONFIG_remove_pn-openssh =3D "rng-tools"
+MACHINE_EXTRA_RRECOMMENDS +=3D "ssh-pregen-hostkeys"
--=20
2.25.1

