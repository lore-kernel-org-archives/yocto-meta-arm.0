Return-Path: <mohammedjavitham@ami.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 781BAD3B7EA
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 06:30:29 +0000 (UTC)
Subject: [PATCH] arm/fvp-base-a-aem: update to 11.30.27
To: meta-arm@lists.yoctoproject.org
From: "Mohammed Javith Akthar M" <mohammedjavitham@ami.com>
X-Originating-Location: Meerut, Uttar Pradesh, IN (14.98.237.30)
X-Originating-Platform: Windows Edge 143
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 08 Dec 2025 22:30:24 -0800
References: <SA1PR10MB5885A090DB0B9F373F6A84F6DEA2A@SA1PR10MB5885.namprd10.prod.outlook.com> <20251208182626.GH11121@denix.org>
In-Reply-To: <20251208182626.GH11121@denix.org>
Message-ID: <69524.1765261824486362826@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="TYBAAHUBBKpkUvjafN6Q"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 09 Dec 2025 06:30:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6789

--TYBAAHUBBKpkUvjafN6Q
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Update Armv-A Base RevC AEM FVP to latest version

Testing:

Able to boot openbmc firmware in updated fvp
./meta-arm/scripts/runfvp --console build/fvp/tmp/deploy/images/fvp/obmc-ph=
osphor-image-fvp.fvpconf

License-Update: checksum refreshed for third-party license texts; LICENSE f=
amilies unchanged.

Signed-off-by: Mohammed Javith Akthar M <mohammedjavitham@ami.com>
---
...-base-a-aem_11.29.27.bb =3D> fvp-base-a-aem_11.30.27.bb} | 8 ++++----
1 file changed, 4 insertions(+), 4 deletions(-)
rename meta-arm/recipes-devtools/fvp/{fvp-base-a-aem_11.29.27.bb =3D> fvp-b=
ase-a-aem_11.30.27.bb} (64%)
diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.29.27.bb b/met=
a-arm/recipes-devtools/fvp/fvp-base-a-aem_11.30.27.bb
similarity index 64%
rename from meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.29.27.bb
rename to meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.30.27.bb
index a45fa153..23bf7a16 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.29.27.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.30.27.bb
@@ -4,11 +4,11 @@ LICENSE:append =3D " & Artistic-2.0 & BSL-1.0 & BSD-2-Cla=
use & Unlicense"
SUMMARY =3D "Arm Fixed Virtual Platform - Armv-A Base RevC Architecture Env=
elope Model FVP"
LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1a33=
828e132ba71861c11688dbb0bd16 \
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file=
://license_terms/third_party_licenses/third_party_licenses.txt;md5=3D92ea58=
bb219213dfdc48111b693019b6 \
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file=
://license_terms/third_party_licenses/arm_license_management_utilities/thir=
d_party_licenses.txt;md5=3Dabcaafefc7b7a0cdf6664c51f9075c5b"
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://license_terms/third_party_licenses/third_party_licenses.txt;md5=3Da5ce56=
e117d0ab63791fbb7c35ec2211 \
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file=
://license_terms/third_party_licenses/arm_license_management_utilities/thir=
d_party_licenses.txt;md5=3D25c38921c5071644ed088288e5bd9b8e"
-SRC_URI[fvp-aarch64.sha256sum] =3D "8fce0dc6346c37b0df4809d08b599463c880b6=
375f9b58d89a73fa6f9ab2e129"
-SRC_URI[fvp-x86_64.sha256sum] =3D "8a8c4a609c32890ce96799aa7319fff3ecf752c=
7a9dab52b2e968cb80cc1836f"
+SRC_URI[fvp-aarch64.sha256sum] =3D "6b72a16f12ef619faeb9f441350c04b6c12687=
693061a4d2621e942cfaec5eab"
+SRC_URI[fvp-x86_64.sha256sum] =3D "59d8d74dc9580e64a77c73fb571bdd3c0f58340=
7dd6442de4c886086b8513df9"
# The CSS used in the FVP homepage make it too difficult to query with the =
tooling currently in Yocto
UPSTREAM_VERSION_UNKNOWN =3D "1"

