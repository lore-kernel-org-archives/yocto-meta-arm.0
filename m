Subject: Re: [PATCH] arm-bsp/u-boot: fix THISDIR name collision in u-boot_%.bbappend
To: meta-arm@lists.yoctoproject.org
From: "Nathan Dunne" <Nathan.Dunne@arm.com>
X-Originating-Location: Hampstead, England, GB (86.25.195.241)
X-Originating-Platform: Linux Firefox 80
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 18 Sep 2020 01:24:41 -0700
References: <20200917164443.GA19155@denix.org>
In-Reply-To: <20200917164443.GA19155@denix.org>
Message-ID: <24522.1600417481828897086@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="3G4RA6UpYntqrEm5WSiZ"

--3G4RA6UpYntqrEm5WSiZ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2020 at 09:44 AM, Denys Dmytriyenko wrote:

>=20
> On Thu, Sep 17, 2020 at 09:58:17AM +0000, Nathan Dunne wrote:
>=20
>> Renamed ${THISDIR} user defined variable to ${THIS_DIR}, to prevent
>> it from breaking ${THISDIR} macro in subsequent u-boot .bbappend files
>>=20
>> Change-Id: I4473ee5c3ac5c0aea9310557294cc9757579bdf1
>> Issue-Id: SCM-1302
>> Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
>> ---
>> meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
>> b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
>> index bf57242..5fc3723 100644
>> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
>> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
>> @@ -1,7 +1,7 @@
>> # Machine specific u-boot
>>=20
>> -THISDIR :=3D "${THISDIR}"
>> -FILESEXTRAPATHS_prepend =3D "${THISDIR}/files/:${THISDIR}/${BP}:"
>> +THIS_DIR :=3D "${THISDIR}"
>> +FILESEXTRAPATHS_prepend =3D "${THIS_DIR}/files/:${THIS_DIR}/${BP}:"
>> FILESEXTRAPATHS_prepend_fvp-base :=3D "${THISDIR}/files/fvp-common:"
>> FILESEXTRAPATHS_prepend_foundation-armv8 :=3D "${THISDIR}/files/fvp-com=
mon:"
>=20
>=20
> Why not make these 3 lines above that prepend to FILESEXTRAPATHS
> consistent?

Only the line with ${BP} needs the user defined THIS_DIR because it can't =
use immediate expansion due to ${BP} containing ${PV}, which is only set af=
ter parsing. This is not a problem for the other two lines, hence no need t=
o make use of the ${THIS_DIR} intermediate variable. ${BP} is only being ad=
ded to FILESEXTRAPATHS because meta-arm master currently needs to support u=
-boot from oe-core master and dunfell, so once we can drop support for mult=
iple versions there will be less modifications to make if the other two lin=
es aren't touched

The problem is the intermediate variable previously being named "THISDIR",=
 as it should not be manually set and causes subsequent u-boot bbappend fil=
es using ${THISDIR} to reference this file's directory instead of their own=
.

--3G4RA6UpYntqrEm5WSiZ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2020 at 09:44 AM, Denys Dmytriyenko wrote:<br />
<blockquote>On Thu, Sep 17, 2020 at 09:58:17AM +0000, Nathan Dunne wrote:<=
br />
<blockquote>Renamed ${THISDIR} user defined variable to ${THIS_DIR}, to pr=
event<br />it from breaking ${THISDIR} macro in subsequent u-boot .bbappend=
 files<br /><br />Change-Id: I4473ee5c3ac5c0aea9310557294cc9757579bdf1<br /=
>Issue-Id: SCM-1302<br />Signed-off-by: Nathan Dunne &lt;Nathan.Dunne@arm.c=
om&gt;<br />---<br />meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend | 4 =
++--<br />1 file changed, 2 insertions(+), 2 deletions(-)<br /><br />diff -=
-git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/rec=
ipes-bsp/u-boot/u-boot_%.bbappend<br />index bf57242..5fc3723 100644<br />-=
-- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend<br />+++ b/meta-arm-=
bsp/recipes-bsp/u-boot/u-boot_%.bbappend<br />@@ -1,7 +1,7 @@<br /># Machin=
e specific u-boot<br /><br />-THISDIR :=3D "${THISDIR}"<br />-FILESEXTRAPAT=
HS_prepend =3D "${THISDIR}/files/:${THISDIR}/${BP}:"<br />+THIS_DIR :=3D "$=
{THISDIR}"<br />+FILESEXTRAPATHS_prepend =3D "${THIS_DIR}/files/:${THIS_DIR=
}/${BP}:"<br />FILESEXTRAPATHS_prepend_fvp-base :=3D "${THISDIR}/files/fvp-=
common:"<br />FILESEXTRAPATHS_prepend_foundation-armv8 :=3D "${THISDIR}/fil=
es/fvp-common:"</blockquote>
Why not make these 3 lines above that prepend to FILESEXTRAPATHS consisten=
t?</blockquote>
<p>Only the line with ${BP} needs the user defined THIS_DIR because it can=
't use immediate expansion due to ${BP} containing ${PV}, which is only set=
 after parsing. This is not a problem for the other two lines, hence no nee=
d to make use of the ${THIS_DIR} intermediate variable. ${BP} is only being=
 added to FILESEXTRAPATHS because meta-arm master currently needs to suppor=
t u-boot from oe-core master and dunfell, so once we can drop support for m=
ultiple versions there will be less modifications to make if the other two =
lines aren't touched</p>
<p>The problem is the intermediate variable previously being named "THISDI=
R", as it should not be manually set and causes subsequent u-boot bbappend =
files using ${THISDIR} to reference this file's directory instead of their =
own.</p>

--3G4RA6UpYntqrEm5WSiZ--
