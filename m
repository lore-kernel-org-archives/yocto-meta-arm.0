Subject: invalid characters in license '${EAT_GCC_LICENSE}'
To: meta-arm@lists.yoctoproject.org
From: "Piotr" <piotr.piwko@gmail.com>
X-Originating-Location: Wrocław, Lower Silesia, PL (185.75.1.34)
X-Originating-Platform: Linux Chrome 87
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 11 Jan 2021 04:48:37 -0800
Message-ID: <db7M.1610369317172636984.vXd0@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="fSSGvCBXmpRK7VAYeKpZ"

--fSSGvCBXmpRK7VAYeKpZ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I've just updated all corresponding repositories to the latest dunfell bra=
nches, and found that there is a problem with parsing the=C2=A0external-arm=
-sdk-toolchain.bb recipe:

ERROR: /home/piotr/prj/yocto.main/build/project/../../meta-arm/meta-arm-to=
olchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.=
bb: external-arm-sdk-toolchain-arm-${EAT_VER_MAIN}: invalid characters in l=
icense '${EAT_GCC_LICENSE}'
ERROR: Failed to parse recipe: /home/piotr/prj/yocto.main/build/project/..=
/../meta-arm/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/ext=
ernal-arm-sdk-toolchain.bb

I've analyzed that and it seems like there is missing a license.inc includ=
ing, as it is done in external-arm-toolchain.bb recipe. The same issue occu=
rs with EAT_GDB_LICENSE:

ERROR: /home/piotr/prj/yocto.main/build/project/../../meta-arm/meta-arm-to=
olchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.=
bb: external-arm-sdk-toolchain-arm-${EAT_VER_MAIN}: invalid characters in l=
icense '${EAT_GDB_LICENSE}'
ERROR: Failed to parse recipe: /home/piotr/prj/yocto.main/build/project/..=
/../meta-arm/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/ext=
ernal-arm-sdk-toolchain.bb

Should I do something extra to make the latest branch working, or it is a =
bug which shall be fixed?

Thank you in advance for help,

--
Piotr Piwko

--fSSGvCBXmpRK7VAYeKpZ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,&nbsp;<br /><br />I've just updated all corresponding repositories to th=
e latest dunfell branches, and found that there is a problem with parsing t=
he&nbsp;external-arm-sdk-toolchain.bb recipe:<br /><br />
<div>ERROR: /home/piotr/prj/yocto.main/build/project/../../meta-arm/meta-a=
rm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolc=
hain.bb: external-arm-sdk-toolchain-arm-${EAT_VER_MAIN}: invalid characters=
 in license '${EAT_GCC_LICENSE}'</div>
<div>ERROR: Failed to parse recipe: /home/piotr/prj/yocto.main/build/proje=
ct/../../meta-arm/meta-arm-toolchain/recipes-devtools/external-arm-toolchai=
n/external-arm-sdk-toolchain.bb<br /><br />I've analyzed that and it seems =
like there is missing a license.inc including, as it is done in external-ar=
m-toolchain.bb recipe. The same issue occurs with EAT_GDB_LICENSE:<br /><br=
 />ERROR: /home/piotr/prj/yocto.main/build/project/../../meta-arm/meta-arm-=
toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchai=
n.bb: external-arm-sdk-toolchain-arm-${EAT_VER_MAIN}: invalid characters in=
 license '${EAT_GDB_LICENSE}'<br />ERROR: Failed to parse recipe: /home/pio=
tr/prj/yocto.main/build/project/../../meta-arm/meta-arm-toolchain/recipes-d=
evtools/external-arm-toolchain/external-arm-sdk-toolchain.bb<br /><br />Sho=
uld I do something extra to make the latest branch working, or it is a bug =
which shall be fixed?<br /><br />Thank you in advance for help,&nbsp;<br />=
<br />--&nbsp;<br />Piotr Piwko<br /><br /></div>

--fSSGvCBXmpRK7VAYeKpZ--
