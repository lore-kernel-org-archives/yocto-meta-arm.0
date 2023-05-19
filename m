Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 191FAC7EE23
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 11:24:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.23053.1684495472195982360
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 19 May 2023 04:24:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B977A2F4;
	Fri, 19 May 2023 04:25:16 -0700 (PDT)
Received: from R91284ZP.arm.com (unknown [10.57.21.254])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 41F793F762;
	Fri, 19 May 2023 04:24:31 -0700 (PDT)
From: Gyorgy Szing <Gyorgy.Szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gyorgy Szing <Gyorgy.Szing@arm.com>
Subject: [PATCH 10/16] trusted-services: update documentation
Date: Fri, 19 May 2023 13:23:54 +0200
Message-Id: <20230519112400.340-10-Gyorgy.Szing@arm.com>
X-Mailer: git-send-email 2.39.1.windows.1
In-Reply-To: <20230519112400.340-1-Gyorgy.Szing@arm.com>
References: <20230519112400.340-1-Gyorgy.Szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 19 May 2023 11:24:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4674

Add information related to SPMC tests and fix stale links.

Signed-off-by: Gyorgy Szing <Gyorgy.Szing@arm.com>
---
 documentation/trusted-services.md | 40 ++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/documentation/trusted-services.md b/documentation/trusted-se=
rvices.md
index e3cee6b3..70826f68 100644
--- a/documentation/trusted-services.md
+++ b/documentation/trusted-services.md
@@ -1,6 +1,6 @@
 # The Trusted Services: framework for developing root-of-trust services
=20
-  meta-arm layer includes recipes for [Trusted Services][1] Secure Parti=
tions and Normal World applications
+meta-arm layer includes recipes for [Trusted Services][^1] Secure Partit=
ions and Normal World applications
 in `meta-arm/recipes-security/trusted-services`
=20
 ## Secure Partitions recipes
@@ -12,7 +12,7 @@ These files are automatically included into optee-os im=
age accordingly to define
 ### How to include TS SPs
=20
 To include TS SPs into optee-os image you need to add into MACHINE_FEATU=
RES
-features for each [Secure Partition][2] you would like to include:
+features for each [Secure Partition][^2] you would like to include:
=20
 | Secure Partition  | MACHINE_FEATURE |
 | ----------------- | --------------- |
@@ -22,32 +22,44 @@ features for each [Secure Partition][2] you would lik=
e to include:
 | Protected Storage | ts-storage      |
 | se-proxy          | ts-se-proxy     |
 | smm-gateway       | ts-smm-gateway  |
+| spm-test[1-3]     | optee-spmc-test |
=20
 Other steps depend on your machine/platform definition:
=20
 1. For communications between Secure and Normal Words Linux kernel optio=
n `CONFIG_ARM_FFA_TRANSPORT=3Dy`
-is required. If your platform doesn't include it already you can add `ar=
m-ffa` into MACHINE_FEATURES.
+   is required. If your platform doesn't include it already you can add =
`arm-ffa` into MACHINE_FEATURES.
+   (Please see ` meta-arm/recipes-kernel/arm-ffa-tee`.)
+
+   For running the `uefi-test` or the `xtest -t ffa_spmc` tests under Li=
nux the `arm-ffa-user` drivel is required. This is
+   enabled if the `ts-smm-gateway` and/or the `optee-spmc-test` machine =
features are enabled.
+   (Please see ` meta-arm/recipes-kernel/arm-ffa-user`.)
=20
 2. optee-os might require platform specific OP-TEE build parameters (for=
 example what SEL the SPM Core is implemented at).
-You can find examples in `meta-arm/recipes-security/optee/optee-os_%.bba=
ppend` for qemuarm64-secureboot machine
-and in `meta-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc` and `met=
a-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc`
-for N1SDP and Corstone1000 platforms accordingly.
+   You can find examples in `meta-arm/recipes-security/optee/optee-os_%.=
bbappend` for qemuarm64-secureboot machine
+   and in `meta-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc` and `=
meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc`
+   for N1SDP and Corstone1000 platforms accordingly.
=20
 3. trusted-firmware-a might require platform specific TF-A build paramet=
ers (SPD and SPMC details on the platform).
-See `meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappe=
nd` for qemuarm64-secureboot machine
-and in `meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n=
1sdp.inc` and
-`meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone=
1000.inc` for N1SDP and Corstone1000 platforms.
+   See `meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bba=
ppend` for qemuarm64-secureboot machine
+   and in `meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-=
a-n1sdp.inc` and
+   `meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corst=
one1000.inc` for N1SDP and Corstone1000 platforms.
=20
 ## Normal World applications
=20
-  Optionally for testing purposes you can add `packagegroup-ts-tests` an=
d `packagegroup-ts-tests-psa` package groups into your image.
-They include [Trusted Services test and demo tools][3]
+Optionally for testing purposes you can add `packagegroup-ts-tests` into=
 your image. It includes=20
+[Trusted Services test and demo tools][^3] and [xtest][^4] configured to=
 include the `ffa_spmc` tests.
=20
 ## OEQA Trusted Services tests
=20
   meta-arm also includes Trusted Service OEQA tests which can be used fo=
r automated testing.
 See `ci/trusted-services.yml` for an example how to include them into an=
 image.
=20
-[1] https://trusted-services.readthedocs.io/en/integration/overview/intr=
oduction.html
-[2] https://trusted-services.readthedocs.io/en/integration/developer/dep=
loyments/secure-partitions.html
-[3] https://trusted-services.readthedocs.io/en/integration/developer/dep=
loyments/test-executables.html
+
+------
+[^1]: https://trusted-services.readthedocs.io/en/integration/overview/in=
dex.html
+
+[^2]: https://trusted-services.readthedocs.io/en/integration/deployments=
/secure-partitions.html
+
+[^3]: https://trusted-services.readthedocs.io/en/integration/deployments=
/test-executables.html
+
+[^4]: https://optee.readthedocs.io/en/latest/building/gits/optee_test.ht=
ml
\ No newline at end of file
--=20
2.39.1.windows.1


