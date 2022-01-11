Return-Path: <rfairfax@microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4BC0C433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 00:07:20 +0000 (UTC)
Subject: [PATCH] arm/optee-os: Fix build race condition when using fTPM
To: meta-arm@lists.yoctoproject.org
From: "Ryan Fairfax" <rfairfax@microsoft.com>
X-Originating-Location: Redmond, Washington, US (71.227.177.100)
X-Originating-Platform: Windows Chrome 97
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 10 Jan 2022 16:07:19 -0800
Message-ID: <rRI3.1641859639524975819.4njv@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="PxLh8Z7KVjjzLiblkZiv"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 11 Jan 2022 00:07:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2811

--PxLh8Z7KVjjzLiblkZiv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Update dependencies to depend on optee-ftpm:do_deploy instead of do_populat=
e_sysroot since binaries are being referenced from DEPLOY_DIR_IMAGE.

Signed-off-by: Ryan Fairfax <rfairfax@microsoft.com>
---
.../recipes-security/optee-ftpm/optee-os_%.bbappend=C2=A0 | 12 ++++++------
1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend b/met=
a-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
index 0cfa949..6e2edce 100644
--- a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
+++ b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
@@ -1,11 +1,11 @@
FTPM_UUID=3D"bc50d971-d4c9-42c4-82cb-343fb7f37896"

-DEPENDS:append =3D "\
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils=
.contains('MACHINE_FEATURES', \
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'optee-ftpm'=
, \
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'optee-ftpm'=
, \
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'' , \
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d)}"
+do_compile[depends] +=3D "\
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0${@bb.utils.contains('MACHINE_FEATURES', \
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 'optee-ftpm', \
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 'optee-ftpm:do_deploy', \
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 '' , \
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 d)}"

EXTRA_OEMAKE:append =3D "${@bb.utils.contains('MACHINE_FEATURES', \
'optee-ftpm', \
--
2.25.1

--PxLh8Z7KVjjzLiblkZiv
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div><br />Update dependencies to depend on optee-ftpm:do_deploy instead of=
 do_populate_sysroot since binaries are being referenced from DEPLOY_DIR_IM=
AGE.</div>
<div>&nbsp;</div>
<div>Signed-off-by: Ryan Fairfax &lt;rfairfax@microsoft.com&gt;</div>
<div>---</div>
<div>&nbsp;.../recipes-security/optee-ftpm/optee-os_%.bbappend&nbsp; | 12 +=
+++++------</div>
<div>&nbsp;1 file changed, 6 insertions(+), 6 deletions(-)</div>
<div>&nbsp;</div>
<div>diff --git a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend =
b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend</div>
<div>index 0cfa949..6e2edce 100644</div>
<div>--- a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend</div>
<div>+++ b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend</div>
<div>@@ -1,11 +1,11 @@</div>
<div>&nbsp;FTPM_UUID=3D"bc50d971-d4c9-42c4-82cb-343fb7f37896"</div>
<div>&nbsp;</div>
<div>-DEPENDS:append =3D "\</div>
<div>-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ${@bb.=
utils.contains('MACHINE_FEATURES', \</div>
<div>-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'optee-=
ftpm', \</div>
<div>-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'optee-=
ftpm', \</div>
<div>-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'' , \<=
/div>
<div>-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;d)}"</d=
iv>
<div>+do_compile[depends] +=3D "\</div>
<div>+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;${@bb.utils.contains('MACHINE_FEATURES', \</div>
<div>+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; 'optee-ftpm', \</div>
<div>+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; 'optee-ftpm:do_deploy', \</div>
<div>+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; '' , \</div>
<div>+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; d)}"</div>
<div>&nbsp;</div>
<div>&nbsp;EXTRA_OEMAKE:append =3D "${@bb.utils.contains('MACHINE_FEATURES'=
, \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;'optee-ftpm', \</div>
<div>--&nbsp;</div>
<div>2.25.1</div>
<div>&nbsp;</div>

--PxLh8Z7KVjjzLiblkZiv--