--TYBAAHUBBKpkUvjafN6Q
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>Update Armv-A Base RevC AEM FVP to latest version</div>
<div>&nbsp;</div>
<div>Testing:</div>
<div>&nbsp;</div>
<div>Able to boot openbmc firmware in updated fvp<br />./meta-arm/scripts/r=
unfvp --console build/fvp/tmp/deploy/images/fvp/obmc-phosphor-image-fvp.fvp=
conf</div>
<div>&nbsp;</div>
<div>License-Update: checksum refreshed for third-party license texts; LICE=
NSE families unchanged.</div>
<div>&nbsp;</div>
<div>Signed-off-by: Mohammed Javith Akthar M &lt;mohammedjavitham@ami.com&g=
t;<br />---<br />&nbsp;...-base-a-aem_11.29.27.bb =3D&gt; fvp-base-a-aem_11=
.30.27.bb} | 8 ++++----<br />&nbsp;1 file changed, 4 insertions(+), 4 delet=
ions(-)<br />&nbsp;rename meta-arm/recipes-devtools/fvp/{fvp-base-a-aem_11.=
29.27.bb =3D&gt; fvp-base-a-aem_11.30.27.bb} (64%)</div>
<div>diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.29.27.bb =
b/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.30.27.bb<br />similarity =
index 64%<br />rename from meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.=
29.27.bb<br />rename to meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.30.=
27.bb<br />index a45fa153..23bf7a16 100644<br />--- a/meta-arm/recipes-devt=
ools/fvp/fvp-base-a-aem_11.29.27.bb<br />+++ b/meta-arm/recipes-devtools/fv=
p/fvp-base-a-aem_11.30.27.bb<br />@@ -4,11 +4,11 @@ LICENSE:append =3D " &a=
mp; Artistic-2.0 &amp; BSL-1.0 &amp; BSD-2-Clause &amp; Unlicense"</div>
<div>&nbsp;SUMMARY =3D "Arm Fixed Virtual Platform - Armv-A Base RevC Archi=
tecture Envelope Model FVP"<br />&nbsp;LIC_FILES_CHKSUM =3D "file://license=
_terms/license_agreement.txt;md5=3D1a33828e132ba71861c11688dbb0bd16 \<br />=
- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;file=
://license_terms/third_party_licenses/third_party_licenses.txt;md5=3D92ea58=
bb219213dfdc48111b693019b6 \<br />- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;file://license_terms/third_party_licenses/arm=
_license_management_utilities/third_party_licenses.txt;md5=3Dabcaafefc7b7a0=
cdf6664c51f9075c5b"<br />+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; file://license_terms/third_party_licenses/third_party_=
licenses.txt;md5=3Da5ce56e117d0ab63791fbb7c35ec2211 \<br />+ &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;file://license_terms=
/third_party_licenses/arm_license_management_utilities/third_party_licenses=
.txt;md5=3D25c38921c5071644ed088288e5bd9b8e"</div>
<div>-SRC_URI[fvp-aarch64.sha256sum] =3D "8fce0dc6346c37b0df4809d08b599463c=
880b6375f9b58d89a73fa6f9ab2e129"<br />-SRC_URI[fvp-x86_64.sha256sum] =3D "8=
a8c4a609c32890ce96799aa7319fff3ecf752c7a9dab52b2e968cb80cc1836f"<br />+SRC_=
URI[fvp-aarch64.sha256sum] =3D "6b72a16f12ef619faeb9f441350c04b6c1268769306=
1a4d2621e942cfaec5eab"<br />+SRC_URI[fvp-x86_64.sha256sum] =3D "59d8d74dc95=
80e64a77c73fb571bdd3c0f583407dd6442de4c886086b8513df9"</div>
<div>&nbsp;# The CSS used in the FVP homepage make it too difficult to quer=
y with the tooling currently in Yocto<br />&nbsp;UPSTREAM_VERSION_UNKNOWN =
=3D "1"</div>
</div>

--TYBAAHUBBKpkUvjafN6Q--

