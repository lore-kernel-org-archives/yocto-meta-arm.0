Subject: [PATCH 4/6] trusted-firmware-a: enable clang support
To: meta-arm@lists.yoctoproject.org
From: "Brett Warren" <brett.warren@arm.com>
X-Originating-Location: Texas, US (217.140.99.251)
X-Originating-Platform: Linux Firefox 79
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 14 Oct 2020 04:35:40 -0700
Message-ID: <zqRO.1602675340230154946.JbqS@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="Gws0Bkx1ZtKtucUvOk57"

--Gws0Bkx1ZtKtucUvOk57
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The CC and LD parameters are used to point make to the currently
used compiler and linkers.

This change enables TFA to be compiled successfully when
TOOLCHAIN=3Dclang.

Change-Id: Ice465318b8c9b2b69c08fe4f48f6d36c610978f0
Signed-off-by: Brett Warren <brett.warren@arm.com>
---
.../trusted-firmware-a/trusted-firmware-a.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 11 +++++++++++
1 file changed, 11 insertions(+)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.in=
c b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 8b19d68..98085d0 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -78,6 +78,17 @@ do_configure[noexec] =3D "1"
DEPENDS_append =3D " dtc-native openssl-native"
DEPENDS_append_aarch64_qemuall ?=3D " optee-os"

+# CC and LD introduce arguments which conflict with those otherwise provi=
ded by
+# this recipe. The heads of these variables excluding those arguments
+# are therefore used instead.
+def remove_options_tail (in_string):
+=C2=A0=C2=A0=C2=A0 from itertools import takewhile
+=C2=A0=C2=A0=C2=A0 return ' '.join(takewhile(lambda x: not x.startswith('=
-'), in_string.split(' ')))
+
+EXTRA_OEMAKE +=3D "LD=3D${@remove_options_tail(d.getVar('LD'))}"
+
+EXTRA_OEMAKE +=3D "CC=3D${@remove_options_tail(d.getVar('CC'))}"
+
EXTRA_OEMAKE +=3D "V=3D1"

# Add platform parameter
--
2.17.1

--Gws0Bkx1ZtKtucUvOk57
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The CC and LD parameters are used to point make to the currently<br />used =
compiler and linkers.<br /><br />This change enables TFA to be compiled suc=
cessfully when<br />TOOLCHAIN=3Dclang.<br /><br />Change-Id: Ice465318b8c9b=
2b69c08fe4f48f6d36c610978f0<br />Signed-off-by: Brett Warren &lt;brett.warr=
en@arm.com&gt;<br />---<br />&nbsp;.../trusted-firmware-a/trusted-firmware-=
a.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 11 +++++++++++<br /=
>&nbsp;1 file changed, 11 insertions(+)<br /><br />diff --git a/meta-arm/re=
cipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/=
trusted-firmware-a/trusted-firmware-a.inc<br />index 8b19d68..98085d0 10064=
4<br />--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc=
<br />+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc<=
br />@@ -78,6 +78,17 @@ do_configure[noexec] =3D "1"<br />&nbsp;DEPENDS_app=
end =3D " dtc-native openssl-native"<br />&nbsp;DEPENDS_append_aarch64_qemu=
all ?=3D " optee-os"<br />&nbsp;<br />+# CC and LD introduce arguments whic=
h conflict with those otherwise provided by<br />+# this recipe. The heads =
of these variables excluding those arguments<br />+# are therefore used ins=
tead.<br />+def remove_options_tail (in_string):<br />+&nbsp;&nbsp;&nbsp; f=
rom itertools import takewhile<br />+&nbsp;&nbsp;&nbsp; return ' '.join(tak=
ewhile(lambda x: not x.startswith('-'), in_string.split(' ')))<br />+<br />=
+EXTRA_OEMAKE +=3D "LD=3D${@remove_options_tail(d.getVar('LD'))}"<br />+<br=
 />+EXTRA_OEMAKE +=3D "CC=3D${@remove_options_tail(d.getVar('CC'))}"<br />+=
<br />&nbsp;EXTRA_OEMAKE +=3D "V=3D1"<br />&nbsp;<br />&nbsp;# Add platform=
 parameter<br />-- <br />2.17.1

--Gws0Bkx1ZtKtucUvOk57--
