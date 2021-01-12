Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7537.1610449761800492827
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 Jan 2021 03:09:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B95D511FB
	for <meta-arm@lists.yoctoproject.org>; Tue, 12 Jan 2021 03:09:20 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 651F73F66E
	for <meta-arm@lists.yoctoproject.org>; Tue, 12 Jan 2021 03:09:20 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] kas: add a test for the external toolchain support
Date: Tue, 12 Jan 2021 11:09:15 +0000
Message-Id: <20210112110915.315703-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210112110915.315703-1-ross.burton@arm.com>
References: <20210112110915.315703-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

meta-arm-toolchain supports using an external binary arm
toolchain[1] instead of the gcc-cross built by oe-core.

Add a test case to exercise this build in the CI.  Currently this
is only for the Aarch32 target as our CI runs on aarch64 and there
is no binary or aarch64 target on aarch64 host.

This depends on the image used by the CI having the relevant
compilers installed into /usr/local.

[1] https://developer.arm.com/tools-and-software/open-source-software/dev=
eloper-tools/gnu-toolchain/gnu-a

Change-Id: I9f7ea66786e98a40cbd490386497e2d3aaa47e80
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml             | 3 +++
 kas/external-gcc-arm32.yml | 8 ++++++++
 2 files changed, 11 insertions(+)
 create mode 100644 kas/external-gcc-arm32.yml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 3ae0aa3..f67e8b8 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -69,6 +69,9 @@ fvp-base:
 fvp-base-arm32:
   extends: .build
=20
+fvp-base-arm32/external-gcc-arm32:
+  extends: .build
+
 gem5-arm64:
   extends: .build
=20
diff --git a/kas/external-gcc-arm32.yml b/kas/external-gcc-arm32.yml
new file mode 100644
index 0000000..de8798e
--- /dev/null
+++ b/kas/external-gcc-arm32.yml
@@ -0,0 +1,8 @@
+header:
+  version: 9
+
+local_conf_header:
+  cc: |
+    PNBLACKLIST[gcc-cross-arm] =3D "Using external toolchain"
+    TCMODE =3D "external-arm"
+    EXTERNAL_TOOLCHAIN =3D "/usr/local/gcc-arm-10.2-2020.11-aarch64-arm-=
none-linux-gnueabihf"
--=20
2.25.1

