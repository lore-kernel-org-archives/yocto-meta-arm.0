Return-Path: <amr.mohamed@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED3AC3DA64
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 14:39:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.44604.1722436796389651829
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 31 Jul 2024 07:39:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: amr.mohamed@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E74FE1007;
	Wed, 31 Jul 2024 07:40:20 -0700 (PDT)
Received: from e125330.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5B3043F5A1;
	Wed, 31 Jul 2024 07:39:54 -0700 (PDT)
From: amr.mohamed@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Amr Mohamed <amr.mohamed@arm.com>,
	Jon Mason <jon.mason@arm.com>
Subject: [PATCH scarthgap 1/4] arm-systemready/linux-distros: new inc file for unattended installation
Date: Wed, 31 Jul 2024 15:39:44 +0100
Message-Id: <20240731143947.2502491-1-amr.mohamed@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 31 Jul 2024 14:39:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5936

From: Amr Mohamed <amr.mohamed@arm.com>

Add a new inc file to unpack and repack the distro ISO image after
adding the kickstart configuration file inside.

Signed-off-by: Amr Mohamed <amr.mohamed@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...m-systemready-linux-distros-unattended.inc | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 meta-arm-systemready/recipes-test/arm-systemready-lin=
ux-distros/arm-systemready-linux-distros-unattended.inc

diff --git a/meta-arm-systemready/recipes-test/arm-systemready-linux-dist=
ros/arm-systemready-linux-distros-unattended.inc b/meta-arm-systemready/r=
ecipes-test/arm-systemready-linux-distros/arm-systemready-linux-distros-u=
nattended.inc
new file mode 100644
index 00000000..f8c9c6c5
--- /dev/null
+++ b/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros-unattended.inc
@@ -0,0 +1,45 @@
+SUMMARY =3D "Arm SystemReady Linux distros unattended requirements"
+DESCRIPTION =3D "Arm SystemReady Linux distro unattended configurations =
\
+               and ISO image modification"
+
+EXTRACTED_ISO_TEMP_DIR =3D "${WORKDIR}/extracted_iso_temp_dir"
+NEW_ISO_TEMP_DIR =3D "${WORKDIR}/new_iso_temp_dir"
+
+# oeqa test case must be added to TEST_SUITES to acknowledge that the un=
attended
+# installation was successful.
+inherit testimage
+
+python () {
+    unattended_required_vars =3D ['ISO_LABEL', 'BOOT_CATALOG', 'BOOT_IMA=
GE', 'EFI_IMAGE']
+
+    for var in unattended_required_vars:
+        if not d.getVar(var):
+            raise bb.parse.SkipRecipe(f'{var} variable is not set')
+}
+
+unpackiso() {
+    # Unpack the ISO image
+    bsdtar -xf ${WORKDIR}/${ISO_IMAGE_NAME}.iso -C ${EXTRACTED_ISO_TEMP_=
DIR}
+    chmod -R u+rw ${EXTRACTED_ISO_TEMP_DIR}
+}
+
+modifyiso() {
+
+}
+
+repackiso() {
+    # Repack the ISO image
+    mkisofs -o ${NEW_ISO_TEMP_DIR}/${ISO_IMAGE_NAME}.iso -U -r -v -T -J =
-joliet-long -V ${ISO_LABEL} \
+            -volset ${ISO_LABEL} -A ${ISO_LABEL} -b ${BOOT_IMAGE} -c ${B=
OOT_CATALOG} -no-emul-boot \
+            -boot-load-size 4 -boot-info-table -J -R -V ${ISO_LABEL} -el=
torito-alt-boot \
+            -eltorito-boot ${EFI_IMAGE} -no-emul-boot ${EXTRACTED_ISO_TE=
MP_DIR}
+
+    mv -f ${NEW_ISO_TEMP_DIR}/${ISO_IMAGE_NAME}.iso ${WORKDIR}
+}
+
+# Write the test data in IMAGE_POSTPROCESS_COMMAND
+IMAGE_POSTPROCESS_COMMAND +=3D "write_image_test_data; "
+
+do_unpack[depends] +=3D "cdrtools-native:do_populate_sysroot libarchive-=
native:do_populate_sysroot"
+do_unpack[postfuncs] +=3D "unpackiso modifyiso repackiso"
+do_unpack[cleandirs] +=3D "${EXTRACTED_ISO_TEMP_DIR} ${NEW_ISO_TEMP_DIR}=
"
\ No newline at end of file
--=20
2.25.1


