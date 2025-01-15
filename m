Return-Path: <musa.antike@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA931C02187
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 14:23:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.22067.1736950978312808605
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 15 Jan 2025 06:22:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: musa.antike@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 657E911FB
	for <meta-arm@lists.yoctoproject.org>; Wed, 15 Jan 2025 06:23:26 -0800 (PST)
Received: from e132696.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8F5503F63F
	for <meta-arm@lists.yoctoproject.org>; Wed, 15 Jan 2025 06:22:57 -0800 (PST)
From: Musa Antike <musa.antike@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH styhead 3/5] arm-systemready/linux-distros: Implement unattended Debian
Date: Wed, 15 Jan 2025 14:22:44 +0000
Message-Id: <20250115142246.3825897-3-musa.antike@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250115142246.3825897-1-musa.antike@arm.com>
References: <20250115142246.3825897-1-musa.antike@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 15 Jan 2025 14:23:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6333

- Implement unattended installation for Debian
- Upgrade Debian version to 12.8.0

Signed-off-by: Musa Antike <musa.antike@arm.com>
---
 .../arm-systemready-linux-distros-debian.bb   | 35 +++++++--
 .../unattended-boot-conf/Debian/preseed.cfg   | 75 +++++++++++++++++++
 2 files changed, 105 insertions(+), 5 deletions(-)
 create mode 100755 meta-arm-systemready/recipes-test/arm-systemready-lin=
ux-distros/files/unattended-boot-conf/Debian/preseed.cfg

diff --git a/meta-arm-systemready/recipes-test/arm-systemready-linux-dist=
ros/arm-systemready-linux-distros-debian.bb b/meta-arm-systemready/recipe=
s-test/arm-systemready-linux-distros/arm-systemready-linux-distros-debian=
.bb
index 8dbb75c3..5e5ebc31 100644
--- a/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros-debian.bb
+++ b/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros-debian.bb
@@ -98,8 +98,33 @@ file://${COMMON_LICENSE_DIR}/OPL-1.0;md5=3Dacdf1e4398b=
d93dc137e271c50316324 \
 file://${COMMON_LICENSE_DIR}/PD;md5=3Db3597d12946881e13cb3b548d1173851 \
 "
