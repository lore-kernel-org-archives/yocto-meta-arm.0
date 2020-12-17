Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9968.1608218872133824884
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Dec 2020 07:27:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6263D101E
	for <meta-arm@lists.yoctoproject.org>; Thu, 17 Dec 2020 07:27:51 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 21F703F66B
	for <meta-arm@lists.yoctoproject.org>; Thu, 17 Dec 2020 07:27:51 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][dunfell 2/3] ci: make bootstrap just another kas overlay
Date: Thu, 17 Dec 2020 15:27:47 +0000
Message-Id: <20201217152748.492237-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201217152748.492237-1-ross.burton@arm.com>
References: <20201217152748.492237-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Simplify the gitlab-ci by having the bootstrap build as just another Kas
overlay file, so there's no duplication of build script.

Change-Id: I7341750d2ae7f3c146bfe323f61fa98c0f3121c0
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml    | 6 +-----
 kas/bootstrap.yml | 9 +++++++++
 2 files changed, 10 insertions(+), 5 deletions(-)
 create mode 100644 kas/bootstrap.yml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 1db561c..d771a27 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -36,13 +36,9 @@ stages:
=20
 # Build a number of native tools first to ensure the other builders don'=
t race
 # over them
-bootstrap:
+n1sdp/bootstrap:
   extends: .build
   stage: bootstrap
-  variables:
-    KAS_TARGET: binutils-cross-aarch64 gcc-cross-aarch64 python3-native =
opkg-native rpm-native
-  script:
-  - kas build kas/n1sdp.yml
=20
 # What percentage of machines in the layer do we build
 machine-coverage:
diff --git a/kas/bootstrap.yml b/kas/bootstrap.yml
new file mode 100644
index 0000000..0e05e46
--- /dev/null
+++ b/kas/bootstrap.yml
@@ -0,0 +1,9 @@
+header:
+  version: 9
+
+target:
+  - binutils-cross-aarch64
+  - gcc-cross-aarch64
+  - python3-native
+  - opkg-native
+  - rpm-native
--=20
2.25.1

