Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.9485.1603209699749361927
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Oct 2020 09:01:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75378D6E
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 Oct 2020 09:01:39 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 182713F66B
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 Oct 2020 09:01:38 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm-bsp: fix typo in musca-b1 documentation
Date: Tue, 20 Oct 2020 17:01:36 +0100
Message-Id: <20201020160136.473402-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201020160136.473402-1-ross.burton@arm.com>
References: <20201020160136.473402-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: I7e39c39f14a9ccf32ccfbc732f57c0df79034885
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/documentation/musca-b1.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/documentation/musca-b1.md b/meta-arm-bsp/docume=
ntation/musca-b1.md
index 9fde10a..a9af03f 100644
--- a/meta-arm-bsp/documentation/musca-b1.md
+++ b/meta-arm-bsp/documentation/musca-b1.md
@@ -19,7 +19,7 @@ To build for Zephyr:
 ```bash$ bitbake zephyr-philosophers```
=20
 To build the trusted firmware-m (and not Zephyr):
-```bash$ bitbake trusted-frimware-m```
+```bash$ bitbake trusted-firmware-m```
=20
 ## Running
 To run Zephyr on the QEMU based machine, execute the following command
--=20
2.25.1