=20
-PV =3D "12.4.0"
-# netinst, DVD-1
-ISO_TYPE =3D "netinst"
-SRC_URI =3D "https://cdimage.debian.org/mirror/cdimage/archive/${PV}/arm=
64/iso-cd/debian-${PV}-arm64-${ISO_TYPE}.iso;unpack=3D0;downloadfilename=3D=
${ISO_IMAGE_NAME}.iso"
-SRC_URI[sha256sum] =3D "d32d2c63350a932dc0d9d45665985b41413f9e01efc0eacb=
ea981d435f553d3d"
+PV =3D "12.8.0"
+SRC_URI =3D "\
+    https://cdimage.debian.org/debian-cd/12.8.0/arm64/iso-dvd/debian-12.=
8.0-arm64-DVD-1.iso;unpack=3D0;downloadfilename=3D${ISO_IMAGE_NAME}.iso;n=
ame=3Ddebian_iso_image \
+    file://unattended-boot-conf/Debian/preseed.cfg \
+    "
+SRC_URI[debian_iso_image.sha256sum] =3D "8891fe48bb5a58ae54176eaa6440059=
bf852044d6b9ae77219e78f9ef8d65149"
+
+ISO_LABEL =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TESTS", "debi=
an-12.8.0-arm64-1", "", d)}"
+BOOT_CATALOG =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TESTS", "b=
oot.catalog", "", d)}"
+BOOT_IMAGE =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TESTS", "EFI=
/boot/bootaa64.efi", "", d)}"
+EFI_IMAGE =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TESTS", "boot=
/grub/efi.img", "", d)}"
+
+modifyiso() {
+    UNATTENDED_CONF_DIR=3D"${UNPACKDIR}/unattended-boot-conf/Debian"
+
+    # Append the preseed.cfg file to the initrd
+    gunzip ${EXTRACTED_ISO_TEMP_DIR}/install.a64/initrd.gz
+    (cd ${UNATTENDED_CONF_DIR} && echo preseed.cfg | cpio -H newc -o -A =
-F ${EXTRACTED_ISO_TEMP_DIR}/install.a64/initrd)
+    gzip ${EXTRACTED_ISO_TEMP_DIR}/install.a64/initrd
+
+    #GRUB
+    # Disable timeout
+    sed -i '/^insmod gzio/ a set timeout=3D0' ${EXTRACTED_ISO_TEMP_DIR}/=
boot/grub/grub.cfg
+
+    # Update default menu entry to select automated install
+    sed -i '/^set timeout/ a set default=3D"2>5"' ${EXTRACTED_ISO_TEMP_D=
IR}/boot/grub/grub.cfg
+
+    # Update kernel boot parameters to enable more text based console ou=
tput
+    sed -i 's|linux    /install.a64/vmlinuz  auto=3Dtrue priority=3Dcrit=
ical --- quiet|linux    /install.a64/vmlinuz auto=3Dtrue priority=3Dcriti=
cal DEBIAN_FRONTEND=3Dtext --- nomodeset|g' ${EXTRACTED_ISO_TEMP_DIR}/boo=
t/grub/grub.cfg
+}
diff --git a/meta-arm-systemready/recipes-test/arm-systemready-linux-dist=
ros/files/unattended-boot-conf/Debian/preseed.cfg b/meta-arm-systemready/=
recipes-test/arm-systemready-linux-distros/files/unattended-boot-conf/Deb=
ian/preseed.cfg
new file mode 100755
index 00000000..47a38c2b
--- /dev/null
+++ b/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/fil=
es/unattended-boot-conf/Debian/preseed.cfg
@@ -0,0 +1,75 @@
+# Preconfiguration file for Debian unattended installation
+
+# Enable auto mode
+d-i auto-install/enable boolean true
+d-i debconf/priority select critical
+
+# Set language, country and locale
+d-i debian-installer/language string en
+d-i debian-installer/country string GB
+d-i debian-installer/locale string en_GB.UTF-8
+d-i keyboard-configuration/xkb-keymap select us
+
+# Set clock and timezone
+d-i clock-setup/utc boolean true
+d-i time/zone select Europe/London
+
+# Skip installing recommended packages
+d-i base-installer/install-recommends boolean false
+
+# Set user and password
+d-i passwd/root-login boolean false
+d-i passwd/user-fullname string user
+d-i passwd/username string user
+d-i passwd/user-password password unsafe
+d-i passwd/user-password-again password unsafe
+
+# Disable CD-ROM and set mirror
+d-i apt-setup/cdrom/set-first boolean false
+d-i mirror/country string manual NO
+d-i mirror/http/proxy string
+
+# Disable mirror selection
+d-i apt-setup/no_mirror boolean true
+d-i popularity-contest/participate boolean false
+
+# Skip package selection and upgrades
+d-i pkgsel/run_tasksel boolean false
+d-i pkgsel/upgrade select none
+
+# Ensure the 'dbus' package is installed
+d-i pkgsel/include string dbus
+
+# Set host and domain names
+d-i netcfg/get_hostname string debtest
+d-i netcfg/get_domain string unassigned-domain
+
+# Partitioning
+d-i partman-auto/disk string /dev/vda
+d-i partman-auto/init_automatically_partition select Guided - use entire=
 disk
+d-i partman-auto/choose_recipe select All files in one partition (recomm=
ended for new users)
+d-i partman-auto/method string regular
+d-i partman/confirm_write_new_label boolean true
+d-i partman/choose_partition select finish
+d-i partman/confirm boolean true
+d-i partman/confirm_nooverwrite boolean true
+
+# Install GRUB bootloader
+d-i grub-installer/only_debian boolean true
+d-i grub-installer/bootdev string /dev/vda
+d-i grub-installer/bootloader-id string debian
+d-i grub-installer/efi-directory string /boot/efi
+
+# Handle errors automatically
+d-i debian-installer/exit-on-error boolean true
+
+# Late command to install GRUB and finalize boot setup
+d-i preseed/late_command string \
+    mount /dev/vda1 /target/boot/efi || true; \
+    in-target mkdir -p /boot/efi/EFI/boot || true; \
+    in-target grub-install --target=3Darm64-efi --efi-directory=3D/boot/=
efi --bootloader-id=3Ddebian --removable || true; \
+    in-target update-grub || true; \
+    umount /target/boot/efi || true
+
+# Reboot after installation
+d-i finish-install/reboot_in_progress note
--=20
2.34.1


