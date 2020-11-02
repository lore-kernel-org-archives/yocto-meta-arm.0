Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.867.1604331230127378972
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 02 Nov 2020 07:33:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 947AF31B
	for <meta-arm@lists.yoctoproject.org>; Mon,  2 Nov 2020 07:33:49 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E8583F66E
	for <meta-arm@lists.yoctoproject.org>; Mon,  2 Nov 2020 07:33:49 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/7] arm/optee-test: add bug links
Date: Mon,  2 Nov 2020 15:33:36 +0000
Message-Id: <20201102153341.2844482-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102153341.2844482-1-ross.burton@arm.com>
References: <20201102153341.2844482-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

These issues now have upstream bugs.

Change-Id: I9eacedbbf6e7874f6d1843b08fd9a8c04d030855
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../0001-host-xtest-Adjust-order-of-including-compiler.h.patch  | 2 +-
 .../optee-test/0002-make-remove-Wno-unsafe-loop-for-clang.patch | 2 +-
 .../0003-make-remove-Wmissing-noreturn-for-clang.patch          | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm/recipes-security/optee/optee-test/0001-host-xtest-A=
djust-order-of-including-compiler.h.patch b/meta-arm/recipes-security/opt=
ee/optee-test/0001-host-xtest-Adjust-order-of-including-compiler.h.patch
index 3066b66..3c500d7 100644
--- a/meta-arm/recipes-security/optee/optee-test/0001-host-xtest-Adjust-o=
rder-of-including-compiler.h.patch
+++ b/meta-arm/recipes-security/optee/optee-test/0001-host-xtest-Adjust-o=
rder-of-including-compiler.h.patch
@@ -12,7 +12,7 @@ recipe-sysroot/usr/include/bits/stat.h:17:19: error: ex=
pected identifier or '('
                    ^
 including compiler.h afer sys/stat.h fixes the problem.
=20
-Upstream-Status: Pending
+Upstream-Status: Pending [https://github.com/OP-TEE/optee_test/issues/45=
3]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  host/xtest/install_ta.c | 2 +-
diff --git a/meta-arm/recipes-security/optee/optee-test/0002-make-remove-=
Wno-unsafe-loop-for-clang.patch b/meta-arm/recipes-security/optee/optee-t=
est/0002-make-remove-Wno-unsafe-loop-for-clang.patch
index ef09c56..17dd7d8 100644
--- a/meta-arm/recipes-security/optee/optee-test/0002-make-remove-Wno-uns=
afe-loop-for-clang.patch
+++ b/meta-arm/recipes-security/optee/optee-test/0002-make-remove-Wno-uns=
afe-loop-for-clang.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] make: remove -Wmissing-noreturn for clan=
g
 When compiling when clang, -Wmissing-noreturn causes an error because
 of non-compliant code. This option is removed to workaround this.
=20
-Upstream-Status: Pending
+Upstream-Status: Pending [https://github.com/OP-TEE/optee_test/issues/45=
2]
 Changed-Id: 71cb511904547d790d1ea98f93bf8e5a6afcb36d
 Signed-off-by: Brett Warren <brett.warren@arm.com>
 ---
diff --git a/meta-arm/recipes-security/optee/optee-test/0003-make-remove-=
Wmissing-noreturn-for-clang.patch b/meta-arm/recipes-security/optee/optee=
-test/0003-make-remove-Wmissing-noreturn-for-clang.patch
index b265e81..bbc303f 100644
--- a/meta-arm/recipes-security/optee/optee-test/0003-make-remove-Wmissin=
g-noreturn-for-clang.patch
+++ b/meta-arm/recipes-security/optee/optee-test/0003-make-remove-Wmissin=
g-noreturn-for-clang.patch
@@ -7,7 +7,7 @@ When compiling with clang, the -Wno-unsafe-loop-optimizat=
ions option
 throws an error because clang doesn't recognise it. This option is
 removed to workaround this.
=20
-Upstream-Status: Pending
+Upstream-Status: Pending [https://github.com/OP-TEE/optee_test/issues/45=
2]
 Change-Id: 5fe0892c73208aaffac8c9995cb3275936fb1ba6
 Signed-off-by: Brett Warren <brett.warren@arm.com>
 ---
--=20
2.25.1

