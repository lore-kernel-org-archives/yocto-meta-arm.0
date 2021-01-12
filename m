Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.7529.1610449761653749301
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 Jan 2021 03:09:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F6701042
	for <meta-arm@lists.yoctoproject.org>; Tue, 12 Jan 2021 03:09:20 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7E8D3F66E
	for <meta-arm@lists.yoctoproject.org>; Tue, 12 Jan 2021 03:09:19 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] kas: rename armgcc fragment to avoid conflicting with musl
Date: Tue, 12 Jan 2021 11:09:14 +0000
Message-Id: <20210112110915.315703-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The armgcc fragment was labelled 'libc', which means it would be
impossible to armgcc+musl.

Change-Id: I96f1d6e1a77bcd05fe373315f575c57c36417852
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 kas/armgcc.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kas/armgcc.yml b/kas/armgcc.yml
index 52b09b0..4e05f5e 100644
--- a/kas/armgcc.yml
+++ b/kas/armgcc.yml
@@ -2,5 +2,5 @@ header:
   version: 9
=20
 local_conf_header:
-  libc: |
+  cc: |
     GCCVERSION =3D "arm-10.2"
--=20
2.25.1

