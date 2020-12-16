Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.499.1608140903662493053
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 16 Dec 2020 09:48:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: usama.arif@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 511E11FB;
	Wed, 16 Dec 2020 09:48:23 -0800 (PST)
Received: from usaari01.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD15A3F66B;
	Wed, 16 Dec 2020 09:48:22 -0800 (PST)
From: "Usama Arif" <usama.arif@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Usama Arif <usama.arif@arm.com>
Subject: [PATCH 3/3] arm-bsp/documentation: Update the command for building all components
Date: Wed, 16 Dec 2020 17:48:05 +0000
Message-Id: <20201216174805.50683-3-usama.arif@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201216174805.50683-1-usama.arif@arm.com>
References: <20201216174805.50683-1-usama.arif@arm.com>

Trusted-firmware-a is the final component to be built with the rest of the
components dependent of it, therefore building trusted-firmware-a will
build all the required binaries.

Change-Id: Ia8675b048db4a127d32394f536632ce88fe20826
Signed-off-by: Usama Arif <usama.arif@arm.com>
---
 meta-arm-bsp/documentation/tc0.md | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-arm-bsp/documentation/tc0.md b/meta-arm-bsp/documentation/tc0.md
index 694e067..f11b781 100644
--- a/meta-arm-bsp/documentation/tc0.md
+++ b/meta-arm-bsp/documentation/tc0.md
@@ -15,9 +15,12 @@ https://git.linaro.org/landing-teams/working/arm/arm-reference-platforms.git/tre
 In the local.conf file, MACHINE should be set as follows:
 MACHINE = "tc0"
 
-To build the required binaries for tc0, run the commmand for the required image,
-for e.g for core-image-minimal:
-```bash$ bitbake core-image-minimal```
+To build the required binaries for tc0, run the commmand:
+```bash$ bitbake trusted-firmware-a```
+
+Trusted-firmware-a is the final component to be built with the rest of the
+components dependent of it, therefore building trusted-firmware-a will
+build all the required binaries.
 
 ## Running
 To run the produced binaries in a TC0 Fixed Virtual Platform please get
-- 
2.17.1

