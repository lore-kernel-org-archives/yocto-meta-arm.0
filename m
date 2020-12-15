Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.6042.1608005224624715707
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 14 Dec 2020 20:07:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: henry.wang@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECFCD1FB;
	Mon, 14 Dec 2020 20:07:03 -0800 (PST)
Received: from henry-OptiPlex-7070.shanghai.arm.com (henry-OptiPlex-7070.shanghai.arm.com [10.169.190.53])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0F26F3F66E;
	Mon, 14 Dec 2020 20:07:01 -0800 (PST)
From: "Henry Wang" <Henry.Wang@arm.com>
To: meta-arm@lists.yoctoproject.org,
	diego.sueiro@arm.com
Cc: Henry.Wang@arm.com,
	Michael.Zhao@arm.com,
	Kaly.Xin@arm.com
Subject: [PATCH] arm-autonomy/container: Add a recipe to include container image
Date: Tue, 15 Dec 2020 12:06:55 +0800
Message-Id: <20201215040655.3411553-1-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This commit implements a generic recipe to pack and import
container image to the xenguest image.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
Issue-Id: SCM-1738
Change-Id: I239b360f9a7dd1cdc050d46a40e210406ca21aae
---
 .../files/import_container.sh                 | 39 +++++++++
 .../import-docker-image.bb                    | 79 +++++++++++++++++++
 2 files changed, 118 insertions(+)
 create mode 100755 meta-arm-autonomy/recipes-containers/import-docker-im=
age/files/import_container.sh
 create mode 100644 meta-arm-autonomy/recipes-containers/import-docker-im=
age/import-docker-image.bb

