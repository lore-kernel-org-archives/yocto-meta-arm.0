Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.890.1604331305231806538
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 02 Nov 2020 07:35:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E332E30E
	for <meta-arm@lists.yoctoproject.org>; Mon,  2 Nov 2020 07:35:04 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8739D3F66E
	for <meta-arm@lists.yoctoproject.org>; Mon,  2 Nov 2020 07:35:04 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/documentation: add corstone700 documentation
Date: Mon,  2 Nov 2020 15:35:02 +0000
Message-Id: <20201102153502.2844733-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add brief documentation for the corstone700 BSPs.

Change-Id: I774e06aecca05ac13eaf2916623c6ec097c1c047
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/documentation/corstone700.md | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-arm-bsp/documentation/corstone700.md

diff --git a/meta-arm-bsp/documentation/corstone700.md b/meta-arm-bsp/doc=
umentation/corstone700.md
new file mode 100644
index 0000000..6a5fe0f
--- /dev/null
+++ b/meta-arm-bsp/documentation/corstone700.md
@@ -0,0 +1,21 @@
+# Corstone-700
+
+## Overview
+
+Corstone-700 is a flexible compute architecture combining Cortex-A and C=
ortex-M
+processors and a secure enclave, aimed at building secure IoT SoCs.  The=
re are
+machines for both Corstone-700 for Fixed Virtual Platform (`corstone700-=
fvp`)
+and Corstone-700 for MPS3 FPGA (`corstone700-mps3`).
+
+Further details are available in the [User Guide].
+
+## Building
+
+Corstone-700 is tested in 'tiny' configurations, such as `DISTRO=3D"poky=
-tiny"`.
+
+## Running
+
+For detailed instructions as to how to run the image in a FVP model, or =
on the
+MPS3 board, see the [User Guide].
+
+[User Guide]: https://git.linaro.org/landing-teams/working/arm/arm-refer=
ence-platforms.git/about/docs/corstone-700/user-guide.rst
--=20
2.25.1

