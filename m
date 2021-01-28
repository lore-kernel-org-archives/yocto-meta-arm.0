Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.25991.1611847633007672251
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 Jan 2021 07:27:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 765891396;
	Thu, 28 Jan 2021 07:27:11 -0800 (PST)
Received: from e125920.arm.com (unknown [10.57.45.253])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D43983F7C3;
	Thu, 28 Jan 2021 07:27:10 -0800 (PST)
From: "Peter Hoyes" <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 1/2] arm-autonomy: Use correct PACKAGE_ARCH in recipes-extended
Date: Thu, 28 Jan 2021 15:27:00 +0000
Message-Id: <20210128152701.901663-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Peter Hoyes <Peter.Hoyes@arm.com>

xen-devicetree should be $MACHINE_ARCH.
xenguest-* should be allarch

Issue-Id: SCM-2039
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: Id5666e1dc02a174e74bb8e843cb588287717d136
---
 .../recipes-extended/xen-devicetree/xen-devicetree.bb           | 1 +
 meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb | 2 +-
 meta-arm-autonomy/recipes-extended/xenguest/xenguest-mkimage.bb | 2 ++
 meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb | 2 +-
 4 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-device=
tree.bb b/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetre=
e.bb
index 29b8023..db955e1 100644
--- a/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
+++ b/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
@@ -30,6 +30,7 @@ XEN_DEVICETREE_DTSI_MERGE ?=3D "xen.dtsi"
 inherit nopackages deploy
=20
 DEPENDS +=3D "dtc-native"
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 do_configure[noexec] =3D "1"
 do_compile[noexec] =3D "1"
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager=
.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
index ffb0fc3..2bfd6a9 100644
--- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
@@ -37,7 +37,7 @@ XENGUEST_MANAGER_LOG_LEVEL ?=3D "ERROR"
 INITSCRIPT_NAME =3D "xenguest"
 INITSCRIPT_PARAMS =3D "start 90 2 3 4 5 . stop 79 0 1 6 ."
=20
-inherit update-rc.d
+inherit allarch update-rc.d
=20
 do_compile() {
     echo "XENGUEST_VOLUME_DEVICE=3D\"${XENGUEST_MANAGER_VOLUME_DEVICE}\"=
" > \
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-mkimage=
.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-mkimage.bb
index 6ea5fb1..080f137 100644
--- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-mkimage.bb
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-mkimage.bb
@@ -17,6 +17,8 @@ S =3D "${WORKDIR}"
 # Can be built native also to produce xenguest images during Yocto build
 BBCLASSEXTEND =3D "native"
=20
+inherit allarch
+
 do_configure[noexec] =3D "1"
 do_compile[noexec] =3D "1"
=20
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network=
.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
index 9464d43..5f18659 100644
--- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
@@ -39,7 +39,7 @@ INITSCRIPT_PARAMS_${PN} =3D "start 01 2 3 4 5 . stop 81=
 0 1 6 ."
 INITSCRIPT_NAME_${PN}-kea-dhcp4 =3D "kea-restore-default-config"
 INITSCRIPT_PARAMS_${PN}-kea-dhcp4 =3D "defaults 20"
=20
-inherit update-rc.d
+inherit allarch update-rc.d
=20
 do_install() {
     cat ${WORKDIR}/xenguest-network-bridge.in \
--=20
2.25.1

