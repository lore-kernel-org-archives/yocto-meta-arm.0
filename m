Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7943.1615293957796352976
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Mar 2021 04:45:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BEDA21042;
	Tue,  9 Mar 2021 04:45:56 -0800 (PST)
Received: from e125920.arm.com (unknown [10.57.46.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 259323F70D;
	Tue,  9 Mar 2021 04:45:56 -0800 (PST)
From: "Peter Hoyes" <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH] arm-bsp/linux: Include standard.scc for n1sdp builds
Date: Tue,  9 Mar 2021 12:45:53 +0000
Message-Id: <20210309124553.3902908-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Peter Hoyes <Peter.Hoyes@arm.com>

Follow same pattern as juno and fvp-base, by including
arm-platforms-kmeta and creating a scc file for n1sdp-standard.
Without this, warnings are being generated when including scc
fragments from other layers.

Issue-Id: SCM-2130
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: Ibf7827c86bc59c728773720e510b44d02b837c1b
---
 .../arm-platforms-kmeta/bsp/arm-platforms/n1sdp-standard.scc | 5 +++++
 meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc    | 1 +
 2 files changed, 6 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta=
/bsp/arm-platforms/n1sdp-standard.scc

diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/n1sdp-standard.scc b/meta-arm-bsp/recipes-kernel/linux/arm-pl=
atforms-kmeta/bsp/arm-platforms/n1sdp-standard.scc
new file mode 100644
index 0000000..8536c81
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/n1sdp-standard.scc
@@ -0,0 +1,5 @@
+define KMACHINE n1sdp
+define KTYPE standard
+define KARCH arm64
+
+include ktypes/standard/standard.scc
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index b852644..f2bb079 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -12,6 +12,7 @@ SRC_URI_KMETA =3D "file://arm-platforms-kmeta;type=3Dkm=
eta;name=3Darm-platforms-kmeta;
 SRC_URI_append_fvp-base =3D " ${SRC_URI_KMETA}"
 SRC_URI_append_fvp-base-arm32 =3D " ${SRC_URI_KMETA}"
 SRC_URI_append_juno =3D " ${SRC_URI_KMETA}"
+SRC_URI_append_n1sdp =3D " ${SRC_URI_KMETA}"
 SRCREV_arm-platforms-kmeta =3D "6147e82375aa9df8f2a162d42ea6406c79c854c5=
"
=20
 #
--=20
2.25.1

