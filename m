Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.5767.1615540298913394166
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Mar 2021 01:11:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1E241FB;
	Fri, 12 Mar 2021 01:11:27 -0800 (PST)
Received: from e125920.arm.com (unknown [10.57.50.194])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5421A3F70D;
	Fri, 12 Mar 2021 01:11:27 -0800 (PST)
From: "Peter Hoyes" <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH] arm-bsp/linux: Add support for linux-yocto-rt for N1SDP
Date: Fri, 12 Mar 2021 09:11:28 +0000
Message-Id: <20210312091128.1931184-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Peter Hoyes <Peter.Hoyes@arm.com>

 * Enable linux-arm-platforms.inc for N1SDP
 * Create n1sdp-preempt-rt.scc config
 * Disable KVM as incompatible with preempt-rt
 * Disable kconf audit warnings as preempt-rt.scc clashes with
   defconfig

Issue-Id: SCM-1506
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I4f9c61c7fe2400858578576aad7c5d1c958e9a2e
---
 .../bsp/arm-platforms/n1sdp-preempt-rt.scc                  | 6 ++++++
 .../bsp/arm-platforms/n1sdp/disable-kvm.cfg                 | 1 +
 meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc   | 3 +++
 meta-arm-bsp/recipes-kernel/linux/linux-yocto-rt_%.bbappend | 5 +++++
 4 files changed, 15 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta=
/bsp/arm-platforms/n1sdp-preempt-rt.scc
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta=
/bsp/arm-platforms/n1sdp/disable-kvm.cfg
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-rt_%.bb=
append

diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/n1sdp-preempt-rt.scc b/meta-arm-bsp/recipes-kernel/linux/arm-=
platforms-kmeta/bsp/arm-platforms/n1sdp-preempt-rt.scc
new file mode 100644
index 0000000..dc84445
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/n1sdp-preempt-rt.scc
@@ -0,0 +1,6 @@
+define KMACHINE n1sdp
+define KTYPE preempt-rt
+define KARCH arm64
+
+include ktypes/preempt-rt/preempt-rt.scc
+include n1sdp/disable-kvm.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/n1sdp/disable-kvm.cfg b/meta-arm-bsp/recipes-kernel/linux/arm=
-platforms-kmeta/bsp/arm-platforms/n1sdp/disable-kvm.cfg
new file mode 100644
index 0000000..617d3e5
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/n1sdp/disable-kvm.cfg
@@ -0,0 +1 @@
+# CONFIG_KVM is not set
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index f2bb079..711c67a 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -104,6 +104,9 @@ SRC_URI_append_n1sdp =3D " \
     file://enable-realtek-R8169.cfg \
     file://enable-usb_conn_gpio.cfg \
     "
+# Since we use the intree defconfig and the preempt-rt turns off some co=
nfigs
+# do_kernel_configcheck will display warnings. So, lets disable it.
+KCONF_AUDIT_LEVEL_n1sdp_pn-linux-yocto-rt =3D "0"
=20
 #
 # Musca B1/S2 can't run Linux
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-rt_%.bbappend =
b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-rt_%.bbappend
new file mode 100644
index 0000000..7f6030f
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-rt_%.bbappend
@@ -0,0 +1,5 @@
+# Only enable linux-yocto-rt for n1sdp
+LINUX_YOCTO_RT_REQUIRE ?=3D ""
+LINUX_YOCTO_RT_REQUIRE_n1sdp =3D "linux-arm-platforms.inc"
+
+require ${LINUX_YOCTO_RT_REQUIRE}
--=20
2.25.1

