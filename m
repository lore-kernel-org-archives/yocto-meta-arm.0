Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.29579.1605023542376737183
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 Nov 2020 07:52:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D4031396
	for <meta-arm@lists.yoctoproject.org>; Tue, 10 Nov 2020 07:52:20 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 47DDC3F718
	for <meta-arm@lists.yoctoproject.org>; Tue, 10 Nov 2020 07:52:20 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/6] arm-bsp/documentation: fix MACHINE reference
Date: Tue, 10 Nov 2020 15:52:11 +0000
Message-Id: <20201110155216.1313151-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The MACHINE is foundation-armv8, not foundation-v8.

Change-Id: I557eb9c32914b2ccf938a76a6efb260483e83d22
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/documentation/foundation-armv8.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/documentation/foundation-armv8.md b/meta-arm-bs=
p/documentation/foundation-armv8.md
index dacdce3..72f9f66 100644
--- a/meta-arm-bsp/documentation/foundation-armv8.md
+++ b/meta-arm-bsp/documentation/foundation-armv8.md
@@ -4,7 +4,7 @@
=20
 ### Configuration:
 In the local.conf file, MACHINE should be set as follow:
-MACHINE ?=3D "foundation-v8"
+MACHINE ?=3D "foundation-armv8"
=20
 ### Build:
 ```bash$ bitbake core-image-minimal```
--=20
2.25.1

