Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31BB0C77B75
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 11:24:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.23056.1684495478179305683
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 19 May 2023 04:24:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ADE462F4;
	Fri, 19 May 2023 04:25:22 -0700 (PDT)
Received: from R91284ZP.arm.com (unknown [10.57.21.254])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3708F3F762;
	Fri, 19 May 2023 04:24:37 -0700 (PDT)
From: Gyorgy Szing <Gyorgy.Szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Adam Johnston <adam.johnston@arm.com>
Subject: [PATCH 16/16] CI: Platform specific Trusted Services config
Date: Fri, 19 May 2023 13:24:00 +0200
Message-Id: <20230519112400.340-16-Gyorgy.Szing@arm.com>
X-Mailer: git-send-email 2.39.1.windows.1
In-Reply-To: <20230519112400.340-1-Gyorgy.Szing@arm.com>
References: <20230519112400.340-1-Gyorgy.Szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 19 May 2023 11:24:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4680

From: Adam Johnston <adam.johnston@arm.com>

Split trusted-services.xml into qemuarm64-secureboot-ts.yml and
n1sdp-ts.yml as collection of Trusted Services which can be tested on
each platform has diverged.

Signed-off-by: Adam Johnston <adam.johnston@arm.com>
---
 .gitlab-ci.yml                                     |  4 ++--
 ci/n1sdp-ts.yml                                    | 14 ++++++++++++++
 ...ed-services.yml =3D> qemuarm64-secureboot-ts.yml} |  0
 3 files changed, 16 insertions(+), 2 deletions(-)
 create mode 100644 ci/n1sdp-ts.yml
 rename ci/{trusted-services.yml =3D> qemuarm64-secureboot-ts.yml} (100%)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index df1f0f5a..4ee75fcc 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -150,7 +150,7 @@ n1sdp:
   parallel:
     matrix:
       - TOOLCHAINS: [gcc, armgcc]
-        TS: [none, trusted-services]
+        TS: [none, n1sdp-ts]
=20
 qemu-generic-arm64:
   extends: .build
@@ -167,7 +167,7 @@ qemuarm64-secureboot:
       - KERNEL: [linux-yocto, linux-yocto-dev, linux-yocto-rt]
         TOOLCHAINS: [gcc, clang]
         TCLIBC: [glibc, musl]
-        TS: [none, trusted-services]
+        TS: [none, qemuarm64-secureboot-ts]
         TESTING: testimage
=20
 qemuarm64:
diff --git a/ci/n1sdp-ts.yml b/ci/n1sdp-ts.yml
new file mode 100644
index 00000000..e8e9298d
--- /dev/null
+++ b/ci/n1sdp-ts.yml
@@ -0,0 +1,14 @@
+header:
+  version: 11
+  includes:
+    - ci/meta-openembedded.yml
+
+local_conf_header:
+  trusted_services: |
+    TEST_SUITES:append =3D " trusted_services"
+    # Include TS Crypto, TS Protected Storage, TS Internal and Trusted S=
torage SPs into optee-os image
+    MACHINE_FEATURES:append =3D " arm-ffa ts-crypto ts-storage ts-its"
+    # Include TS demo/test tools into image
+    IMAGE_INSTALL:append =3D " packagegroup-ts-tests"
+    # Include TS PSA Arch tests into image
+    IMAGE_INSTALL:append =3D " packagegroup-ts-tests-psa"
diff --git a/ci/trusted-services.yml b/ci/qemuarm64-secureboot-ts.yml
similarity index 100%
rename from ci/trusted-services.yml
rename to ci/qemuarm64-secureboot-ts.yml
--=20
2.39.1.windows.1


