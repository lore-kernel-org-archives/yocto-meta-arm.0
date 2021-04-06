Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.12217.1617716279585799651
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 Apr 2021 06:37:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E66661FB
	for <meta-arm@lists.yoctoproject.org>; Tue,  6 Apr 2021 06:37:58 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 86AE43F73D
	for <meta-arm@lists.yoctoproject.org>; Tue,  6 Apr 2021 06:37:58 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: build sbsa-acs in the qemuarm64-sbsa job
Date: Tue,  6 Apr 2021 14:37:55 +0100
Message-Id: <20210406133755.2676228-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: I10dcd2b6332db281f969981a44edc22d0750a79b
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 kas/qemuarm64-sbsa.yml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kas/qemuarm64-sbsa.yml b/kas/qemuarm64-sbsa.yml
index 821215e..5ba5f27 100644
--- a/kas/qemuarm64-sbsa.yml
+++ b/kas/qemuarm64-sbsa.yml
@@ -4,3 +4,8 @@ header:
     - base.yml
=20
 machine: qemuarm64-sbsa
+
+target:
+  - core-image-base
+  - perf
+  - sbsa-acs
--=20
2.25.1

