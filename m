Return-Path: <rfairfax@microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94641C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 16:58:50 +0000 (UTC)
Subject: [PATCH v2] arm/optee-os: Fix build race condition when building fTPM
To: meta-arm@lists.yoctoproject.org
From: "Ryan Fairfax" <rfairfax@microsoft.com>
X-Originating-Location: Redmond, Washington, US (71.227.177.100)
X-Originating-Platform: Windows Chrome 97
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 11 Jan 2022 08:58:48 -0800
Message-ID: <jKa2.1641920328439478855.fAON@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="SDI0LfB3vb4Nbc8uOCxw"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 11 Jan 2022 16:58:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2813

--SDI0LfB3vb4Nbc8uOCxw
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

[PATCH v2] arm/optee-os: Fix build race condition when building fTPM

Change optee-ftpm to install embeddable (stripped) version to target sysroo=
t.=C2=A0 When building optee-os pick up from sysroot instead of DEPLOY_DIR_=
IMAGE.=C2=A0 This fixes a build race condition where DEPENDS was only addin=
g a dependency for optee-ftpm:do_populate_sysroot instead of do_deploy and =
makes the usage of dependencies a bit more standard by using sysroots inste=
ad of deploy output.

Signed-off-by: Ryan Fairfax <rfairfax@microsoft.com>
---
meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb=C2=A0 =C2=A0| 6 ++++=
+-
meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend | 2 +-
2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb b/meta-=
arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
index e30e13a..f2a74da 100644
--- a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
+++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
@@ -60,6 +60,7 @@ do_compile() {
do_install () {
mkdir -p ${D}/lib/optee_armtz
install -D -p -m 0644 ${S}/TAs/optee_ta/out/fTPM/${FTPM_UUID}.ta ${D}/lib/o=
ptee_armtz/
+=C2=A0 =C2=A0 install -D -p -m 0644 ${S}/TAs/optee_ta/out/fTPM/${FTPM_UUID=
}.stripped.elf ${D}/lib/optee_armtz/
}

do_deploy () {
@@ -69,7 +70,10 @@ do_deploy () {

addtask deploy before do_build after do_install

-FILES:${PN} +=3D "${nonarch_base_libdir}/optee_armtz/${FTPM_UUID}.ta"
+FILES:${PN} +=3D " \
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${nonarch_base_libd=
ir}/optee_armtz/${FTPM_UUID}.ta \
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${nonarch_base_libd=
ir}/optee_armtz/${FTPM_UUID}.stripped.elf \
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"

# Imports machine specific configs from staging to build
PACKAGE_ARCH =3D "${MACHINE_ARCH}"
diff --git a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend b/met=
a-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
index 0cfa949..acea750 100644
--- a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
+++ b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
@@ -9,6 +9,6 @@ DEPENDS:append =3D "\

EXTRA_OEMAKE:append =3D "${@bb.utils.contains('MACHINE_FEATURES', \
'optee-ftpm', \
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 'CFG_EARLY_TA=3Dy EARLY_TA_PATHS=3D"${DEPLOY_DIR_IMAGE}/optee/${FTPM_UU=
ID}.stripped.elf"', \
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 'CFG_EARLY_TA=3Dy EARLY_TA_PATHS=3D"${STAGING_DIR_TARGET}/lib/optee_arm=
tz/${FTPM_UUID}.stripped.elf"', \
'', \
d)} "
--
2.25.1

--SDI0LfB3vb4Nbc8uOCxw
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>[PATCH v2] arm/optee-os: Fix build race condition when building fTPM</=
div>
<div>&nbsp;</div>
<div>Change optee-ftpm to install embeddable (stripped) version to target s=
ysroot.&nbsp; When building optee-os pick up from sysroot instead of DEPLOY=
_DIR_IMAGE.&nbsp; This fixes a build race condition where DEPENDS was only =
adding a dependency for optee-ftpm:do_populate_sysroot instead of do_deploy=
 and makes the usage of dependencies a bit more standard by using sysroots =
instead of deploy output.</div>
<div>&nbsp;</div>
<div>Signed-off-by: Ryan Fairfax &lt;rfairfax@microsoft.com&gt;</div>
<div>---</div>
<div>&nbsp;meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb&nbsp; &nb=
sp;| 6 +++++-</div>
<div>&nbsp;meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend | 2 +-<=
/div>
<div>&nbsp;2 files changed, 6 insertions(+), 2 deletions(-)</div>
<div>&nbsp;</div>
<div>diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb b/=
meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb</div>
<div>index e30e13a..f2a74da 100644</div>
<div>--- a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb</div>
<div>+++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb</div>
<div>@@ -60,6 +60,7 @@ do_compile() {</div>
<div>&nbsp;do_install () {</div>
<div>&nbsp; &nbsp; &nbsp;mkdir -p ${D}/lib/optee_armtz</div>
<div>&nbsp; &nbsp; &nbsp;install -D -p -m 0644 ${S}/TAs/optee_ta/out/fTPM/$=
{FTPM_UUID}.ta ${D}/lib/optee_armtz/</div>
<div>+&nbsp; &nbsp; install -D -p -m 0644 ${S}/TAs/optee_ta/out/fTPM/${FTPM=
_UUID}.stripped.elf ${D}/lib/optee_armtz/</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;do_deploy () {</div>
<div>@@ -69,7 +70,10 @@ do_deploy () {</div>
<div>&nbsp;</div>
<div>&nbsp;addtask deploy before do_build after do_install</div>
<div>&nbsp;</div>
<div>-FILES:${PN} +=3D "${nonarch_base_libdir}/optee_armtz/${FTPM_UUID}.ta"=
</div>
<div>+FILES:${PN} +=3D " \</div>
<div>+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;${nonarch_base=
_libdir}/optee_armtz/${FTPM_UUID}.ta \</div>
<div>+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;${nonarch_base=
_libdir}/optee_armtz/${FTPM_UUID}.stripped.elf \</div>
<div>+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"</div>
<div>&nbsp;</div>
<div>&nbsp;# Imports machine specific configs from staging to build</div>
<div>&nbsp;PACKAGE_ARCH =3D "${MACHINE_ARCH}"</div>
<div>diff --git a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend =
b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend</div>
<div>index 0cfa949..acea750 100644</div>
<div>--- a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend</div>
<div>+++ b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend</div>
<div>@@ -9,6 +9,6 @@ DEPENDS:append =3D "\</div>
<div>&nbsp;</div>
<div>&nbsp;EXTRA_OEMAKE:append =3D "${@bb.utils.contains('MACHINE_FEATURES'=
, \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;'optee-ftpm', \</div>
<div>-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; 'CFG_EARLY_TA=3Dy EARLY_TA_PATHS=3D"${DEPLOY_DIR_IMAGE}/optee/${FTP=
M_UUID}.stripped.elf"', \</div>
<div>+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; 'CFG_EARLY_TA=3Dy EARLY_TA_PATHS=3D"${STAGING_DIR_TARGET}/lib/optee=
_armtz/${FTPM_UUID}.stripped.elf"', \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;'', \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;d)} "</div>
<div>--&nbsp;</div>
<div>2.25.1</div>
<div>&nbsp;</div>

--SDI0LfB3vb4Nbc8uOCxw--

