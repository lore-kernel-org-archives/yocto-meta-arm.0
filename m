Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.9062.1619775058628646386
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 30 Apr 2021 02:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: richard.neill@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4223731B;
	Fri, 30 Apr 2021 02:30:57 -0700 (PDT)
Received: from e125927.arm.com (unknown [10.57.5.236])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 778D43F73B;
	Fri, 30 Apr 2021 02:30:56 -0700 (PDT)
From: "Richard Neill" <richard.neill@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-bsp/linux: Add preempt-rt support for fvp-baser-aemv8r64
Date: Fri, 30 Apr 2021 10:30:59 +0100
Message-Id: <20210430093059.9602-1-richard.neill@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add kernel configuration necessary to build an image with preempt-rt supp=
ort
for fvp-baser-aemv8r64, together with a build configuration file to build=
 it via
kas.

Update BSP documentation for RT linux support on the machine.

Issue-Id: SCM-2343
Signed-off-by: Richard Neill <richard.neill@arm.com>
Change-Id: I11e3ba3ad7da00db1810c70fa4f98bfffd4b8254
---
 kas/fvp-baser-aemv8r64-rt-bsp.yml             |  8 ++++++
 .../documentation/fvp-baser-aemv8r64.md       | 26 ++++++++++++++-----
 .../fvp-baser-aemv8r64-preempt-rt.scc         |  6 +++++
 .../linux/linux-yocto-rt_%.bbappend           |  3 ++-
 4 files changed, 36 insertions(+), 7 deletions(-)
 create mode 100644 kas/fvp-baser-aemv8r64-rt-bsp.yml
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta=
/bsp/arm-platforms/fvp-baser-aemv8r64-preempt-rt.scc

diff --git a/kas/fvp-baser-aemv8r64-rt-bsp.yml b/kas/fvp-baser-aemv8r64-r=
t-bsp.yml
new file mode 100644
index 0000000..2e712f8
--- /dev/null
+++ b/kas/fvp-baser-aemv8r64-rt-bsp.yml
@@ -0,0 +1,8 @@
+header:
+  version: 9
+  includes:
+    - fvp-baser-aemv8r64-bsp.yml
+
+local_conf_header:
+  base: |
+    PREFERRED_PROVIDER_virtual/kernel =3D "linux-yocto-rt"
diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-arm-=
bsp/documentation/fvp-baser-aemv8r64.md
index 18a01af..439e0f3 100644
--- a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
+++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
@@ -17,10 +17,16 @@ Fast Models Fixed Virtual Platforms (FVP) Reference G=
uide:
 https://developer.arm.com/docs/100966/latest
=20
 ## BSP Support
-The fvp-baser-aemv8r64 Yocto MACHINE supports the following BSP componen=
ts:
+The fvp-baser-aemv8r64 Yocto MACHINE supports the following BSP componen=
ts,
+where either a standard or Real-Time Linux kernel (PREEMPT\_RT) can be b=
uilt
+and run:
=20
  - boot-wrapper-aarch64
- - Kernel: linux-yocto-5.10
+ - Linux kernel: linux-yocto-5.10
+ - Linux kernel with PREEMPT\_RT support: linux-yocto-rt-5.10
+
+Note that the Real-Time Linux kernel (PREEMPT\_RT) does not use the real=
-time
+architectural extensions of the Armv8-R feature set.
=20
 ## Quick start: Howto Build and Run
=20
@@ -32,19 +38,27 @@ Install the kas setup tool for bitbake based projects=
:
 https://kas.readthedocs.io/en/latest/userguide.html#dependencies-install=
ation
=20
 ### Fetch sources
-Fetch meta-arm repository:
+Fetch the meta-arm repository into a build directory:
 ```
-mkdir -p ~/fvp-baser-aemv8r64-bsp
-cd ~/fvp-baser-aemv8r64-bsp
+mkdir -p ~/fvp-baser-aemv8r64-build
+cd ~/fvp-baser-aemv8r64-build
 git clone https://git.yoctoproject.org/git/meta-arm
 ```
=20
 ### Build
+
+Building with the standard Linux kernel:
 ```
-cd ~/fvp-baser-aemv8r64-bsp
+cd ~/fvp-baser-aemv8r64-build
 kas build meta-arm/kas/fvp-baser-aemv8r64-bsp.yml
 ```
=20
+Building with the Real-Time Linux kernel (PREEMPT\_RT):
+```
+cd ~/fvp-baser-aemv8r64-build
+kas build meta-arm/kas/fvp-baser-aemv8r64-rt-bsp.yml
+```
+
 ### Run
 To Run the Fixed Virtual Platform simulation tool you must download "Arm=
v8-R
 AEM FVP" from Arm developer (This might require the user to register) fr=
om this
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/fvp-baser-aemv8r64-preempt-rt.scc b/meta-arm-bsp/recipes-kern=
el/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-baser-aemv8r64-preempt=
-rt.scc
new file mode 100644
index 0000000..e8fea0b
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/fvp-baser-aemv8r64-preempt-rt.scc
@@ -0,0 +1,6 @@
+define KMACHINE fvp-baser-aemv8r64
+define KTYPE preempt-rt
+define KARCH arm64
+
+include ktypes/preempt-rt/preempt-rt.scc
+include fvp-baser-aemv8r64.scc
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-rt_%.bbappend =
b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-rt_%.bbappend
index 7f6030f..14da805 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-rt_%.bbappend
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-rt_%.bbappend
@@ -1,5 +1,6 @@
-# Only enable linux-yocto-rt for n1sdp
+# Only enable linux-yocto-rt for n1sdp and the Armv8-R AArch64 AEM FVP
 LINUX_YOCTO_RT_REQUIRE ?=3D ""
 LINUX_YOCTO_RT_REQUIRE_n1sdp =3D "linux-arm-platforms.inc"
+LINUX_YOCTO_RT_REQUIRE_fvp-baser-aemv8r64 =3D "linux-arm-platforms.inc"
=20
 require ${LINUX_YOCTO_RT_REQUIRE}
--=20
2.25.1

