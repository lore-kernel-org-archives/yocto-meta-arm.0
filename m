Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.34695.1611570326832848029
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 25 Jan 2021 02:25:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3590C1042;
	Mon, 25 Jan 2021 02:25:26 -0800 (PST)
Received: from e125920.arm.com (unknown [10.57.45.102])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98E2F3F66E;
	Mon, 25 Jan 2021 02:25:25 -0800 (PST)
From: "Peter Hoyes" <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH] arm-autonomy: Use 5.10 kernel for autonomy-guest
Date: Mon, 25 Jan 2021 10:25:49 +0000
Message-Id: <20210125102549.110517-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Peter Hoyes <Peter.Hoyes@arm.com>

Issue-Id: SCM-2054
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I8bcb464f0fd960cd01cce328c51be538cc705e84
---
 meta-arm-autonomy/conf/machine/arm64-autonomy-guest.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-autonomy/conf/machine/arm64-autonomy-guest.conf b/m=
eta-arm-autonomy/conf/machine/arm64-autonomy-guest.conf
index 8b32fa7..097b382 100644
--- a/meta-arm-autonomy/conf/machine/arm64-autonomy-guest.conf
+++ b/meta-arm-autonomy/conf/machine/arm64-autonomy-guest.conf
@@ -11,7 +11,7 @@ KERNEL_IMAGETYPE =3D "Image"
 IMAGE_FSTYPES +=3D "tar.bz2"
=20
 PREFERRED_PROVIDER_virtual/kernel =3D "linux-yocto"
-PREFERRED_VERSION_linux-yocto ?=3D "5.4%"
+PREFERRED_VERSION_linux-yocto ?=3D "5.10%"
=20
 DISTRO_FEATURES +=3D "arm-autonomy-guest"
=20
--=20
2.25.1

