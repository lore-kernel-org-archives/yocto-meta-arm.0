Subject: [PATCH 1/6] qemuarm64-secureboot: changed format of memory to MB
To: meta-arm@lists.yoctoproject.org
From: "Brett Warren" <brett.warren@arm.com>
X-Originating-Location: Texas, US (217.140.99.251)
X-Originating-Platform: Linux Firefox 79
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 14 Oct 2020 04:32:44 -0700
Message-ID: <jfMm.1602675164211975716.iqhf@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="PxiS0USbFQhOrLGDPDuL"

--PxiS0USbFQhOrLGDPDuL
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

When running runqemu the memory argument in the kernel
commandline arguments expects megabytes, so with the previous
format "-m 1GM" ended up being passed.

Change-Id: I5d3bc9d5ce93fa3da5885c99feb99ce80367c993
Signed-off-by: Brett Warren <brett.warren@arm.com>
---
meta-arm/conf/machine/qemuarm64-secureboot.conf | 2 +-
1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/co=
nf/machine/qemuarm64-secureboot.conf
index a5b7401..f2c15e6 100644
--- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
+++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
@@ -12,7 +12,7 @@ PREFERRED_PROVIDER_virtual/kernel =3D "linux-yocto-dev"

QB_MACHINE =3D "-machine virt,secure=3Don"
QB_OPT_APPEND +=3D "-no-acpi"
-QB_MEM =3D "-m 1G"
+QB_MEM =3D "-m 1024"
QB_DEFAULT_FSTYPE =3D "wic.qcow2"
QB_DEFAULT_BIOS =3D "flash.bin"
QB_FSINFO =3D "wic:no-kernel-in-fs"
--
2.17.1

--PxiS0USbFQhOrLGDPDuL
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

When running runqemu the memory argument in the kernel<br />commandline arg=
uments expects megabytes, so with the previous<br />format "-m 1GM" ended u=
p being passed.<br /><br />Change-Id: I5d3bc9d5ce93fa3da5885c99feb99ce80367=
c993<br />Signed-off-by: Brett Warren &lt;brett.warren@arm.com&gt;<br />---=
<br />&nbsp;meta-arm/conf/machine/qemuarm64-secureboot.conf | 2 +-<br />&nb=
sp;1 file changed, 1 insertion(+), 1 deletion(-)<br /><br />diff --git a/me=
ta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/conf/machine/qemua=
rm64-secureboot.conf<br />index a5b7401..f2c15e6 100644<br />--- a/meta-arm=
/conf/machine/qemuarm64-secureboot.conf<br />+++ b/meta-arm/conf/machine/qe=
muarm64-secureboot.conf<br />@@ -12,7 +12,7 @@ PREFERRED_PROVIDER_virtual/k=
ernel =3D "linux-yocto-dev"<br />&nbsp;<br />&nbsp;QB_MACHINE =3D "-machine=
 virt,secure=3Don"<br />&nbsp;QB_OPT_APPEND +=3D "-no-acpi"<br />-QB_MEM =
=3D "-m 1G"<br />+QB_MEM =3D "-m 1024"<br />&nbsp;QB_DEFAULT_FSTYPE =3D "w=
ic.qcow2"<br />&nbsp;QB_DEFAULT_BIOS =3D "flash.bin"<br />&nbsp;QB_FSINFO =
=3D "wic:no-kernel-in-fs"<br />-- <br />2.17.1

--PxiS0USbFQhOrLGDPDuL--
