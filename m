Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.8921.1610029543322973010
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 Jan 2021 06:25:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A0BCD6E
	for <meta-arm@lists.yoctoproject.org>; Thu,  7 Jan 2021 06:25:41 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 25E1E3F70D
	for <meta-arm@lists.yoctoproject.org>; Thu,  7 Jan 2021 06:25:41 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] kas: add testing of gcc-arm
Date: Thu,  7 Jan 2021 14:25:37 +0000
Message-Id: <20210107142537.3870474-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add a build to verify that setting GCCVERSION to arm-10.2 works.

Change-Id: I086fa786b11560a8e94ee646859c59288bacba5d
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 3 +++
 kas/armgcc.yml | 6 ++++++
 2 files changed, 9 insertions(+)
 create mode 100644 kas/armgcc.yml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 9e14e2d..3ae0aa3 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -87,6 +87,9 @@ musca-s1:
 n1sdp:
   extends: .build
=20
+n1sdp/armgcc:
+  extends: .build
+
 qemuarm64-secureboot:
   extends: .build
=20
diff --git a/kas/armgcc.yml b/kas/armgcc.yml
new file mode 100644
index 0000000..52b09b0
--- /dev/null
+++ b/kas/armgcc.yml
@@ -0,0 +1,6 @@
+header:
+  version: 9
+
+local_conf_header:
+  libc: |
+    GCCVERSION =3D "arm-10.2"
--=20
2.25.1

