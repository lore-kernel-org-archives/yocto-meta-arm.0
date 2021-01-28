Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.26330.1611847635971395401
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 Jan 2021 07:27:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93E0B1396;
	Thu, 28 Jan 2021 07:27:15 -0800 (PST)
Received: from e125920.arm.com (unknown [10.57.45.253])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C5B283F7C3;
	Thu, 28 Jan 2021 07:27:14 -0800 (PST)
From: "Peter Hoyes" <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 2/2] arm-autonomy: Use busybox instead of GNU tar
Date: Thu, 28 Jan 2021 15:27:01 +0000
Message-Id: <20210128152701.901663-2-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128152701.901663-1-peter.hoyes@arm.com>
References: <20210128152701.901663-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Peter Hoyes <Peter.Hoyes@arm.com>

Switch out the tar used by xenguest-manager and xenguest-mkimage.
xenguest-mkimage requires the --exclude flag so enable the Busybox
CONFIG_FEATURE_TAR_LONG_OPTIONS option.

Issue-Id: SCM-2034
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: Iceed017ef8ebd058e6c06156989aaa2a4bff9103
---
 .../recipes-core/busybox/busybox/feature_tar_long_options.cfg | 1 +
 meta-arm-autonomy/recipes-core/busybox/busybox_%.bbappend     | 4 ++++
 .../recipes-extended/xenguest/xenguest-manager.bb             | 2 +-
 .../recipes-extended/xenguest/xenguest-mkimage.bb             | 4 ++--
 4 files changed, 8 insertions(+), 3 deletions(-)
 create mode 100644 meta-arm-autonomy/recipes-core/busybox/busybox/featur=
e_tar_long_options.cfg
 create mode 100644 meta-arm-autonomy/recipes-core/busybox/busybox_%.bbap=
pend

diff --git a/meta-arm-autonomy/recipes-core/busybox/busybox/feature_tar_l=
ong_options.cfg b/meta-arm-autonomy/recipes-core/busybox/busybox/feature_=
tar_long_options.cfg
new file mode 100644
index 0000000..151a3df
--- /dev/null
+++ b/meta-arm-autonomy/recipes-core/busybox/busybox/feature_tar_long_opt=
ions.cfg
@@ -0,0 +1 @@
+CONFIG_FEATURE_TAR_LONG_OPTIONS=3Dy
diff --git a/meta-arm-autonomy/recipes-core/busybox/busybox_%.bbappend b/=
meta-arm-autonomy/recipes-core/busybox/busybox_%.bbappend
new file mode 100644
index 0000000..e335581
--- /dev/null
+++ b/meta-arm-autonomy/recipes-core/busybox/busybox_%.bbappend
@@ -0,0 +1,4 @@
+FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
+
+# The --exclude flag in Busybox tar is required by xenguest-mkimage
+SRC_URI +=3D "file://feature_tar_long_options.cfg"
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager=
.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
index 2bfd6a9..d7b256f 100644
--- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
@@ -63,7 +63,7 @@ do_install() {
 }
=20
 # Things that we need on the target
-RDEPENDS_${PN} +=3D "bash tar xenguest-mkimage lvm2 xen-tools parted e2f=
sprogs \
+RDEPENDS_${PN} +=3D "bash xenguest-mkimage lvm2 xen-tools parted e2fspro=
gs \
                    dosfstools logrotate"
=20
 FILES_${PN} +=3D "${bindir}/xenguest-manager \
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-mkimage=
.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-mkimage.bb
index 080f137..047ca9f 100644
--- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-mkimage.bb
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-mkimage.bb
@@ -27,7 +27,7 @@ do_install() {
     install -m 755 xenguest-mkimage ${D}${bindir}/.
 }
=20
-# We need bash and tar
-RDEPENDS_${PN} =3D "bash tar"
+# We need bash
+RDEPENDS_${PN} =3D "bash"
 FILES_${PN} =3D "${bindir}/xenguest-mkimage"
=20
--=20
2.25.1