diff --git a/meta-arm-autonomy/recipes-containers/import-docker-image/fil=
es/import_container.sh b/meta-arm-autonomy/recipes-containers/import-dock=
er-image/files/import_container.sh
new file mode 100755
index 0000000..a7646b3
--- /dev/null
+++ b/meta-arm-autonomy/recipes-containers/import-docker-image/files/impo=
rt_container.sh
@@ -0,0 +1,39 @@
+#!/bin/sh
+
+CONTAINER_IMAGE_FILE=3D"###CONTAINER_IMAGE_FILE###"
+CONTAINER_IMAGE_NAME_AND_TAG=3D"###CONTAINER_IMAGE_NAME_AND_TAG###"
+CONTAINER_IMAGE_FILE_KEEP=3D"###CONTAINER_IMAGE_FILE_KEEP###"
+
+has_docker_image() {
+    docker image inspect "$1" >/dev/null 2>&1
+}
+
+start() {
+    # Image does not exist and image file exists: Import the image.
+    if ! has_docker_image ${CONTAINER_IMAGE_NAME_AND_TAG} && \
+       [ -f "/usr/share/docker/images/${CONTAINER_IMAGE_FILE}" ]; then
+        echo "Importing ${CONTAINER_IMAGE_NAME_AND_TAG} container image.=
.."
+        docker import \
+               /usr/share/docker/images/${CONTAINER_IMAGE_FILE} \
+               ${CONTAINER_IMAGE_NAME_AND_TAG} 2>&1 || {
+            echo "Import ${CONTAINER_IMAGE_NAME_AND_TAG} container image=
: Failed."
+            exit $?
+        }
+        echo "Import ${CONTAINER_IMAGE_NAME_AND_TAG} container image: Do=
ne."
+
+        if [ "${CONTAINER_IMAGE_FILE_KEEP}" !=3D "1" ]; then
+            rm /usr/share/docker/images/${CONTAINER_IMAGE_FILE}
+        fi
+    fi
+}
+
+case "$1" in
+    start)
+        start && exit 0
+        ;;
+    *)
+        echo "Usage: $0 {start}"
+        exit 2
+esac
+
+exit $?
diff --git a/meta-arm-autonomy/recipes-containers/import-docker-image/imp=
ort-docker-image.bb b/meta-arm-autonomy/recipes-containers/import-docker-=
image/import-docker-image.bb
new file mode 100644
index 0000000..cdd76d5
--- /dev/null
+++ b/meta-arm-autonomy/recipes-containers/import-docker-image/import-doc=
ker-image.bb
@@ -0,0 +1,79 @@
+#
+# This recipe imports a docker container image to the xenguest image
+# Notes:
+# - Users should add docker in the local.conf of their target with
+# DISTRO_FEATURES +=3D " docker" to make sure docker is installed.
+# - The CONTAINER_IMAGE_FILE variable defines the docker
+# container image to be imported and should be set in local.conf.
+# - The CONTAINER_IMAGE_FILE_KEEP variable defines the
+# behaviour that if the container image file is kept after import.
+# Setting this variable to 1 means keep the container image file after
+# import. This variable can be set in local.conf.
+# - The CONTAINER_IMAGE_NAME_AND_TAG variable defines the name and
+# tag of the imported image. The value of this variable should follow
+# the format of `NAME:TAG`. This variable can be set in local.conf.
+#
+
+DESCRIPTION =3D "Import a docker image to xenguest"
+LICENSE =3D "MIT"
+
+LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
+
+CONTAINER_IMAGE_FILE ??=3D ""
+CONTAINER_IMAGE_FILE_KEEP ??=3D ""
+CONTAINER_IMAGE_NAME_AND_TAG ??=3D "local:local"
+
+inherit features_check
+REQUIRED_DISTRO_FEATURES =3D "docker"
+
+python __anonymous() {
+    # Check if `CONTAINER_IMAGE_FILE` is empty.
+    container_image_file =3D d.getVar('CONTAINER_IMAGE_FILE')
+    if not container_image_file:
+        raise bb.parse.SkipRecipe("CONTAINER_IMAGE_FILE is empty")
+
+    # In case we have a symlink we need to convert the link to its realp=
ath.
+    if os.path.islink(container_image_file):
+        container_image_file =3D os.path.realpath(container_image_file)
+        bb.warn("Given CONTAINER_IMAGE_FILE: %s is a symlink, "
+                "convert the link to its realpath: %s" %
+                (d.getVar('CONTAINER_IMAGE_FILE'), container_image_file)=
)
+        d.setVar('CONTAINER_IMAGE_FILE', container_image_file)
+
+    # Check if the container image file exists.
+    # The container image file here is either the real file or the symli=
nk target.
+    if not os.path.exists(container_image_file):
+        raise bb.parse.SkipRecipe("CONTAINER_IMAGE_FILE: %s does not exi=
st." %
+                                  container_image_file)
+
+    # Here we can ensure that the CONTAINER_IMAGE_FILE exists and is val=
id.
+    # Therefore we can append this file to SRC_URI.
+    d.appendVar('SRC_URI',  ' file://' + container_image_file + ';unpack=
=3D0')
+}
+
+S =3D "${WORKDIR}"
+SRC_URI =3D "file://import_container.sh"
+
+inherit update-rc.d
+INITSCRIPT_PARAMS =3D "start 30 2 3 4 5 ."
+INITSCRIPT_NAME =3D "import_container.sh"
+
+do_install() {
+    install -d ${D}${sysconfdir}/init.d
+    install -d -m 755 ${D}${datadir}/docker/images
+
+    install -m 777 ${CONTAINER_IMAGE_FILE} ${D}${datadir}/docker/images/=
.
+    install -m 755 import_container.sh ${D}${sysconfdir}/init.d
+
+    BASENAME_CONTAINER_IMAGE_FILE=3D$(basename "${CONTAINER_IMAGE_FILE}"=
)
+
+    sed -i "s,###CONTAINER_IMAGE_FILE###,${BASENAME_CONTAINER_IMAGE_FILE=
}," \
+           ${D}${sysconfdir}/init.d/import_container.sh
+    sed -i "s,###CONTAINER_IMAGE_NAME_AND_TAG###,${CONTAINER_IMAGE_NAME_=
AND_TAG}," \
+           ${D}${sysconfdir}/init.d/import_container.sh
+    sed -i "s,###CONTAINER_IMAGE_FILE_KEEP###,${CONTAINER_IMAGE_FILE_KEE=
P}," \
+           ${D}${sysconfdir}/init.d/import_container.sh
+}
+
+FILES_${PN} +=3D "${datadir}/docker/images"
+RDEPENDS_${PN} =3D "packagegroup-docker-runtime-minimal"
--=20
2.25.1

