Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.23458.1629723624211909143
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 Aug 2021 06:00:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC0431042;
	Mon, 23 Aug 2021 06:00:23 -0700 (PDT)
Received: from e125920.arm.com (unknown [10.57.90.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 144F83F5A1;
	Mon, 23 Aug 2021 06:00:22 -0700 (PDT)
From: "Peter Hoyes" <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 2/3] arm-bsp/docs: Reword fvp-baser-aemv8r64 known issues
Date: Mon, 23 Aug 2021 14:00:08 +0100
Message-Id: <20210823130009.189450-2-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823130009.189450-1-peter.hoyes@arm.com>
References: <20210823130009.189450-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Peter Hoyes <Peter.Hoyes@arm.com>

The wording implied they were limitations of the architecture, so
rewrite to make clear they are software restrictions.

Issue-Id: SCM-2987
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I79ca1ac7cdce709015de1c539a6ec7fe1650d384
---
 meta-arm-bsp/documentation/fvp-baser-aemv8r64.md | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-arm-=
bsp/documentation/fvp-baser-aemv8r64.md
index 970acd6..6a76a64 100644
--- a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
+++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
@@ -187,8 +187,8 @@ Known Issues and Limitations
 ----------------------------
=20
 - Only PSCI CPU\_ON and CPU\_OFF functions are supported
-- Booting Linux kernel from Secure EL2 is not supported on Armv8-R AArch=
64
-- Both VHE and non-VHE Linux-KVM are not supported on Armv8-R AArch64
+- Linux kernel does not support booting from secure EL2 on Armv8-R AArch=
64
+- Linux KVM does not support Armv8-R AArch64
=20
 Changelog
 ---------
--=20
2.25.1

